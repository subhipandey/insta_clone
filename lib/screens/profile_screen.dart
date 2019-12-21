import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
        Padding(
          padding:  EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
          child: Row(
            children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage('https://avatars2.githubusercontent.com/u/33100167?s=460&v=4'),
            ),
            Expanded(
            child: Column(
                children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                      Text(
                        '52', 
                      style: TextStyle(
                        fontSize: 18.0, 
                        fontWeight: FontWeight.w600,
                        ),
                        ),
                        Text('Posts', style: TextStyle(color: Colors.black54),
                        ),
                    ],
                    ),
                    Column(
                      children: <Widget>[
                      Text('345', 
                      style: TextStyle(
                        fontSize: 18.0, 
                        fontWeight: FontWeight.w600,
                        ),
                        ),
                        Text('followers', style: TextStyle(color: Colors.black54),
                        ),
                    ],
                    ),
                    Column(
                      children: <Widget>[
                      Text('667', 
                      style: TextStyle(
                        fontSize: 18.0, 
                        fontWeight: FontWeight.w600,
                        ),
                        ),
                        Text('following', style: TextStyle(color: Colors.black54),
                        ),
                    ],
                    )
                  ],
                )
              ],
              ),
            )
          ],
          ),
        )
      ],
      )
    );
  }
}