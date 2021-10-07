import 'package:flutter/material.dart';
import 'package:yukdoa/const.dart';
import 'package:yukdoa/data/data.dart';

class DetailPage extends StatefulWidget {
  final Data data;
  const DetailPage({Key? key, required this.data});

  @override
  _DetailPageState createState() => _DetailPageState(datas: data);
}

class _DetailPageState extends State<DetailPage> {


  final Data datas;

  _DetailPageState({required this.datas});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                Container(
                  child: Column(
                    children: _getListElements(datas, translateToggle),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  List<Widget> _getListElements(Data datax, bool a) {
    List<Widget> widgets = [];
    if (a == true) {
      for (int i = 0; i < datax.arab.length; i++) {
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
                    Text(
                      datax.arab[i],
                      style: TextStyle(fontFamily: "Scheherazade",
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      datax.latin[i],
                      style: TextStyle(
                        fontFamily: "Raleway",
                        color: kTextColor1,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.centerLeft,
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
                    SizedBox(height: 10,),
                    Text(
                      datax.terjemahIDN[i],
                      style: TextStyle(
                        fontFamily: "Raleway",
                        color: kTextColor1,
                        fontSize: 12,
                      ),
                    ),
                  ]
              ),
            ),
          ),
        );
      }
      return widgets;
    } else {
      for (int i = 0; i < datax.arab.length; i++) {
        widgets.add(
          Container(
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
                        datax.arab[i],
                        style: TextStyle(fontFamily: "Scheherazade",
                            fontSize: 25,
                            fontWeight: FontWeight.w800),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ]
              ),
            ),
          ),
        );
      }
      return widgets;
    }
  }
}

class MyItem {
  bool isExpanded;
  final String header;
  final String body;

  MyItem({
    required this.body,
    required this.header,
    this.isExpanded: false,
  });
}

