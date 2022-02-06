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
      name: "Recommended Flutter course",
      url: "https://www.udemy.com/course/flutter-bootcamp-with-dart/",
    description: "This is a flutter course I used and found really helpful.I could easily make a project after doing this.",
    uploadedBy: "Archi Somani"
      ),
  Resources(
    name: "Good DSA practice questions",
    url: "https://docs.google.com/spreadsheets/d/1-wKcV99KtO91dXdPkwmXGTdtyxAfk1mbPXQg81R9sFE/edit#gid=0",
    description: "This sheet has important Leetcode questions from all DSA Topics to practice regularly",
      uploadedBy: "Priya Singh"
  ),
  Resources(
    name: "Good Django Playlist",
    url: "https://www.youtube.com/playlist?list=PL-osiE80TeTtoQCKZ03TU5fNfx2UY6U4p",
    description: "Here's a free resource to get started with learning Django.",
      uploadedBy: "Mahima Kulshreshta"
  ),
  Resources(
    name: "DSA Course Python",
    url: "https://www.youtube.com/watch?v=pkYVOmU3MgA&t=30486s",
    description: "It is very rare to find good DSA resource in Python language.This is a great course.",
      uploadedBy: "Anushka Prasad"
  ),
  Resources(
    name: "Interview Preparation",
    url: "https://takeuforward.org/interviews/must-do-questions-for-dbms-cn-os-interviews-sde-core-sheet/",
    description: "This sheet by Striver(youtuber) came in very handy to me while preparing for interviews",
      uploadedBy: "Garvita"
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
    height: 490,
    margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(20),0,getProportionateScreenWidth(20),0),
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
