import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        autovalidate: true,
        child: Column(
          children: <Widget>[emailField(), passWordField(), submitButton()],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email Address',
          hintText: 'you@example.com',
          icon: Icon(Icons.email, color: Colors.grey)),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      //validator: (){

      //},
    );
  }

  Widget passWordField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: '8-16 Character',
          icon: Icon(Icons.vpn_key, color: Colors.grey)),
      maxLength: 16,
      maxLines: 1,
      textInputAction: TextInputAction.done,
      obscureText: true,
    );
  }

  Widget submitButton() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: RaisedButton.icon(
          disabledColor: Colors.grey,
          color: Colors.blue,
          onPressed: () {
            _formKey.currentState.validate();
          },
          icon: Icon(
            Icons.done,
            size: 40.0,
            color: Colors.green,
          ),
          label: Text(
            'Submit',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25.0),
          )),
    );
  }
}
