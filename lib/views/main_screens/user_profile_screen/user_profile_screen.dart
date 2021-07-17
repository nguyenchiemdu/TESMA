import 'package:flutter/material.dart';
import 'package:tesma/models/firebase_authen.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -30,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.indigo[900],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                  color: Colors.blue.withOpacity(0.1),
                  blurRadius: 15,
                  spreadRadius: 10,
                )],
              ),
              child: Container(
                padding: EdgeInsets.only(top: 70, left: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "PROFILE",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    ),
                    SizedBox(width: 50,),
                    ElevatedButton(
                      onPressed: () {}, 
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      )
                  ],
                )
              )  
            ),
          ),
        Positioned(
          top: 100,
          child: Container(
            height: 220,
            width: MediaQuery.of(context).size.width - 80,
            margin: EdgeInsets.symmetric(horizontal: 40),
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
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(width: 4,color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://scontent-hkt1-2.xx.fbcdn.net/v/t1.15752-9/141021867_460219741775332_1535192613656449136_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=ae9488&_nc_ohc=1rUp1riVuJ4AX_8Dfiy&_nc_ht=scontent-hkt1-2.xx&oh=e26c01da630fa91f281092bafd3daaf0&oe=60F5AD52')
                  )
                ),
              ),
              Text(
                'Nguyen Dinh Tuan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                  width: 80,
                  padding: EdgeInsets.all(5),
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Grade 10",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),                    
                    textAlign: TextAlign.center, 
                  )
                ),
                SizedBox(width: 5,),
                Text(
                  'Student',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
              ),
              Column(children: [
                Text(
                  '05',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Classes',
                )
              ],)
            ],),       
          ),
        ),
        Positioned(
          top: 335,
          child: Container(
            height: 80,
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width - 80,
            margin: EdgeInsets.symmetric(horizontal: 40),
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
                  size: 40,
                ),
                SizedBox(width: 40,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "High School",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text(
                      "Nguyen Binh Khiem",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 430,
          child: Container(
            height: 80,
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width - 80,
            margin: EdgeInsets.symmetric(horizontal: 40),
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
                  size: 40,
                ),
                SizedBox(width: 40,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Facebook",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text(
                      "fb.com/TuanRider",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 525,
          child: Container(
            height: 80,
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width - 80,
            margin: EdgeInsets.symmetric(horizontal: 40),
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
                  size: 40,
                ),
                SizedBox(width: 40,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone number",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text(
                      "0388030248",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 630,
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 200,
            margin: EdgeInsets.symmetric(horizontal: 100),
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
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
              onPressed: () {
                context.read<AuthService>().signOut();
              },
              child: Text(
                "Sign Out",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}

