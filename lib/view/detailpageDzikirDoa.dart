import 'package:flutter/material.dart';
import 'package:yukdoa/data/data.dart';
import '../const.dart';

class DetailPageDzikirDoa extends StatefulWidget {
  final Data data;
  const DetailPageDzikirDoa({Key? key, required this.data});

  @override
  _DetailPageDzikirDoaState createState() => _DetailPageDzikirDoaState();
}

class _DetailPageDzikirDoaState extends State<DetailPageDzikirDoa> {
  IconData dzikirArrow = Icons.keyboard_arrow_down;
  bool dzikirVisible = false;
  IconData doaArrow = Icons.keyboard_arrow_down;
  bool doaVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Scrollbar(
          radius: Radius.circular(10),
          thickness: 8.0,
          hoverThickness: 5.0,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Transform.translate(
                          offset: Offset(-10, 0),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_outlined,
                              color: kTextColor2,
                              //size: 25,
                            ),
                            iconSize: 18,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(-10, 0),
                          child: Text(
                            widget.data.title,
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.bold,
                              color: kTextColor2,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dzikir",
                            style: TextStyle(
                              fontFamily: "Raleway",
                              color: kTextColor2,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (dzikirArrow ==
                                      Icons.keyboard_arrow_down) {
                                    dzikirArrow = Icons.keyboard_arrow_up;
                                    dzikirVisible = !dzikirVisible;
                                  } else {
                                    dzikirArrow = Icons.keyboard_arrow_down;
                                    dzikirVisible = !dzikirVisible;
                                  }
                                });
                              },
                              icon: Icon(
                                dzikirArrow,
                                color: kTextColor1,
                              )),
                        ],
                      ),
                      Visibility(
                        visible: dzikirVisible,
                        child: Column(
                          children: _getSectionListElements(
                              dzikirDoaSesudahSholat, translateToggle, 0, 11),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Doa",
                            style: TextStyle(
                              fontFamily: "Raleway",
                              color: kTextColor2,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (doaArrow == Icons.keyboard_arrow_down) {
                                    doaArrow = Icons.keyboard_arrow_up;
                                    doaVisible = !doaVisible;
                                  } else {
                                    doaArrow = Icons.keyboard_arrow_down;
                                    doaVisible = !doaVisible;
                                  }
                                });
                              },
                              icon: Icon(
                                doaArrow,
                                color: kTextColor1,
                              )),
                        ],
                      ),
                      Visibility(
                        visible: doaVisible,
                        child: Column(
                          children: _getSectionListElements(
                              dzikirDoaSesudahSholat, translateToggle, 12, 25),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

  List<Widget> _getSectionListElements(Data datax, bool a, int awal, int akhir) {
    List<Widget> widgets = [];

    if (a == true) {
      for (int i = awal; i <= akhir; i++) {
        widgets.add(
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: outlineColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    datax.arab[i],
                    style: TextStyle(
                        fontFamily: "Scheherazade",
                        fontSize: 25,
                        fontWeight: FontWeight.w800),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    datax.latin[i],
                    style: TextStyle(
                      fontFamily: "Raleway",
                      color: kTextColor1,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Terjemah",
                    style: TextStyle(
                      fontFamily: "Raleway",
                      color: kTextColor2,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    datax.terjemahIDN[i],
                    style: TextStyle(
                      fontFamily: "Raleway",
                      color: kTextColor1,
                      fontSize: 12,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        );
      }
      return widgets;
    } else {
      for (int i = awal; i <= akhir; i++) {
        widgets.add(
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: outlineColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      datax.arab[i],
                      style: TextStyle(
                          fontFamily: "Scheherazade",
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      return widgets;
    }
  }


/*

  List <Widget> _getSectionListElements(bool expand, String section, bool terjemah) {
    int awal;
    int akhir;
    var list = [Container()];

    if (expand) {
      if(section == "Dzikir"){
        awal = 0;
        akhir = 11;
      }else{
        awal = 12;
        akhir = 24;
      }
      var list = [];
      for(int i=awal; i<=akhir; i++){
        list.add(sectionElement(terjemah, i));
      }

    }
    return list;
  }

}

class sectionElement extends StatelessWidget {
  final Data dataDzikirDoa = dzikirDoaSesudahSholat;
  bool translate;
  int index;

  sectionElement(this.translate, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: outlineColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  dataDzikirDoa.arab[index],
                  style: TextStyle(fontFamily: "Scheherazade", fontSize: 25, fontWeight: FontWeight.w800),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ]
        ),
      ),
    );
  }
}


 */
