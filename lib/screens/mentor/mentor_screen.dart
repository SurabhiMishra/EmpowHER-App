import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_bottom_nav_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/home/components/home_header.dart';
import 'package:shop_app/screens/home/components/list_item_builder.dart';
import 'package:shop_app/screens/mentor/mentor.dart';
import 'package:shop_app/screens/mentor/mentor_list_tile.dart';
import 'package:shop_app/size_config.dart';

List<Mentor> mentorValues = [
  Mentor(
    name: "Surabhi Mishra",
    organization: "Bloomberg (SDE || Exp: 4 years)",
    specialization: "App Development",
    image: "assets/images/bunny.png",
    fees: "80",
  ),
  Mentor(
    name: "Garvita Gulati",
    organization: "Salesforce (SDE 2 || Exp: 5 years)",
    specialization: "App Development, Django Developer",
    image: "assets/images/garvita.jpg",
    fees: "65",
  ),
  Mentor(
    name: "Jennifer Lownes",
    organization: "Google (Product Manager)",
    specialization: "Agile Software Development, Team Management",
    image: "assets/images/profile.png",
    fees: "45",
  ),
  Mentor(
    name: "Rouchelle Luang",
    organization: "Samsung (SDE 3 || Exp: 7 years)",
    specialization: "Pipelining and DevOps",
    image: "assets/images/profile2.jpg",
    fees: "45",
  ),
];

class MentorScreen extends StatefulWidget {
  static String routeName = "/mentor";

  const MentorScreen({Key? key}) : super(key: key);

  @override
  _MentorScreenState createState() => _MentorScreenState();
}

class _MentorScreenState extends State<MentorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContents(context),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.mentor),
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
              "We're here to help",
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          height: 490,
          margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(20), 0,
              getProportionateScreenWidth(20), 0),
          child: Stack(children: [
            StreamBuilder<List<Mentor>>(
              stream: mentorStream(),
              builder: (context, snapshot) {
                return ListItemBuilder<Mentor>(
                  snapshot: snapshot,
                  itemBuilder: (context, mentor) => MentorListTile(
                    mentor: mentor,
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
                    onPressed: () {},
                    child: Icon(
                      Icons.live_help_outlined,
                      size: 25,
                    ),
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

Stream<List<Mentor>> mentorStream() {
  return Stream.value(mentorValues);
}
