import 'package:flutter/material.dart';
import 'package:tesma/constants/color.dart';
import 'package:tesma/constants/size_config.dart';

class NotificationScreens extends StatelessWidget {
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
            body: SingleChildScrollView(
              child: Container(
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
                            transform:
                                Matrix4.translationValues(0.0, -20.0, 0.0),
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
                                        Icons.audiotrack,
                                        color: Colors.white,
                                        size: 30.0,
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
                                      Icons.beach_access,
                                      color: Colors.white,
                                      size: 36.0,
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
              ),
            ));
      });
    });
  }
}

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 80,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal: 25),
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
                    Icons.lock_clock,
                    size: 40,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Please update your information!",
                      style: TextStyle(
                        fontFamily: 'SegoeUI',
                        color: blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
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
