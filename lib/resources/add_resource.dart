import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/resources/resources.dart';
import 'package:shop_app/resources/resources_screen.dart';
import 'package:shop_app/screens/home/components/body.dart';
import 'package:shop_app/screens/home/components/opportunities.dart';

class AddResource extends StatelessWidget {
  static String routeName = "/addResource";
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  final TextEditingController _uplController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post a Resource',style: TextStyle(color: Colors.white),),
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
          _buildDescriptionTextField(),
          SizedBox(height: 25.0),
          _builduploadTextField(),
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
    resValues.add(Resources(
        name: _nameController.text,
        url: 'https://' + _urlController.text,
        description: _desController.text,
        uploadedBy: _uplController.text));
    Navigator.of(context).pop();
  }

  TextField _buildNameTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Name',
        hintText: 'Madonna',
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
        hintText: 'abc.com',
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

  TextField _builduploadTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Description',
        hintText: 'xyz',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _desController,
      // focusNode: _emailFocus,
      //cursorColor: Colors.black,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }

  TextField _buildDescriptionTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'uploadedBy',
        hintText: 'abc',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _uplController,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }
}

