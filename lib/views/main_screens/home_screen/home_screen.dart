import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tesma/models/userinf.dart';
import 'package:tesma/views/classes_screen/InputClass_screen.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:tesma/views/main_screens/home_screen/main_class_info.dart';
import '../home_screen/single_class.dart';

class HomeScreen extends StatefulWidget {
  final DocumentSnapshot userdata;
  const HomeScreen({Key key, @required this.userdata}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    userinf = UserInf.fromSnapshot(widget.userdata);
  }

  UserInf userinf;
  Future resultsLoaded;
  List _allresultList = [];
  List listClass = [];
  void reRender(Map<String, dynamic> classItem) {
    List<Widget> temp = listClass;

    setState(() {
      listClass = temp;
    });
    print(listClass);
  }

  Positioned CreateClass() {
    return Positioned(
      height: 4.2 * SizeConfig.heightMultiplier,
      top: 13.9 * SizeConfig.heightMultiplier,
      right: 11.4 * SizeConfig.widthMultiplier,
      child: Container(
        alignment: Alignment.center,
        width: 36 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
          color: Color(0xffef4874),
          borderRadius: BorderRadius.circular(35),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InputClassScreen(reRender)),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New Class',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'SegoeUI',
                  fontWeight: FontWeight.w900,
                ),
              ),
              Icon(
                Icons.add,
                color: Colors.white,
                size: 4 * SizeConfig.heightMultiplier,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getClassInfor();
  }

  getClassInfor() async {
    var data = await FirebaseFirestore.instance.collection('classes').get();
    // List<DocumentSnapshot> docs = data.docs;
    // docs.forEach((element) {
    //   print(element.data());
    // });
    setState(() {
      _allresultList = data.docs;
      // _allresultList.forEach((element) {
      //   print(element.data());
      // });
    });
    print('get class successful');
  }

  Color getbackgroudcolor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Color(0xff7243cf);
    }
    return (Colors.orangeAccent);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return Scaffold(
              body: Container(
                color: Color(0xff45228b),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 4.5 * SizeConfig.heightMultiplier),
                      decoration: BoxDecoration(
                        color: Color(0xff181a54),
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(35)),
                      ),
                      height: 83 * SizeConfig.heightMultiplier,
                      margin: EdgeInsets.only(
                          top: 16 * SizeConfig.heightMultiplier),
                      child: ListView.builder(
                          padding: EdgeInsets.only(
                            left: 11.4 * SizeConfig.widthMultiplier,
                            right: 11.4 * SizeConfig.widthMultiplier,
                          ),
                          itemCount: _allresultList.length,
                          itemBuilder: (BuildContext context, int index) =>
                              GestureDetector(
                                child:
                                    singleClass(context, _allresultList[index]),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyClassPage(
                                            resultList: _allresultList[index])),
                                  );
                                },
                              )
                          //children: listClass,
                          // children: [
                          //   singleClass(),
                          //   singleClass(),
                          //   singleClass(),
                          //   singleClass(),
                          // ],
                          ),
                    ),
                    Positioned(
                      height: 4.2 * SizeConfig.heightMultiplier,
                      top: 13.9 * SizeConfig.heightMultiplier,
                      left: 11.4 * SizeConfig.widthMultiplier,
                      child: Container(
                        width: 36 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                          color: Color(0xff181a54),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Center(
                          child: Text(
                            'My Class',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'SegoeUI',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (userinf.userType == 'teacher') CreateClass(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
