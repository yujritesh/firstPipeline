import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              emailField(),
              passwordField(),
              Container(margin: EdgeInsets.only(bottom: 16.0)),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'abc@abc.com',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton() {
    return StreamBuilder(
        stream: bloc.submitButton,
        builder: (context, snapshot) {
          return RaisedButton(
            onPressed: () {
              if (snapshot.hasData) {
                bloc.submit;
                Navigator.pushNamed(context, '/dashboard');
              } else {
                return null;
              }
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Submit'),
          );
        });
  }
}
