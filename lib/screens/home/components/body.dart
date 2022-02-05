import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/job_list_tile.dart';
import 'package:shop_app/screens/home/components/list_item_builder.dart';
import 'package:shop_app/screens/home/components/opportunities.dart';

import '../../../size_config.dart';

import 'home_banner.dart';
import 'home_header.dart';



class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            HomeBanner(),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      height: 700,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: StreamBuilder<List<Opportunities>>(
        stream: opporStream(),
        builder: (context, snapshot) {
          return ListItemBuilder<Opportunities>(
            snapshot: snapshot,
            itemBuilder: (context, oppor) =>
                Dismissible(
                  key: Key('oppor-${oppor.url}'),
                  background: Container(color: Colors.red),
                  // direction: DismissDirection.endToStart,
                  // onDismissed: (direction) => _delete(context, report),
                  child: JobListTile(
                    oppor: oppor,
                    // onTap: () => _showReport(context,report),
                  ),
                ),
          );
        },
      ),
    );
  }

  Stream<List<Opportunities>>opporStream() {
    return Stream.value(
      [
        Opportunities(
            name: "Apac Scholarship",
            url: "https://google.com",
            deadline: "14 Feb"),
        Opportunities(
            name: "Apac Scholarship",
            url: "hello.com",
            deadline: "14 Feb"),
        Opportunities(
            name: "Apac Scholarship",
            url: "hello.com",
            deadline: "14 Feb"),
        Opportunities(
            name: "Apac Scholarship",
            url: "hello.com",
            deadline: "14 Feb")
      ]
    );
  }
}
