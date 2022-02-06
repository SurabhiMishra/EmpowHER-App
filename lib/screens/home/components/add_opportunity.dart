import 'package:flutter/material.dart';
class AddOpportunity extends StatelessWidget {
  static String routeName = "/addOpportunity";
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _elgController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _buildChildren(),
    );
  }

  Widget _buildChildren() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: (
      Column(
        children: [
          SizedBox(height: 30,),
          Text('Add an Opportunity',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),),
          SizedBox(height: 25.0),
          _buildNameTextField(),
          SizedBox(height: 25.0),
          _buildUrlTextField(),
          SizedBox(height: 25.0),
          _buildEligibilityTextField(),
          SizedBox(height: 8.0),
          FlatButton(
            child: Text(
             "Submit"
            ),
            onPressed: (){},
          ),
        ],
      )
      ),
    );
  }

  TextField _buildNameTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Name',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide( width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _nameController,
      // focusNode: _emailFocus,
      //cursorColor: Colors.black,
      autocorrect: false,
      style: (TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400
      )),
    );
  }
  TextField _buildUrlTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'URL',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide( width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _urlController,
      // focusNode: _emailFocus,
      //cursorColor: Colors.black,
      autocorrect: false,
      style: (TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400
      )),
    );
  }
  TextField _buildEligibilityTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Eligibility',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide( width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _elgController,
      autocorrect: false,
      style: (TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400
      )),
    );
  }

}
