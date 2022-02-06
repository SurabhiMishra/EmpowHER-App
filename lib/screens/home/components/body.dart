import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/components/add_opportunity.dart';
import 'package:shop_app/screens/home/components/job_list_tile.dart';
import 'package:shop_app/screens/home/components/list_item_builder.dart';
import 'package:shop_app/screens/home/components/opportunities.dart';

import '../../../size_config.dart';

import 'home_banner.dart';
import 'home_header.dart';

List<Opportunities> opporValues = [
  Opportunities(
      name: "GHC Scholarships",
      url: "https://ghc.anitab.org/attend/scholarships/",
      eligibility:
          "A full-time student in an accredited university degree at the time of the celebration sept 22,2022",
      deadline: "30 March"),
  Opportunities(
    name: "British Council scholarships for women in STEM",
    url:
        "https://www.britishcouncil.org/study-work-abroad/in-uk/scholarship-women-stem?gclid=Cj0KCQiA3fiPBhCCARIsAFQ8QzVNpqjm1_vE8RAd8EUoAN9qLr5yy7KDB6zMM8FQ2Y5OyV0ux2ZNQ0UaAuWxEALw_wcB&gclsrc=aw.ds",
    deadline: "14 Feb",
    eligibility:
        "A woman pursuing a degree in a STEM subject at a leading UK university for the academic year 2022-2023",
  ),
  Opportunities(
    name: "Women Techmakers",
    url:
        "https://www.womentechmakers.com/",
    deadline: "14 Feb",
    eligibility:
        "A woman persuing BTech in CS or related fields and in the batch of 2023 or 2024",
  ),
];

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
      height: 450,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Stack(children: [
        StreamBuilder<List<Opportunities>>(
          stream: opporStream(),
          builder: (context, snapshot) {
            return ListItemBuilder<Opportunities>(
              snapshot: snapshot,
              itemBuilder: (context, oppor) => JobListTile(
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
                    Navigator.pushNamed(context, AddOpportunity.routeName),
                child: Icon(Icons.add),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Stream<List<Opportunities>> opporStream() {
    return Stream.value(opporValues);
  }
}
