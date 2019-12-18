import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {

static final String id = 'signup_screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

final _formKey = GlobalKey<FormState>();
String _name, _email, _password;

_submit(){

  if (_formKey.currentState.validate()){
    _formKey.currentState.save();
    print(_name);
    print(_email);
    print(_password);
  }
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Instagram', 
            style: TextStyle(fontFamily:'Billabong',
            fontSize: 50.0,
            ),
            ),
            Form(

              key: _formKey,
              child: Column(mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                  child: TextFormField(
                    decoration:InputDecoration(labelText: 'Name'),
                    validator: (input) => input.trim().isEmpty
                    ? 'Please enter a valid name': null,
                    onSaved: (input) => _name = input,
                    ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                  child: TextFormField(
                    decoration:InputDecoration(labelText: 'Email'),
                    validator: (input) => !input.contains('@')
                    ? 'Please enter a valid email': null,
                    onSaved: (input) => _email = input,
                    ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                  child: TextFormField(
                    decoration:InputDecoration(labelText: 'Password'),
                    validator: (input) => input.length < 6
                    ? 'Password should be of 6 Characters': null,
                    onSaved: (input) => _email = input,
                    obscureText: true,
                    ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: 250,
                  child: FlatButton(
                  onPressed: _submit, 
                  color: Colors.blue,
                  padding: EdgeInsets.all(10.0),
                  child: Text('Sign Up', style: TextStyle(
                  color: Colors.white, 
                  fontSize: 10.0
                  ),
                  ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: 250,
                  child: FlatButton(
                  onPressed: () => Navigator.pop(context),
                  color: Colors.blue,
                  padding: EdgeInsets.all(10.0),
                  child: Text('Back to Login', style: TextStyle(
                  color: Colors.white, 
                  fontSize: 10.0
                  ),
                  ),
                  ),
                ),
              ],
              )
              
            )
          ],
        ),
      ),
      
    );
      
    
  }
}