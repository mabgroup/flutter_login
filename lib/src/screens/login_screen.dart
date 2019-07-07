import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin{
  final _formKey = GlobalKey<FormState>();
  final focus = FocusNode();
  String Email = "";
  String Password = "";

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
      autofocus: true,
      onFieldSubmitted: (v){
        FocusScope.of(context).requestFocus(focus);
      },
      validator: validateEmail,
      onSaved: (String value) {
        print(value);
        Email = value;
      },
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
      focusNode: focus,
      validator: validatePassword,
      onSaved: (String value) {
        print(value);
        Password = value;
      },
    );
  }

  Widget submitButton() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: RaisedButton.icon(
          disabledColor: Colors.grey,
          color: Colors.blue,
          onPressed: () {
            var valid = _formKey.currentState.validate();
            if (!valid) {
              _formKey.currentState.reset();
              return;
            }

            _formKey.currentState.save();

            print("Email : $Email & pass is $Password");
          },
          icon: Icon(
            Icons.done,
            size: 30.0,
            color: Colors.white70,
          ),
          label: Text(
            'Done',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18.0),
          )),
    );
  }
}
