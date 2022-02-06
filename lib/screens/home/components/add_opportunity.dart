import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/components/body.dart';
import 'package:shop_app/screens/home/components/opportunities.dart';

class AddOpportunity extends StatelessWidget {
  static String routeName = "/addOpportunity";
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _elgController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post an Opportunity',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(child: _buildChildren(context)),
    );
  }

  Widget _buildChildren(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: (Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 25.0),
          _buildNameTextField(),
          SizedBox(height: 25.0),
          _buildUrlTextField(),
          SizedBox(height: 25.0),
          _buildEligibilityTextField(),
          SizedBox(height: 25.0),
          _buildDeadlineTextField(),
          SizedBox(height: 18.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: kPrimaryColor, textStyle: TextStyle(fontSize: 17)),
            onPressed: () => _submit(context),
            child: Text(
              "Submit",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      )),
    );
  }

  void _submit(BuildContext context) {
    opporValues.add(Opportunities(
        name: _nameController.text,
        url: 'https://' + _urlController.text,
        deadline: _deadlineController.text,
        eligibility: _elgController.text));
    Navigator.of(context).pop();
  }

  TextField _buildNameTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Name',
        hintText: 'APAC scholarship',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _nameController,
      // focusNode: _emailFocus,
      //cursorColor: Colors.black,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }

  TextField _buildUrlTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'URL',
        hintText: 'apac.com',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _urlController,
      // focusNode: _emailFocus,
      //cursorColor: Colors.black,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }

  TextField _buildDeadlineTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Deadline',
        hintText: '17/01/2023',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _deadlineController,
      // focusNode: _emailFocus,
      //cursorColor: Colors.black,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }

  TextField _buildEligibilityTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Eligibility',
        hintText: '2023 Graduates',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _elgController,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }
}
