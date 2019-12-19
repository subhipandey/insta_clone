import 'package:flutter/material.dart';
import 'package:insta_clone/screens/signup_screen.dart';
import 'package:insta_clone/services/auth_service.dart';

class LoginScreen extends StatefulWidget {

static final String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final _formKey = GlobalKey<FormState>();
String _email, _password;

_submit(){

  if (_formKey.currentState.validate()){
    _formKey.currentState.save();
    AuthService.login(_email, _password);
  }
}



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
                  child: Text('Login', style: TextStyle(
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
                  onPressed: () => Navigator.pushNamed(context, SignupScreen.id), 
                  color: Colors.blue,
                  padding: EdgeInsets.all(10.0),
                  child: Text('Signup', style: TextStyle(
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