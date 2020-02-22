import 'package:flutter/material.dart';
import 'package:k_tech/Models/User/User.dart';
import 'package:k_tech/NetworkingHttp/DatabaseHttp.dart';
import 'package:k_tech/NetworkingHttp/UserAuth.dart';
import 'package:k_tech/Shared/loading.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: Colors.brown[50],
//        appBar: AppBar(
//          title: Text('Brew Crew'),
//          backgroundColor: Colors.brown[400],
//          elevation: 0.0,
//          actions: <Widget>[
//          ],
//        ),
    body: StreamBuilder<UserProfile>(
      stream: DatabaseService(uid: user.uid).userProfile,
      builder: (context, snapshot) {
        print(snapshot.data);
        if(snapshot.hasData)
          {
            return SingleChildScrollView(
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
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Welcome ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.cyan),),
                          Container(child: Text(snapshot.data.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black45),),),
                        ],
                      ),

                    ],
                  )
                ],
              ),
            );
          }
        else {
          return Loading();
        }

      }
    ),
    );
  }
}