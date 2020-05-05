import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k_tech/Controllers/HomeControllers/Subjects.dart';
import 'package:k_tech/Controllers/Subjects/SubjectView.dart';
import 'package:k_tech/Models/UI-Models.dart';
import 'package:k_tech/NetworkingHttp/DatabaseHttp.dart';
import 'package:k_tech/NetworkingHttp/UserAuth.dart';

class Subject {
  final String subjectName;
  final String subjectImage;
  final DateTime startDate;
  final DateTime endDate;
  final String department;
  final String content;
  final String package;
  final String preRequisite;

  Subject(this.subjectName, this.subjectImage, this.startDate, this.endDate,
      this.department, this.content, this.package, this.preRequisite);
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
    subjectsGlobal = [
      Subject(
          'Internet Marketing\nBSM233',
          'assets/internetMarketing.jpg',
          DateTime(2020, 9, 7, 9, 00),
          DateTime(2020, 9, 7, 9, 50),
          'Department of Business Management ',
          'The course focus on internet marketing and how it is different from traditional marketing and how it complements traditional marketing. The course begins with the foundation of internet marketing. In addition, the course discussing the implementation of the contemporary marketing tools and the development of the internet marketing strategies. The student leaving this course will have developed the skills required for effective performance in the internet marketing as a medium to large business. Students will also be prepared to take advantage of the growing number of entrepreneurial situations in today`s business environment. 3-0-3.',
          'K-TECH/ Kuwait Technical College/ Department of Business Management/ E-Commerce/Business Core (E-Commerce) Academic Year: 2018/2019\n\nK-TECH/ Kuwait Technical College/ Department of Business Management/ Sales and Marketing/Business Core (sales and Marketing) Academic Year: 2018/2019','MATH107'),
      Subject(
          'Statistics for Decision\nMaking\nMATH208',
          'assets/StatisticsForDecitionMaking.jpg',
          DateTime(2020, 9, 10, 10, 30),
          DateTime(2020, 9, 10, 11, 45),
          'Department of English and General Studies',
          'This course provides tools used for statistical analysis and decision making in business. The course includes both descriptive statistics and inferential concepts used to draw conclusions about a population. Research techniques, such as sampling and experiment design, are included for both single and multiple sample groups. 4-0-4.',
          'K-TECH/ Kuwait Technical College/ Department of Business Management/ Sales and Marketing/Mathematics Academic Year: 2018/2019','MATH107'),
      Subject(
          'Advertising and Public\nRelations\nBSM280',
          'assets/AdvertisingandPublicRelations.jpg',
          DateTime(2020, 9, 20, 12, 00),
          DateTime(2020, 9, 20, 13, 15),
          'Department of Business Management ',
          'This course will provide students with a broad overview of advertising and promotion from an integrated Brand Promotion (IBP) perspective. It will focus on different area such as advertising and IBP in business and society, analyzing the environment for advertising and integrated brand promotion, the creative process, placing the message in conventional and new media, and integrated brand promotion. The course will cover diverse range of advertising theories & practices, advertising & promotion industry, advertising & promotion history, advertising & promotion society, advertising & promotion agencies, advertising & promotion media planning, advertising & promotion strategies, advertising & promotion creative techniques, advertising & promotion research, advertising & promotion social responsibilities, ethics in advertising & promotion, sales promotion. 3-0-3.',
          'K-TECH/ Kuwait Technical College/ Department of Business Management/ Sales and Marketing/Business Core (sales and Marketing) Academic Year: 2018/2019','BSM178 '),
      Subject(
          'Market Research\nMethods\nBSM285',
          'assets/MarketResearchMethods.jpg',
          DateTime(2020, 9, 30, 13, 00),
          DateTime(2020, 9, 30, 13, 50),
          'Department of Business Management ',
          'Working in groups, students apply knowledge and skills gained, including problem-solving and project management techniques, to a windows and web solution project. Based on a typical real world business situation, the project includes gathering and analyzing business requirements, designing, developing, testing and implementing a software solution for a windows and web computing environment. 1-4-3.',
          'K-TECH/ Kuwait Technical College/ Department of Business Management/ Sales and Marketing/Business Core (sales and Marketing) Academic Year: 2018/2019','No')
    ];
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
                package:
                    'K-TECH started operating in 2014 to provide opportunities for students who are oriented toward practical education',
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
                            child: Column(children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                alignment: Alignment.topLeft,
                                child: Text(''),
                              ),
                              new Container(
                                child: GridView.count(
                                  controller: new ScrollController(
                                      keepScrollOffset: false),
                                  shrinkWrap: true,
                                  // Create a grid with 2 columns. If you change the scrollDirection to
                                  // horizontal, this produces 2 rows.
                                  crossAxisCount: 2,
                                  // Generate 100 widgets that display their index in the List.
                                  children: List.generate(subjectsGlobal.length,
                                      (index) {
                                    return Center(
                                        child: GestureDetector(
                                      onTap: () async {
                                        print(index);
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SubjectView(
                                                      index: subjectsGlobal
                                                          .indexOf(
                                                              subjectsGlobal[
                                                                  index]),
                                                    )));
                                      },
                                      child: SubjectItem(
                                        subjectName:
                                            subjectsGlobal[index].subjectName,
                                        subjectPhoto:
                                            subjectsGlobal[index].subjectImage,
                                      ),
                                    ));
                                  }),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ])))
                  ],
//                  height: 200,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            )
          ],
        ));
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
                color: Colors.black12,
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
