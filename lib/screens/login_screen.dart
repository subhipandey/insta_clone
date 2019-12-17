import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Instgram', 
            style: TextStyle(fontFamily:'Billabong',
            fontSize: 50.0,
            ),
            ),
            Form(

              key: _formKey,
              child: Column(mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  decoration:InputDecoration(labelText: 'Email'),
                  validator: (input) => !input.contains('@')
                  ? 'Please enter a valid email'
                            : null,
                  )
              ],
              )
              
            )
          ],
        ),
      ),
      
    );
  }
}