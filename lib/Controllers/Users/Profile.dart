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
    final DatabaseService _databaseService = DatabaseService(uid: user.uid);
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
                      icon: Icon(Icons.person,color: Colors.deepPurple[900]),
                      label: Text('logout',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.deepPurple[900]),),
                      onPressed: () async {
                        await _auth.signOut();
                      },
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Image.asset('assets/logo.png',),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Welcome ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepPurple[900]),),
                          Container(child: Text(snapshot.data.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.cyan[800]),),),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('Email : ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepPurple[900]),),
                            Container(child: Text(snapshot.data.email,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.cyan[800]),),),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('Mobile : ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepPurple[900]),),
                            Container(child: Text(snapshot.data.mobile,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.cyan[800]),),),
                          ],
                        ),
                      ),

//                      FlatButton(
//                        child: Text(snapshot.data.subjects[0]),
//                        onPressed: (){
//                          _databaseService.updateUserData(snapshot.data.name, snapshot.data.email, snapshot.data.mobile, ["subject 2"]);
//                        },
//                      )
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