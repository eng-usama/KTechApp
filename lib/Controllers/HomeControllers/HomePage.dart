import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k_tech/Controllers/HomeControllers/Subjects.dart';
import 'package:k_tech/Models/UI-Models.dart';
import 'package:k_tech/NetworkingHttp/UserAuth.dart';

class Subject {
  final String subjectName;
  final String subjectImage;

  Subject(this.subjectName, this.subjectImage);

}
class HomePage extends StatefulWidget {
//  final Color color;


  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

//  final AuthService _auth = AuthService();

  List<Subject> _subjects = [];
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
    _subjects = [Subject('Assembly','assets/assembly.jpeg'),Subject('Programming','assets/comProgram.jpeg'),Subject('how computer works','assets/howcompworks.jpeg'),Subject('digital systems','assets/digitalSystems.jpeg')];
  }

  @override
  Widget build(BuildContext context) {
//    GridView.count(
//      shrinkWrap: true,
//      // Create a grid with 2 columns. If you change the scrollDirection to
//      // horizontal, this produces 2 rows.
//      crossAxisCount: 4,
//      // Generate 100 widgets that display their index in the List.
//      children: List.generate(_more == false ? 8 : topItems.length, (index) {
//        return Center(
//            child: GestureDetector(
//                child: topItems[index],
//                onTap: () {
//                  print('index : $index');
//                  if (index == topItems.length - 1) {
//                    setState(() {
//                      _more = !_more;
//                      if(_more == true)
//                      {
//                        topItems.insert(7, TopItems(
//                          color: Colors.blueAccent,
//                          icon: Icons.add_shopping_cart,
//                        ),);
//                        topItems.insert(7, TopItems(
//                          color: Colors.blueAccent,
//                          icon: Icons.add_a_photo,
//                        ),);
//                      }
//                      else
//                      {
//
//                        topItems.removeAt(7);
//                        topItems.removeAt(7);
//                      }
//                    });
//                  }
//                }));
//      }),
//    );
    return Container(
      color: Colors.white10,
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
                                    children: List.generate(_subjects.length, (index) {
                                      return Center(
                                          child: GestureDetector(
                                            onTap: () async {
//                                              Navigator.push(context,MaterialPageRoute(builder: (context) => Shop(shopId: snapshot.data[index].shopId,)) );
                                            print(index);
//                                            dynamic result = await _auth.signInAnon();
//                                            if(result == null)
//                                              {
//                                                print('Authh failed');
//                                              }
//                                            else
//                                              {
//                                                print('Authh success');
//                                                print(result.uid);
//                                              }
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubjectsContent()));
                                            },
                                            child: ShopItem(shopName: _subjects[index].subjectName,shopPhoto: _subjects[index].subjectImage,),
                                          ));
                                    }),
                                  ),

                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  alignment: Alignment.topLeft,
                                  child: Text(''),
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