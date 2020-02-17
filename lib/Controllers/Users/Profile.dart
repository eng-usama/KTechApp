import 'package:flutter/material.dart';
import 'package:k_tech/NetworkingHttp/UsersHttp/UserAuth.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Container(
      child: Scaffold(
        backgroundColor: Colors.brown[50],
//        appBar: AppBar(
//          title: Text('Brew Crew'),
//          backgroundColor: Colors.brown[400],
//          elevation: 0.0,
//          actions: <Widget>[
//          ],
//        ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              child: FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ),
            Center(child: Container(child: Text(user.email),))
          ],
        ),
      ),
      ),
    );
  }
}