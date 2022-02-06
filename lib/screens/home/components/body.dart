import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/add_opportunity.dart';
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
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          HomeHeader(),
          HomeBanner(),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      height: 450,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: StreamBuilder<List<Opportunities>>(
        stream: opporStream(),
        builder: (context, snapshot) {
          return ListItemBuilder<Opportunities>(
            snapshot: snapshot,
            itemBuilder: (context, oppor) =>
                JobListTile(
                  oppor: oppor,
                  // onTap: () => _showReport(context,report),
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
            name: "GHC Scholarships",
            url: "https://ghc.anitab.org/attend/scholarships/",
            eligibility: "a woman pursuing a degree in a STEM subject at a leading UK university for the academic year 2022-2023",
            deadline: "30 March"),
        Opportunities(
            name: "British Council scholarships for women in STEM",
            url: "https://www.britishcouncil.org/study-work-abroad/in-uk/scholarship-women-stem?gclid=Cj0KCQiA3fiPBhCCARIsAFQ8QzVNpqjm1_vE8RAd8EUoAN9qLr5yy7KDB6zMM8FQ2Y5OyV0ux2ZNQ0UaAuWxEALw_wcB&gclsrc=aw.ds",
            deadline: "14 Feb",
          eligibility: "a woman pursuing a degree in a STEM subject at a leading UK university for the academic year 2022-2023",
        ),
        Opportunities(
          name: "British Council scholarships for women in STEM",
          url: "https://www.britishcouncil.org/study-work-abroad/in-uk/scholarship-women-stem?gclid=Cj0KCQiA3fiPBhCCARIsAFQ8QzVNpqjm1_vE8RAd8EUoAN9qLr5yy7KDB6zMM8FQ2Y5OyV0ux2ZNQ0UaAuWxEALw_wcB&gclsrc=aw.ds",
          deadline: "14 Feb",
          eligibility: "a woman pursuing a degree in a STEM subject at a leading UK university for the academic year 2022-2023",
        ),
        Opportunities(
          name: "British Council scholarships for women in STEM",
          url: "https://www.britishcouncil.org/study-work-abroad/in-uk/scholarship-women-stem?gclid=Cj0KCQiA3fiPBhCCARIsAFQ8QzVNpqjm1_vE8RAd8EUoAN9qLr5yy7KDB6zMM8FQ2Y5OyV0ux2ZNQ0UaAuWxEALw_wcB&gclsrc=aw.ds",
          deadline: "14 Feb",
          eligibility: "a woman pursuing a degree in a STEM subject at a leading UK university for the academic year 2022-2023",
        ),
      ]
    );
  }




}
