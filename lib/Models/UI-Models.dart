import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:k_tech/Models/LocalModels.dart' as Model;

class SubjectItem extends StatefulWidget {
  final String subjectName;
  final String subjectPhoto;

  const SubjectItem({Key key, this.subjectName, this.subjectPhoto})
      : super(key: key);

//  final Color color;
//  final IconData icon;

//  const ShopItem({Key key, this.color, this.icon}) : super(key: key);

  @override
  _SubjectItem createState() => _SubjectItem();
}

class _SubjectItem extends State<SubjectItem> {
  @override
  Widget build(BuildContext context) {
    double iconSize = (MediaQuery.of(context).size.width - 80) / 2;
    // TODO: implement build
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(5),
          width: iconSize,
          height: iconSize + 100,
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 5),
                  height: iconSize - 25,
                  width: iconSize,
                  child: Image.asset('${widget.subjectPhoto}'),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: AutoSizeText(
                        widget.subjectName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          wordSpacing: 0.1,
                        ),
                        softWrap: false,
                        textAlign: TextAlign.center,
                        presetFontSizes: [13, 11, 9],
                        maxLines: 3,
                      ))),
            ],
          )),
    );
  }
}
