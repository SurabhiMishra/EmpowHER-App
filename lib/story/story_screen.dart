import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/components/custom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/home/components/home_header.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/story/components/add_story.dart';
import 'package:shop_app/story/components/story_list_tile.dart';
import 'package:shop_app/screens/home/components/list_item_builder.dart';
import 'package:shop_app/story/components/stories.dart';

List<Stories> opporValues = [
  Stories(
      name: "My First Day at Work",
      company: "Amazon",
      by: "Surabhi Mishra",
      story:
          "A woman pursuing a degree in a STEM subject at a leading UK university for the academic year 2022-2023 lorem ipsum lorem ipsum ..........",
      upvotes: 8,
      downvotes: 3,
      tags: "#WorkCulture"),
  Stories(
      name: "Horrifying Boss",
      company: "Staging Company",
      by: "Surabhi Mishra",
      story:
          "a woman pursuing a degree in a STEM subject at a leading UK university for the academic year 2022-2023",
      upvotes: 12,
      downvotes: 1,
      tags: "#Harrasment"),
  Stories(
      name: "Are our countrymen really growing?",
      company: "Bad Company",
      by: "Surabhi Mishra",
      story:
          "a woman pursuing a degree in a STEM subject at a leading UK university for the academic year 2022-2023",
      upvotes: 14,
      downvotes: 1,
      tags: "#GenderInequality"),
];

class StoryScreen extends StatefulWidget {
  static String routeName = "/story";

  const StoryScreen({Key? key}) : super(key: key);

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContents(context),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.story),
    );
  }
}

Widget _buildContents(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(40)),
        HomeHeader(),
        Container(
          // height: 90,
          width: double.infinity,
          margin: EdgeInsets.all(getProportionateScreenWidth(20)),
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(15),
          ),
          decoration: BoxDecoration(
            color: Color(0xFF800080),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              "From the Employees",
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          height: 450,
          margin: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: Stack(children: [
            StreamBuilder<List<Stories>>(
              stream: opporStream(),
              builder: (context, snapshot) {
                return ListItemBuilder<Stories>(
                  snapshot: snapshot,
                  itemBuilder: (context, oppor) => StoryListTile(
                    oppor: oppor,
                    // onTap: () => _showReport(context,report),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              // add your floating action button
              child: Opacity(
                opacity: 0.6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    backgroundColor: kPrimaryColor,
                    onPressed: () =>
                        Navigator.pushNamed(context, AddStory.routeName),
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ],
    ),
  );
}

Stream<List<Stories>> opporStream() {
  return Stream.value(opporValues);
}
