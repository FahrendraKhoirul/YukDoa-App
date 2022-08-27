import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yukdoa/const.dart';
import 'package:yukdoa/view/profile.dart';

class CustomDrawer extends StatefulWidget {

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {


  void saveData() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("translate", translateToggle);
  }




  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kTextColor2,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Text(
                "Yuk Doa",
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: outlineColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Column(
                      children: [
                        SwitchListTile(
                          activeColor: customYellow,
                          onChanged: (bool value){
                            setState(() {
                             translateToggle = value;
                              saveData();
                            });
                          },
                          secondary: Icon(Icons.translate, color: Colors.white,),
                          title: Text(
                              "Terjemahan",
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.white
                            ),
                          ),
                          value: translateToggle,
                        ),
                      ]
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: outlineColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: ListTile(
                    leading: Icon(Icons.person, color: Colors.white,),
                    title: Text(
                      "Profil Developer",
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.white
                      ),
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profile())),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
