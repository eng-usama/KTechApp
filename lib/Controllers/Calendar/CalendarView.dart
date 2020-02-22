import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CalendarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('K-TECH Academic Calendar',style: TextStyle(color: Colors.white),),
      ),
      body: Container(
          child: PhotoView(
            imageProvider: NetworkImage("http://www.k-tech.edu.kw/ACalendarCr.jpg"),
          )
      ),
    );
  }
}

//http://www.k-tech.edu.kw/ACalendarCr.jpg
