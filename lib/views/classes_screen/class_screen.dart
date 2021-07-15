import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesma/views/classes_screen/InputClass_screen.dart';

class CreateClass extends StatefulWidget {
  @override
  _CreateClassState createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  List <Widget> listClass = [];
  void reRender (Map<String,dynamic> classItem){
    List <Widget> temp = listClass;
    temp.add(Text(classItem['className']));

    setState(() {
      listClass = temp;
    });
    print(listClass);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Row (
              children: <Widget>[
                FloatingActionButton(
                  //onPressed:
                  tooltip: 'Increment',
                  child: Icon(Icons.arrow_back_ios),
                ), // Th
                Text(
                    'Class',
                    textAlign: TextAlign.center
                ),
              ],
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: listClass,
              ),
              Text('Tạo lớp'),
              FloatingActionButton(
                onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InputClassScreen(reRender)),
                  );
                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ), // Th
            ],
          ),
        ),
      ),
    );
  }
}