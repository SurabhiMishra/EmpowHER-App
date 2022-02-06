import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/story/components/stories.dart';

class StoryListTile extends StatelessWidget {
  // const StoryListTile({Key? key}) : super(key: key);

  const StoryListTile({required this.oppor});

  final Stories oppor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ListTile(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        tileColor: kSecondaryColor.withOpacity(0.1),
        title: Center(
            child: Text(
          "${oppor.name}",
          textAlign: TextAlign.center,
        )),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Author: ${oppor.by}",
                ),
                Text(
                  "Company: ${oppor.company}",
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("${oppor.story}"),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Tags - '),
                Flexible(child: Text(oppor.tags)),
                Row(
                  children: [
                    Text('${oppor.upvotes}'),
                    Icon(Icons.thumb_up_alt)
                  ],
                ),
                Row(
                  children: [
                    Text('${oppor.downvotes}'),
                    Icon(Icons.thumb_down_alt)
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
