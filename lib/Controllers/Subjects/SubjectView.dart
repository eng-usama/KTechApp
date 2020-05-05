import 'package:flutter/material.dart';
import 'package:k_tech/Controllers/HomeControllers/HomePage.dart';

class SubjectView extends StatefulWidget {
  final int index;

  const SubjectView({Key key, this.index}) : super(key: key);
  @override
  _SubjectViewState createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView> {

  @override
  Widget build(BuildContext context) {
    print(widget.index);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SubjectDesignView(
              subject: subjectsGlobal[widget.index].subjectName,
              department: subjectsGlobal[widget.index].department,
              title_1: 'Content',
              content: subjectsGlobal[widget.index].content,
              coursePackage: subjectsGlobal[widget.index].package,
              preRequisite: subjectsGlobal[widget.index].preRequisite,
            ),
          ],
        ),
      ),
    );
  }
}


class SubjectDesignView extends StatelessWidget {
  final String subject;
  final String department;
  final String title_1;
  final String content;
  final String coursePackage;
  final String preRequisite;

  const SubjectDesignView(
      { this.subject, this.department, this.title_1, this.content, this.coursePackage, this.preRequisite});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: hieght,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            width: 30,
            height: 4,
            color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            subject,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            department,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 14,
              color: Colors.black87,
              decorationStyle: TextDecorationStyle.wavy,
            ),
            textAlign: TextAlign.left,
          ),
//          SizedBox(
//            height: 20,
//          ),
//          Container(
//            width: 30,
//            height: 4,
//            color: Colors.black,
//          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                title_1,
                style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 1,
                  width: 50,
                  color: Colors.cyan,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            content,
            style: TextStyle(
//                fontFamily: "Lato",
                fontSize: 17,
                color: Colors.black,
                ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "Course Package",
                style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 1,
                  width: 50,
                  color: Colors.cyan,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            coursePackage,
            style: TextStyle(
//                fontFamily: "Lato",
              fontSize: 17,
              color: Colors.black,
            ),
//            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "Pre-Requisite",
                style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  height: 1,
                  width: 50,
                  color: Colors.cyan,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            preRequisite,
            style: TextStyle(
//                fontFamily: "Lato",
              fontSize: 17,
              color: Colors.black,
            ),
//            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}