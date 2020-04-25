import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k_tech/Controllers/HomeControllers/Subjects.dart';
import 'package:k_tech/Models/UI-Models.dart';
import 'package:k_tech/NetworkingHttp/DatabaseHttp.dart';
import 'package:k_tech/NetworkingHttp/UserAuth.dart';

class Subject {
  final String subjectName;
  final String subjectImage;
  final DateTime startDate;
  final DateTime endDate;
  Subject(this.subjectName, this.subjectImage, this.startDate, this.endDate);

}

List<Subject> subjectsGlobal = [];

class HomePage extends StatefulWidget {
//  final Color color;


  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

//  final AuthService _auth = AuthService();



/*
- assets/assembly.jpeg
    - assets/comProgram.jpeg
    - assets/digitalSystems.jpeg
    - assets/howcompworks.jpeg
    - assets/logo.png
    - assets/micro.jpeg
 */
  @override
  void initState() {
    super.initState();
    subjectsGlobal = [Subject('Internet Marketing\nBSM233','assets/internetMarketing.jpg',DateTime(2020, 9, 7, 9 ,00),DateTime(2020, 9, 7, 9 ,50)),Subject('Statistics for Decision\nMaking\nMATH208','assets/StatisticsForDecitionMaking.jpg',DateTime(2020, 9, 10, 10,30),DateTime(2020, 9, 10, 11,45)),Subject('Advertising and Public\nRelations\nBSM280','assets/AdvertisingandPublicRelations.jpg', DateTime(2020, 9, 20, 12 ,00), DateTime(2020, 9, 20, 13 ,15)),Subject('Market Research\nMethods\nBSM285','assets/MarketResearchMethods.jpg',DateTime(2020, 9, 30,13 ,00),DateTime(2020, 9, 30,13 ,50))];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: DesignMainTopView(
              hieght: false,
              category: 'Kuwait Technical College',
              package: 'K-TECH started operating in 2014 to provide opportunities for students who are oriented toward practical education',
              title: 'Subjects',
              details: '',
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.grey[200],
                          elevation: 5,
                          semanticContainer: true,
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  alignment: Alignment.topLeft,
                                  child: Text(''),
                                ),
                                new Container(
                                  child: GridView.count(
                                    controller: new ScrollController(keepScrollOffset: false),
                                    shrinkWrap: true,
                                    // Create a grid with 2 columns. If you change the scrollDirection to
                                    // horizontal, this produces 2 rows.
                                    crossAxisCount: 2,
                                    // Generate 100 widgets that display their index in the List.
                                    children: List.generate(subjectsGlobal.length, (index) {
                                      return Center(
                                          child: GestureDetector(
                                            onTap: () async {
                                            print(index);
//                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubjectsContent()));

                                            },
                                            child: SubjectItem(subjectName: subjectsGlobal[index].subjectName,subjectPhoto: subjectsGlobal[index].subjectImage,),
                                          ));
                                    }),
                                  ),

                                ),
                                SizedBox(
                                  height: 50,
                                ),]
                          )))

                ],
//                  height: 200,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20,),)
        ],
      )



    );
//          ),
//        ),
//      ],
//    );
  }
}


class DesignMainTopView extends StatelessWidget {
  final String category;
  final String package;
  final String title;
  final String details;
  final bool hieght;

  const DesignMainTopView(
      {this.hieght, this.category, this.package, this.title, this.details});

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
            category,
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
            package,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 14,
              color: Colors.black45,
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
                title,
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
            height: hieght == true ? 20 : 0,
          ),
          Text(
            details,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 15,
                color:Colors.black12,
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}