import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/firebase_authen.dart';

class HomeScreen extends StatelessWidget {
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
            context.read<AuthService>().signOut();
          },
          child: Icon(Icons.add_rounded),
        ),
      ),
    );
  }
}
