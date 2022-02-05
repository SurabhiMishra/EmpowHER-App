import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/opportunities.dart';
import 'package:url_launcher/url_launcher.dart';
class JobListTile extends StatelessWidget {
 // const JobListTile({Key? key}) : super(key: key);

  const JobListTile({required this.oppor}) ;
  final Opportunities oppor;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      // tileColor: report.isPothole? Colors.greenAccent:Colors.redAccent,
      title: Text("${oppor.name}"),
      subtitle: Text('Deadline - ${oppor.deadline}'),
      trailing: Icon(Icons.chevron_right, color: Colors.black,),
      onTap: ()=> _launchURL(oppor.url),
    );
  }

  void _launchURL(String? url) async {
    if(url != null) {
      if (!await launch(url)) throw 'Could not launch $url';
    }
  }
}
