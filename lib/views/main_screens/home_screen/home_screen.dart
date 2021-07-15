import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesma/views/classes_screen/InputClass_screen.dart';
import '../../../models/firebase_authen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <Widget> listClass = [];
  void reRender (Map<String,dynamic> classItem){
    List <Widget> temp = listClass;
    temp.add(Text(classItem['className']));

    setState(() {
      listClass = temp;
    });
    print(listClass);
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
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(150, 0, 150, 0),
        //padding: const EdgeInsets.all(10),
        width: 300,
        height: 100,
        decoration: BoxDecoration(
            //border: Border.all(color: Colors.black87),
            ),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.resolveWith(getbackgroudcolor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InputClassScreen(reRender)),
            );
          },
          child: Icon(Icons.add_rounded),
        ),
      ),
    );
  }
}
