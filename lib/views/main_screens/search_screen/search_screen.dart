import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesma/constants/color.dart';
import 'package:tesma/constants/size_config.dart';
import 'package:tesma/models/classinf.dart';
import 'package:tesma/models/firebase_database.dart';
import 'package:tesma/views/main_screens/search_screen/classcard.dart';
import 'package:tesma/views/main_screens/search_screen/filter.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future resultsLoaded;
  TextEditingController searchController = TextEditingController();

  ScrollController controller = ScrollController();

  List _resultsList = [];
  List _allresultList = [];

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
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }

  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if (searchController.text != "") {
      for (var Snapshot in _allresultList) {
        var classname = ClassInf.fromSnapshot(Snapshot).classname.toLowerCase();

        if (classname.contains(searchController.text.toLowerCase())) {
          showResults.add(Snapshot);
        }
      }
    } else {
      showResults = List.from(_allresultList);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  @override
  void dispose() {
    //_searchController.removeListener(_onSearchChanged);
    //_searchController.dispose();
    super.dispose();
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
    searchResultsList();
    print('get class successful');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: darkPurpleColor,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 18 * SizeConfig.heightMultiplier,
              padding:
                  EdgeInsets.fromLTRB(0, 6 * SizeConfig.heightMultiplier, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Search",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'SegoeUI',
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Filter();
                            });
                      },
                      child: Text("Filter"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 82 * SizeConfig.heightMultiplier,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: lightPurpleColor,
              ),
              child: Column(
                children: [
                  Container(
                    transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                    child: Container(
                      height: 6.58 * SizeConfig.heightMultiplier,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            labelStyle: TextStyle(
                              height: 6.58 * SizeConfig.heightMultiplier,
                              fontFamily: 'SegoeUI',
                              color: greyColor,
                              fontSize: 2.10 * SizeConfig.textMultiplier,
                            ),
                            border: OutlineInputBorder(),
                            counterText: "",
                            hintText: 'Enter a name',
                            prefixIcon: Icon(Icons.search)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(
                        left: 5.5 * SizeConfig.widthMultiplier,
                        right: 5.5 * SizeConfig.widthMultiplier,
                      ),
                      itemCount: _resultsList.length,
                      itemBuilder: (BuildContext context, int index) =>
                          classCard(context, _resultsList[index]),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
