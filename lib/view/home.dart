import 'package:flutter/material.dart';
import 'package:yukdoa/const.dart';
import 'package:yukdoa/data/data.dart';
import 'package:yukdoa/view/customdrawer.dart';
import 'package:yukdoa/view/detailpage.dart';
import 'package:yukdoa/view/detailpageDzikirDoa.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GlobalKey <ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.3,
              ),
              child: Container(
                height: height - height * 0.2,
                width: width,
                decoration: BoxDecoration(
                    color: bgDecorationColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Yuk Doa",
                          style: TextStyle(
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold,
                            color: kTextColor2,
                            fontSize: 30,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(5,0),
                          child: IconButton(
                              onPressed: ()=> _scaffoldKey.currentState!.openEndDrawer(),
                              icon: Icon(Icons.more_vert, color: kTextColor2,)
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      splashColor: bgDecorationColor,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPageDzikirDoa(data: dzikirDoaSesudahSholat)));
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/png/iconDzikirDoa.png",
                                width: double.infinity,
                                height: 70,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Text(
                              "Dzikir & Doa Sesudah Sholat",
                              style: TextStyle(
                                fontFamily: "Raleway",
                                color: kTextColor1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: CardHomeTemplate(
                            data: dataList[0],
                            navigator: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(data: dataList[0],)));
                            },
                          )),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: CardHomeTemplate(
                            data: dataList[1],
                            navigator: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(data: dataList[1],)));
                            },
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: CardHomeTemplate(
                            data: dataList[2],
                            navigator: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(data: dataList[2],)));
                            },
                          )),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: CardHomeTemplate(
                            data: dataList[3],
                            navigator: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(data: dataList[3],)));
                            },
                          )
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: CardHomeTemplate(
                            data: dataList[4],
                            navigator: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(data: dataList[4],)));
                            },
                          )),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: CardHomeTemplate(
                            data: dataList[5],
                            navigator: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(data: dataList[5],)));
                            },
                          )),
                    ],
                  ), //GridView(gridDelegate: gridDelegate)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardHomeTemplate extends StatelessWidget {
  final VoidCallback navigator;
  final Data data;
  const CardHomeTemplate(
      {Key? key,
      required this.navigator,
      required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        splashColor: bgDecorationColor,
        onTap: navigator,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  data.image,
                  height: 60,
                  width: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(
                data.title,
                style: TextStyle(
                  fontFamily: "Raleway",
                  color: kTextColor1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
