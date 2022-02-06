import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/mentor/mentor.dart';
import 'package:shop_app/screens/mentor/mentor_pic.dart';
import 'package:shop_app/story/components/stories.dart';

class MentorListTile extends StatelessWidget {
  // const MentorListTile({Key? key}) : super(key: key);

  const MentorListTile({required this.mentor});

  final Mentor mentor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ListTile(
        onTap: () {},
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        tileColor: kSecondaryColor.withOpacity(0.1),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(mentor.image),
                radius: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Center(
                  child: Text(
                "${mentor.name}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              )),
            ],
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Organization: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Flexible(
                  child: Text(
                    "${mentor.organization}",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Specialization - ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Flexible(child: Text(mentor.specialization)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Consultations charges: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$${mentor.fees}",
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                ),
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Appointment Request Sent '),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[
                              Text(
                                  'The mentor will approve your request soon.\n\nPlease make sure you have enabled notifications.'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text(
                              'Ok',
                              style: TextStyle(color: kPrimaryColor),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.perm_contact_calendar),
                    SizedBox(width: 10),
                    Text(
                      "Book an Appointment",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
