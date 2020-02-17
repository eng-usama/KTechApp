import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


//app color

Color appColor = Colors.black;

String userLanguage = "en";


void  checkConnectivity()
async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
    }
  } on SocketException catch (_) {
    print('not connected');
    Fluttertoast.showToast(msg: 'Please check internet connectivity.',gravity: ToastGravity.CENTER);
  }
}


Future<bool> checkInternetConnectivity() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
      return true;
    }
  } on SocketException catch (_) {
    print('not connected');
    Fluttertoast.showToast(
        msg: 'Please check internet connection.',
        gravity: ToastGravity.CENTER);
    return false;
  }
  return false;
}
