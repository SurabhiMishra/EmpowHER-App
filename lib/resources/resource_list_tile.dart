import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/resources/resources.dart';
import 'package:shop_app/screens/home/components/opportunities.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourceListTile extends StatelessWidget {
  // const JobListTile({Key? key}) : super(key: key);

  const ResourceListTile({required this.resources});

  final Resources resources;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ListTile(
        trailing: Icon(Icons.chevron_right_outlined),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        tileColor: kSecondaryColor.withOpacity(0.1),
        title: Center(
            child: Text(
          "${resources.name}",
          textAlign: TextAlign.center,
        )),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('UploadedBy - ${resources.uploadedBy}'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Description - '),
                Flexible(
                    child: Text(
                        resources.description)),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),

        onTap: () => _launchURL(resources.url),
      ),
    );
  }

  void _launchURL(String? url) async {
    if (url != null) {
      if (!await launch(url)) throw 'Could not launch $url';
    }
  }
}
