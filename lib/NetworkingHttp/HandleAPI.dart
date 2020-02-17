import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k_tech/Models/LocalModels.dart' as Model;


class HandleAPIs extends StatefulWidget {
  final Widget widget;
  final AsyncSnapshot snapshot;
  Function function;

//  final Future data;
  HandleAPIs({Key key, this.widget, this.snapshot, this.function})
      : super(key: key);

  @override
  _HandleAPIsState createState() => _HandleAPIsState();
}

class _HandleAPIsState extends State<HandleAPIs> {
  bool _connection = true;

  @override
  void initState() {
    // TODO: implement initState
//    Model.checkConnectivity();
    _checkConnection();
    super.initState();
  }

  @override
  void didUpdateWidget(HandleAPIs oldWidget) {
    // TODO: implement didUpdateWidget
//    Model.checkConnectivity();
    super.didUpdateWidget(oldWidget);
  }

  void _checkConnection() {
    Model.checkInternetConnectivity().then((connection) {
      print('connection : $connection');
      setState(() {
        _connection = connection;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.snapshot.connectionState == ConnectionState.done
        ? _connection == true ? widget.snapshot.hasData
        ? widget.widget
        : InkWell(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.body1,
                  children: [
//                  WidgetSpan(
//                    child: Center(child: Text('Error Occurred')),
//                  ),
                    WidgetSpan(
                      child: Center(child: Icon(Icons.refresh)),
                    ),
                    WidgetSpan(
                      child: Center(
                          child:
                          Text('Error Occurred, Tap to refresh!')),
                    ),
//                  TextSpan(text: 'By Michael'),
                  ],
                ),
              )
//              )
          ),
        ),
        onTap: () {
          _checkConnection();
          widget.function();
//          setState(() {
//          });
        }): Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
//          decoration: BoxDecoration(backgroundBlendMode: BlendMode.color,color: Colors.black87),
            child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/CaveMan/caveman.gif'),
//                  Container(
//                    child: Icon(
//                      Icons.signal_wifi_off,
//                      size: 100,
//                    ),
//                  ),
                      Container(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.body1,
                              children: [
//                  WidgetSpan(
//                    child: Center(child: Text('Error Occurred')),
//                  ),

                                WidgetSpan(
                                  child: Center( //
                                      child:
                                      Text('no network coverage.',style: TextStyle(fontWeight: FontWeight.bold),)),
                                ),
                                WidgetSpan(
                                  child: Center( //
                                      child:
                                      Text('Please check your internet connection.')),
                                ),
                                WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Center( //Tap to refresh!
                                        child:
                                        Text('Tap to refresh!')),
                                  ),
                                ),
                                WidgetSpan(
                                  child: Center(child: Icon(Icons.refresh)),
                                ),
//                  TextSpan(text: 'By Michael'),
                              ],
                            ),
                          )
//              )
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  _checkConnection();
                  widget.function();
//          setState(() {
//          });
                }),
          ),
        ))
        :  Platform.isIOS
        ? Container(
        height: 200,
        child: Center(
//                        height: 30,
//                      width: 30,
//                      padding: EdgeInsets.only(top: 30),
          child: CupertinoTheme(
            data: CupertinoTheme.of(context)
                .copyWith(brightness: Brightness.light),
            child: const CupertinoActivityIndicator(
              animating: true,
              radius: 15,
            ),
          ),
        ))
        : Container(
        height: 200,
        child: Center(
//                        height: 30,
//                      width: 30,
//                      padding: EdgeInsets.only(top: 30),
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
          ),
        ));
//            : Center(
//                child: Container(
//                child: Icon(
//                  Icons.network_check,
//                  size: 100,
//                ),
//              ));
  }
}
