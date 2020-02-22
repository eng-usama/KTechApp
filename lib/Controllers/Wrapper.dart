import 'package:flutter/material.dart';
import 'package:k_tech/NetworkingHttp/UserAuth.dart';
import 'package:k_tech/Shared/loading.dart';
import 'package:provider/provider.dart';

import 'Users/Authenticate.dart';
import 'Users/Profile.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else{
      print('uid : ${user.uid} ,email : ${user.email}');
      return Profile();
    }
  }
}
