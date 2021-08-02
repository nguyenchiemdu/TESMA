import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesma/constants/color.dart';
import 'package:tesma/constants/size_config.dart';
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:tesma/models/CheckBoxState.dart';
import 'package:tesma/models/classinf.dart';
import 'package:tesma/views/main_screens/home_screen/class_info.dart';
=======
import 'package:tesma/models/classinf.dart';
import 'package:tesma/models/firebase_database.dart';
>>>>>>> ab7ccab (Class card UI and search by keyword)
=======
import 'package:tesma/models/CheckBoxState.dart';
import 'package:tesma/models/classinf.dart';
>>>>>>> 1e5283c (Complete filter function)
=======
import 'package:tesma/models/CheckBoxState.dart';
import 'package:tesma/models/classinf.dart';
>>>>>>> d7c1f94d7dedec2ebcdac194025ca73aef7a60a6
import 'package:tesma/views/main_screens/search_screen/classcard.dart';
import 'package:tesma/views/main_screens/search_screen/filter.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future resultsLoaded;
  TextEditingController searchController = TextEditingController();
<<<<<<< HEAD
<<<<<<< HEAD

  final List<CheckBoxState> grade = [
    CheckBoxState(title: '10', value: true),
    CheckBoxState(title: '11', value: true),
    CheckBoxState(title: '12', value: true),
  ];

  final List<CheckBoxState> subject = [
    CheckBoxState(title: 'Math', value: true),
    CheckBoxState(title: 'English', value: true),
    CheckBoxState(title: 'Physics', value: true),
    CheckBoxState(title: 'Chemistry', value: true),
    CheckBoxState(title: 'Literature', value: true),
  ];

  final List<CheckBoxState> status = [
    CheckBoxState(title: 'Not start yet', value: true),
    CheckBoxState(title: 'Already started', value: true),
  ];
=======
>>>>>>> ab7ccab (Class card UI and search by keyword)
=======
>>>>>>> d7c1f94d7dedec2ebcdac194025ca73aef7a60a6

  final List<CheckBoxState> grade = [
    CheckBoxState(title: '10', value: true),
    CheckBoxState(title: '11', value: true),
    CheckBoxState(title: '12', value: true),
  ];

  final List<CheckBoxState> subject = [
    CheckBoxState(title: 'Math', value: true),
    CheckBoxState(title: 'English', value: true),
    CheckBoxState(title: 'Physics', value: true),
    CheckBoxState(title: 'Chemistry', value: true),
    CheckBoxState(title: 'Literature', value: true),
  ];

  final List<CheckBoxState> status = [
    CheckBoxState(title: 'Not start yet', value: true),
    CheckBoxState(title: 'Already started', value: true),
  ];

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

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 1e5283c (Complete filter function)
=======
>>>>>>> d7c1f94d7dedec2ebcdac194025ca73aef7a60a6
  searchResultsListGrade() {
    var showResults = [];
    for (var Snapshot in _resultsList) {
      var gradeItem = ClassInf.fromSnapshot(Snapshot).grade.toLowerCase();
      for (var i = 0; i < 3; i++) {
        if (grade[i].value && gradeItem == grade[i].title.toLowerCase()) {
          showResults.add(Snapshot);
          break;
        }
      }
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  searchResultsListSubject() {
    var showResults = [];
    for (var Snapshot in _resultsList) {
      var subjectItem = ClassInf.fromSnapshot(Snapshot).subject.toLowerCase();
      for (var i = 0; i < 5; i++) {
        if (subject[i].value && subjectItem == subject[i].title.toLowerCase()) {
          showResults.add(Snapshot);
          break;
        }
      }
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  searchResultsListStatus() {
    var showResults = [];
    if (status[0].value == status[1].value) {
      showResults = List.from(_resultsList);
    } else {
      if (status[0].value) {
        for (var Snapshot in _resultsList) {
          var startDate = DateTime.parse(
              ClassInf.fromSnapshot(Snapshot).startdate.toLowerCase());
          if (DateTime.now().compareTo(startDate) >= 0)
            showResults.add(Snapshot);
        }
      } else {
        for (var Snapshot in _resultsList) {
          var startDate = DateTime.parse(
              ClassInf.fromSnapshot(Snapshot).startdate.toLowerCase());
          if (DateTime.now().compareTo(startDate) < 0)
            showResults.add(Snapshot);
        }
      }
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  searchResultsListwithFilter() {
    searchResultsListGrade();
    searchResultsListSubject();
    searchResultsListStatus();
  }

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ab7ccab (Class card UI and search by keyword)
=======
>>>>>>> 1e5283c (Complete filter function)
=======
>>>>>>> d7c1f94d7dedec2ebcdac194025ca73aef7a60a6
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    searchResultsListwithFilter();
=======
>>>>>>> ab7ccab (Class card UI and search by keyword)
=======
    searchResultsListwithFilter();
>>>>>>> 1e5283c (Complete filter function)
=======
    searchResultsListwithFilter();
>>>>>>> d7c1f94d7dedec2ebcdac194025ca73aef7a60a6
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
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
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          color: darkPurpleColor,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 18 * SizeConfig.heightMultiplier,
                padding: EdgeInsets.fromLTRB(
                    3 * SizeConfig.heightMultiplier,
                    1 * SizeConfig.heightMultiplier,
                    3 * SizeConfig.heightMultiplier,
                    0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 1e5283c (Complete filter function)
=======
>>>>>>> d7c1f94d7dedec2ebcdac194025ca73aef7a60a6
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Filter(
                                  grade: grade,
                                  subject: subject,
                                  status: status,
                                );
                              }).then((value) => {
                                setState(() {
                                  print(value);
                                  searchResultsList();
                                })
                              });
                        },
                        child: Icon(Icons.filter_alt),
<<<<<<< HEAD
<<<<<<< HEAD
=======
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
>>>>>>> ab7ccab (Class card UI and search by keyword)
=======
>>>>>>> 1e5283c (Complete filter function)
=======
>>>>>>> d7c1f94d7dedec2ebcdac194025ca73aef7a60a6
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 1e5283c (Complete filter function)
=======
>>>>>>> d7c1f94d7dedec2ebcdac194025ca73aef7a60a6
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
<<<<<<< HEAD
<<<<<<< HEAD
                      ),
=======
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(
                        left: 5.5 * SizeConfig.widthMultiplier,
                        right: 5.5 * SizeConfig.widthMultiplier,
                      ),
                      itemCount: _resultsList.length,
                      itemBuilder: (BuildContext context, int index) =>
                          classCard(context, _resultsList[index]),
>>>>>>> ab7ccab (Class card UI and search by keyword)
=======
                      ),
>>>>>>> 1e5283c (Complete filter function)
=======
                      ),
>>>>>>> d7c1f94d7dedec2ebcdac194025ca73aef7a60a6
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(
                          left: 5.5 * SizeConfig.widthMultiplier,
                          right: 5.5 * SizeConfig.widthMultiplier,
                        ),
                        itemCount: _resultsList.length,
                        itemBuilder: (BuildContext context, int index) =>
<<<<<<< HEAD
<<<<<<< HEAD
                            GestureDetector(
                          child: classCard(context, _resultsList[index]),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ClassInfoScreen()),
                            );
                          },
                        ),
=======
                            classCard(context, _resultsList[index]),
>>>>>>> 1e5283c (Complete filter function)
=======
                            classCard(context, _resultsList[index]),
>>>>>>> d7c1f94d7dedec2ebcdac194025ca73aef7a60a6
                      ),
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
