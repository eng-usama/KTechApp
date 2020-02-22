import 'package:flutter/material.dart';
import 'package:k_tech/NetworkingHttp/UserAuth.dart';
import 'package:k_tech/Shared/constants.dart';
import 'package:k_tech/Shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String firstName = '';
  String secondName = '';
  String password = '';
  String email = '';
  String mobile = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.cyan[100],
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'First name'),
                  validator: (val) => val.isEmpty ? 'Please enter your first name' : null,
                  onChanged: (val) {
                    setState(() => firstName = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Family name'),
                  validator: (val) => val.isEmpty ? 'Please enter your family name' : null,
                  onChanged: (val) {
                    setState(() => secondName = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'email'),
                  validator: (val) => val.isEmpty ? 'Please enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'password'),
                  obscureText: true,
                  validator: (val) => val.length < 6 ? 'Please enter a password 6+ chars long' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: textInputDecoration.copyWith(hintText: 'mobile'),
                  validator: (val) => val.length < 6 ? 'Please enter write mobile number' : null,
                  onChanged: (val) {
                    setState(() => mobile = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.cyan,
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                        setState(() => loading = true);
                        dynamic result = await _auth.registerWithEmailAndPassword(email, password,'$firstName $secondName',mobile,['0','1']);
                        if(result == null) {
                          setState(() {
                            loading = false;
                            error = 'Please supply a valid email';
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
                SizedBox(height: 15,),
                Container(alignment: Alignment.center,
                  child: FlatButton.icon(
                    icon: Icon(Icons.person,color: Colors.white,),
                    label: Text('Have an account ?' ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                    onPressed: () => widget.toggleView(),
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}