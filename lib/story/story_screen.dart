import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/home/components/home_header.dart';
import 'package:shop_app/size_config.dart';

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
    ;
  }
}

Widget _buildContents(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(20)),
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
                  "Tell us your Story",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
        ),
      ],
    ),
  );
}
