import 'package:flutter/material.dart';
import 'package:k_tech/NetworkingHttp/UsersHttp/UserAuth.dart';
import 'package:k_tech/Shared/constants.dart';
import 'package:k_tech/Shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.cyan[200],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(hintText: 'email'),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      obscureText: true,
                      decoration: textInputDecoration.copyWith(hintText: 'password'),
                      validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                        color: Colors.cyan,
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if(_formKey.currentState.validate()){
                            setState(() => loading = true);
                            dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                            if(result == null) {
                              setState(() {
                                loading = false;
                                error = 'Could not sign in with those credentials';
                              });
                            }
                          }
                        }
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 18.0,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40,),
                    Container(alignment: Alignment.center,
                      child: FlatButton.icon(
                        icon: Icon(Icons.person,color: Colors.white,),
                        label: Text('Don\'t have an account ?' ,style: TextStyle(color: Colors.white),),
                        onPressed: () => widget.toggleView(),
                      ),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}