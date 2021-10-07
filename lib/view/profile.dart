
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:yukdoa/const.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: kTextColor2,
                        //size: 25,
                      ),
                      iconSize: 18,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "About Developer",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                        color: kTextColor2,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: bgDecorationColor,
                          //backgroundImage: AssetImage("assets/images/fotoprofil.jpg"),
                          radius: 85,
                        ),
                        CircleAvatar(
                          backgroundColor: bgDecorationColor,
                          backgroundImage: AssetImage(
                            "assets/images/fotoprofil.jpg",
                          ),
                          radius: 70,
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "Fahrendra Khoirul Ihtada",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                        color: kTextColor2,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                      Row(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            color: kTextColor2,
                            size: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "fahrendra.khoirul@gmail.com",
                              style: TextStyle(
                                fontFamily: "Raleway",
                                color: kTextColor1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: kTextColor2,
                            size: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Bondowoso, Jawa Timur, Indonesia",
                              style: TextStyle(
                                fontFamily: "Raleway",
                                color: kTextColor1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () { launch('https://id.linkedin.com/in/fahrendra-khoirul-ihtada-763796205');},
                        splashColor: customYellow,
                        child: Row(
                          children: [
                            ImageIcon(
                              AssetImage("assets/png/icons_linkedin-fill.png"),
                              color: kTextColor2,
                              size: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "LinkedIn",
                                style: TextStyle(
                                  fontFamily: "Raleway",
                                  color: kTextColor1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        splashColor: customYellow,
                        onTap: () { launch('https://github.com/FahrendraKhoirul');},
                        child: Row(
                          children: [
                            ImageIcon(
                              AssetImage("assets/png/icon_github.png"),
                              color: kTextColor2,
                              size: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Github",
                                style: TextStyle(
                                  fontFamily: "Raleway",
                                  color: kTextColor1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () => share() ,
                        splashColor: customYellow,
                        child: Row(
                          children: [
                            Icon(
                              Icons.share_outlined,
                              color: kTextColor2,
                              size: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Share App",
                                style: TextStyle(
                                  fontFamily: "Raleway",
                                  color: kTextColor1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void share(){
    FlutterShare.share(
      title: "Yuk Doa",
      text: "'Yuk Doa' App for Android",
      linkUrl: "https://drive.google.com/drive/folders/1vSjNEPLbhN0vE_SEJWwTps70YABkdRbK?usp=sharing",
      chooserTitle: "Where You Want to Share"
    );

  }
}
