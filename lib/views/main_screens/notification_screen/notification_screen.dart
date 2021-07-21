import 'package:flutter/material.dart';
import 'package:tesma/constants/color.dart';
import 'package:tesma/constants/size_config.dart';

class NotificationScreens extends StatefulWidget {
  @override
  _NotificationScreensState createState() => _NotificationScreensState();
}

class _NotificationScreensState extends State<NotificationScreens> {
  Color getbackgroudcolor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return mediumPink;
    }
    return mediumPink;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 18 * SizeConfig.heightMultiplier,
                    padding: EdgeInsets.fromLTRB(
                        0, 6 * SizeConfig.heightMultiplier, 0, 0),
                    child: Text(
                      'Notifications',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SegoeUI',
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 82 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: darkPurpleColor,
                    ),
                    child: Column(
                      children: [
                        Container(
                          transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              getbackgroudcolor),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ))),
                                  child: Container(
                                      child: Center(
                                    child: Icon(
                                      Icons.backspace_outlined,
                                      color: Colors.white,
                                      size: 25.0,
                                    ),
                                  ))),
                              SizedBox(
                                width: 10.0,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              getbackgroudcolor),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ))),
                                  child: Container(
                                      child: Center(
                                          child: Icon(
                                    Icons.mark_as_unread,
                                    color: Colors.white,
                                    size: 25.0,
                                  )))),
                            ],
                          ),
                        ),
                        Notifications(),
                      ],
                    ),
                  )
                ],
              ),
            ));
      });
    });
  }
}

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: SingleChildScrollView(
          controller: controller,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(25, 0, 25, 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        spreadRadius: 5,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.access_time_filled,
                        size: 40,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 220,
                          child: Text(
                            "Please update your information!",
                            style: TextStyle(
                              fontFamily: 'SegoeUI',
                              color: blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          height: 17,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lock_clock,
                                size: 10,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "15 minutes ago",
                                style: TextStyle(
                                  fontFamily: 'SegoeUI',
                                  color: blackColor,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(25, 0, 25, 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        spreadRadius: 5,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.document_scanner,
                        size: 40,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 220,
                          child: Text(
                            "You got a new post from class 11 Physics - Huynh Thi Ky",
                            style: TextStyle(
                              fontFamily: 'SegoeUI',
                              color: blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          height: 17,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lock_clock,
                                size: 10,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "15 minutes ago",
                                style: TextStyle(
                                  fontFamily: 'SegoeUI',
                                  color: blackColor,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(25, 0, 25, 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        spreadRadius: 5,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.document_scanner,
                        size: 40,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 220,
                          child: Text(
                            "You got a new post from class 11 Physics - Huynh Thi Ky",
                            style: TextStyle(
                              fontFamily: 'SegoeUI',
                              color: blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          height: 17,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lock_clock,
                                size: 10,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "15 minutes ago",
                                style: TextStyle(
                                  fontFamily: 'SegoeUI',
                                  color: blackColor,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(25, 0, 25, 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        spreadRadius: 5,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.document_scanner,
                        size: 40,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 220,
                          child: Text(
                            "You got a new post from class 11 Physics - Huynh Thi Ky",
                            style: TextStyle(
                              fontFamily: 'SegoeUI',
                              color: blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          height: 17,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lock_clock,
                                size: 10,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "15 minutes ago",
                                style: TextStyle(
                                  fontFamily: 'SegoeUI',
                                  color: blackColor,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(25, 0, 25, 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        spreadRadius: 5,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.document_scanner,
                        size: 40,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 220,
                          child: Text(
                            "You got a new post from class 11 Physics - Huynh Thi Ky",
                            style: TextStyle(
                              fontFamily: 'SegoeUI',
                              color: blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          height: 17,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lock_clock,
                                size: 10,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "15 minutes ago",
                                style: TextStyle(
                                  fontFamily: 'SegoeUI',
                                  color: blackColor,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationsEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 235.0,
            width: 235.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: darkPurpleColor,
            ),
            child: Image.asset(
              'assets/image/paperplane.png',
            ),
          ),
          Container(
            height: 50,
            child: Text(
              'No notification found',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SegoeUI',
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Container(
            child: Text(
              'You’re all caught up!\nCheck back later for new notifications',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SegoeUI',
                color: greyColor,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
