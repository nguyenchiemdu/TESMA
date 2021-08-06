import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:tesma/models/firebase_authen.dart';
//import 'package:provider/provider.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:tesma/constants/color.dart';

class EditProfile extends StatelessWidget {
  final TextEditingController highSchoolController = TextEditingController(); 
  final TextEditingController faceBookController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(           
      body: 
      Stack(
        children: [
        Positioned(
            top: -5 * SizeConfig.heightMultiplier,
            right: 0 * SizeConfig.widthMultiplier,
            left: 0 * SizeConfig.widthMultiplier,
            child: Container(
              height: 40 * SizeConfig.heightMultiplier,
              decoration: BoxDecoration(
                color: darkPurpleColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(
                  color: Colors.blue.withOpacity(0.1),
                  blurRadius: 15,
                  spreadRadius: 10,
                )],
              ),
              child: Container(
                padding: EdgeInsets.only(top: 10 * SizeConfig.heightMultiplier, left: 10* SizeConfig.widthMultiplier),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "PROFILE",
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'SegoeUI',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    ),
                    SizedBox(width: 10*SizeConfig.widthMultiplier,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditProfile()),
                        );
                      }, 
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'SegoeUI',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),),
                        style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                        padding: EdgeInsets.symmetric(horizontal: 5*SizeConfig.widthMultiplier),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      )
                  ],
                )
              )  
            ),
          ),
    //  Profile - Edit
        Positioned(
          top: 14*SizeConfig.heightMultiplier,
          child: Container(
            height: 31.5*SizeConfig.heightMultiplier,
            width: MediaQuery.of(context).size.width - 20 * SizeConfig.widthMultiplier,
            margin: EdgeInsets.symmetric(horizontal: 10*SizeConfig.widthMultiplier),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  spreadRadius: 5,
                )
              ]
            ),    
            child: Column(children: [
              SizedBox(height: 1*SizeConfig.heightMultiplier,),
              Container(
                width: 20*SizeConfig.widthMultiplier,
                height: 11.42826*SizeConfig.heightMultiplier,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1*SizeConfig.widthMultiplier,color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ],            
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://cdns-images.dzcdn.net/images/artist/061868f886135e41428193285fc9de31/264x264.jpg')
                  )
                ),
              ),
              SizedBox(height: 1*SizeConfig.heightMultiplier,),
              Text(
                'Nguyen Dinh Tuan',
                style: TextStyle(
                  fontSize: 3*SizeConfig.textMultiplier,
                  fontFamily: 'SegoeUI',
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 1*SizeConfig.heightMultiplier,),
              Text(
                  'STUDENT',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SegoeUI',
                  ),
                ),
              Column(children: [
                Text(
                  '05',
                  style: TextStyle(
                    color: Color(0xff181a54),
                    fontSize: 25,
                    fontFamily: 'SegoeUI',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Classes',
                  style: TextStyle(
                    fontFamily: 'SegoeUI',
                    fontWeight: FontWeight.w900,
                  )
                )
              ],)
            ],),       
          ),
        ),
    //  Common information
        Positioned(
          top: 47.5*SizeConfig.heightMultiplier,
          child: Container(
            height: 11.5*SizeConfig.heightMultiplier,
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width - 20 * SizeConfig.widthMultiplier,
            margin: EdgeInsets.symmetric(horizontal: 10*SizeConfig.widthMultiplier),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  spreadRadius: 5,
                )
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.school,
                  size: 10*SizeConfig.imageSizeMultiplier,
                ),
                SizedBox(width: 10*SizeConfig.widthMultiplier,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "High School",
                      style: TextStyle(
                        fontSize: 2*SizeConfig.textMultiplier,
                        fontFamily: 'SegoeUI',
                        fontWeight: FontWeight.w900,
                        color: Color(0xff181a54),
                      ),
                    ),
                    SizedBox(height: 0.25*SizeConfig.heightMultiplier,),
                    Text(
                      "Nguyen Binh Khiem",
                      style: TextStyle(
                        fontSize: 2*SizeConfig.textMultiplier,
                        fontFamily: 'SegoeUI',
                        fontWeight: FontWeight.w300,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
    //  HighSchool
        Positioned(
          top: 61*SizeConfig.heightMultiplier,
          child: Container(
            height: 11.5*SizeConfig.heightMultiplier,
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width - 20 * SizeConfig.widthMultiplier,
            margin: EdgeInsets.symmetric(horizontal: 10*SizeConfig.widthMultiplier),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  spreadRadius: 5,
                )
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.facebook,
                  size: 10*SizeConfig.imageSizeMultiplier,
                ),
                SizedBox(width: 10*SizeConfig.widthMultiplier,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Facebook",
                      style: TextStyle(
                        fontSize: 2*SizeConfig.textMultiplier,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'SegoeUI',
                        color: Color(0xff181a54),
                      ),
                    ),
                    SizedBox(height: 0.25*SizeConfig.heightMultiplier,),
                    Text(
                      "fb.com/TuanRider",
                      style: TextStyle(
                        fontSize: 2*SizeConfig.textMultiplier,
                        fontFamily: 'SegoeUI',
                        fontWeight: FontWeight.w300,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
    //  Facebook
        Positioned(
          top: 74.5*SizeConfig.heightMultiplier,
          child: Container(
            height: 11.5*SizeConfig.heightMultiplier,
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width - 20 * SizeConfig.widthMultiplier,
            margin: EdgeInsets.symmetric(horizontal: 10*SizeConfig.widthMultiplier),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  spreadRadius: 5,
                )
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.phone_android,
                  size: 10*SizeConfig.imageSizeMultiplier,
                ),
                SizedBox(width: 10*SizeConfig.widthMultiplier,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone number",
                      style: TextStyle(
                        fontSize: 2*SizeConfig.textMultiplier,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'SegoeUI',
                        color: Color(0xff181a54),
                      ),
                    ),
                    SizedBox(height: 0.25*SizeConfig.heightMultiplier,),
                    Text(
                      "0388030248",
                      style: TextStyle(
                        fontSize: 2*SizeConfig.textMultiplier,
                        fontFamily: 'SegoeUI',
                        fontWeight: FontWeight.w300,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
    //  Phone Number
        Positioned(
          top: 90*SizeConfig.heightMultiplier,
          child: Container(
            height: 5*SizeConfig.heightMultiplier,
            width: MediaQuery.of(context).size.width - 60*SizeConfig.widthMultiplier,
            margin: EdgeInsets.symmetric(horizontal: 30*SizeConfig.widthMultiplier),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  spreadRadius: 5,
                )
              ]
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                        primary: Colors.pink[400],
                        padding: EdgeInsets.symmetric(horizontal: 5*SizeConfig.widthMultiplier),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Update",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: 'SegoeUI',
                  letterSpacing: 2,
                ),               
              ),             
            ),
          ),
        ),
    //  SignOut
        ],
      ),
    );
  }
}