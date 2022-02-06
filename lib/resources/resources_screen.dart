import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_bottom_nav_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/resources/add_resource.dart';
import 'package:shop_app/resources/resource_list_tile.dart';
import 'package:shop_app/resources/resources.dart';
import 'package:shop_app/screens/home/components/add_opportunity.dart';
import 'package:shop_app/screens/home/components/home_header.dart';
import 'package:shop_app/screens/home/components/list_item_builder.dart';
import 'package:shop_app/size_config.dart';

List<Resources> resValues = [
  Resources(
      name: "GHC Scholarships",
      url: "https://ghc.anitab.org/attend/scholarships/",
    description: "des",
    uploadedBy: "xyz"
      ),
  Resources(
    name: "GHC Scholarships",
    url: "https://ghc.anitab.org/attend/scholarships/",
    description: "des",
      uploadedBy: "xyz"
  ),
  Resources(
    name: "GHC Scholarships",
    url: "https://ghc.anitab.org/attend/scholarships/",
    description: "des",
      uploadedBy: "xyz"
  ),
];
class ResourcesScreen extends StatefulWidget {
  static String routeName = "/resources";

  @override
  _ResourcesScreenState createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContents(context),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.resources),
    );
    ;
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
          child:
              Center(
                child: Text(
                  "Resources",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

        ),
        _buildContent(context),
      ],
    ),
  );
}

Widget _buildContent(BuildContext context) {
  return Container(
    height: 450,
    margin: EdgeInsets.all(getProportionateScreenWidth(20)),
    child: Stack(children: [
      StreamBuilder<List<Resources>>(
        stream: resStream(),
        builder: (context, snapshot) {
          return ListItemBuilder<Resources>(
            snapshot: snapshot,
            itemBuilder: (context, resource) => ResourceListTile(
              resources: resource,
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
                  Navigator.pushNamed(context, AddResource.routeName),
              child: Icon(Icons.add),
            ),
          ),
        ),
      ),
    ]),
  );
}

Stream<List<Resources>> resStream() {
  return Stream.value(resValues);
}
