import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';

const darkPurpleColor = Color(0xFF45228B);
const lightPurpleColor = Color(0xFF7243CF);
const whiteColor = Color(0xFFFFFFFF);
const greyColor = Color(0xFFD7CEE9);
const redColor = Color(0xFFF74B46);

class MyRegisterScreen extends StatefulWidget {
  @override
  _MyRegisterScreen createState() {
    return _MyRegisterScreen();
  }
}

class _MyRegisterScreen extends State<MyRegisterScreen> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final maxLengthTextField = 30;
  final String patternVietnamese =
      '[^aAàÀảẢãÃáÁạẠăĂằẰẳẲẵẴắẮặẶâÂầẦẩẨẫẪấẤậẬbBcCdDđĐeEèÈẻẺẽẼéÉẹẸêÊềỀểỂễỄếẾệỆfFgGhHiIìÌỉỈĩĨíÍịỊjJkKlLmMnNoOòÒỏỎõÕóÓọỌôÔồỒổỔỗỖốỐộỘơƠờỜởỞỡỠớỚợỢpPqQrRsStTuUùÙủỦũŨúÚụỤưƯừỪửỬữỮứỨựỰvVwWxXyYỳỲỷỶỹỸýÝỵỴzZ0123456789 ]';
  bool agreeTerms = false;
  bool isFilledInAll = false;
  bool showPassword = false;
  String isErrorFromServe = "";

  @override
  Widget build(BuildContext context) {
    Future<void> userSetup(String displayName, String email, String numberPhone,
        String password) async {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      FirebaseAuth auth = FirebaseAuth.instance;
      String uid = auth.currentUser.uid.toString();
      users.add({
        'userName': displayName,
        'email': email,
        'numberPhone': numberPhone,
        'password': password,
        'uid': uid,
      });
      return;
    }

    void _showToast(String context) {
      Fluttertoast.showToast(
        msg: context,
        backgroundColor: redColor,
        textColor: whiteColor,
        gravity: ToastGravity.CENTER,
      );
    }

    Future<void> signUpOnServe() async {
      try {
        await Firebase.initializeApp();
        UserCredential us = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        User updateUser = FirebaseAuth.instance.currentUser;
        updateUser.updateProfile(displayName: userController.text);
        userSetup(userController.text, emailController.text,
            numberPhoneController.text, passwordController.text);
      } on FirebaseAuthException catch (e) {
        isErrorFromServe = e.code.toString();
        // print(isErrorFromServe);
      } catch (e) {
        isErrorFromServe = e.toString();
        // print(isErrorFromServe);
      }
      if (isErrorFromServe == "") {
        Navigator.pop(context);
      } else {
        _showToast(isErrorFromServe);
      }
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
      return Color(0xff7243cf);
    }

    bool isCapitalLetter(String letter) {
      String letterToUpperCase =
          letter.replaceAll(RegExp(patternVietnamese), '').toUpperCase();
      return letter == letterToUpperCase ? true : false;
    }

    bool isNumberPhone(String numberPhone) {
      if (numberPhone == null) {
        return false;
      }
      return int.tryParse(numberPhone) != null;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: darkPurpleColor,
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(33),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'SegoeUI',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  margin: const EdgeInsets.only(top: 33, bottom: 22),
                  height: 48.0,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Username ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'SegoeUI',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: '(write in capital letters)',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'SegoeUI',
                                  ),
                                ),
                              ],
                            ),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'SegoeUI',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 11, bottom: 22),
                            child: TextField(
                              controller: userController,
                              maxLength: maxLengthTextField,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(11.0),
                                border: OutlineInputBorder(),
                                counterText: "",
                                hintText: 'Enter your username',
                                hintStyle: TextStyle(
                                  color: Color(0xffd7cee9),
                                  fontFamily: 'SegoeUI',
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xffe5e8fb),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'SegoeUI',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 11, bottom: 22),
                            child: TextField(
                              controller: emailController,
                              maxLength: maxLengthTextField,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(11.0),
                                border: OutlineInputBorder(),
                                counterText: "",
                                hintText: 'Enter your email',
                                hintStyle: TextStyle(
                                  color: Color(0xffd7cee9),
                                  fontFamily: 'SegoeUI',
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xffe5e8fb),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Phone',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'SegoeUI',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 11, bottom: 22),
                            child: TextField(
                              controller: numberPhoneController,
                              maxLength: maxLengthTextField,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(11.0),
                                border: OutlineInputBorder(),
                                counterText: "",
                                hintText: 'Enter your number phone',
                                hintStyle: TextStyle(
                                  color: Color(0xffd7cee9),
                                  fontFamily: 'SegoeUI',
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xffe5e8fb),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'SegoeUI',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 11, bottom: 5),
                            child: TextField(
                              controller: passwordController,
                              maxLength: maxLengthTextField,
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  child: Icon(showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                contentPadding: EdgeInsets.all(11.0),
                                border: OutlineInputBorder(),
                                counterText: "",
                                hintText: 'Enter your password',
                                hintStyle: TextStyle(
                                  color: Color(0xffd7cee9),
                                  fontFamily: 'SegoeUI',
                                ),
                              ),
                              obscureText: !showPassword,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xffe5e8fb),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 33),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    unselectedWidgetColor: Colors.redAccent,
                                  ),
                                  child: Checkbox(
                                    checkColor: Colors.greenAccent,
                                    activeColor: Colors.green,
                                    value: this.agreeTerms,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.agreeTerms = value;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  'I accept the terms of the agreement',
                                  style: TextStyle(
                                    color: Color(0xffd7cee9),
                                    fontSize: 12,
                                    fontFamily: 'SegoeUI',
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (userController.text == "" ||
                          emailController.text == "" ||
                          numberPhoneController.text == "" ||
                          passwordController.text == "") {
                        isFilledInAll = false;
                      } else {
                        isFilledInAll = true;
                      }
                      if (!isFilledInAll) {
                        _showToast('Bạn chưa điền đầy đủ thông tin');
                      } else if (!isCapitalLetter(userController.text)) {
                        _showToast(
                            'Username phải ghi in hoa và không có ký tự đặt biệt');
                      } else if (!isNumberPhone(numberPhoneController.text)) {
                        _showToast('Nhập số điện thoại không chính xác');
                      } else if (passwordController.text.length < 8) {
                        _showToast('Mật khẩu ít nhất 8 ký tự');
                      } else if (!agreeTerms) {
                        _showToast('Bạn chưa đọc và chấp nhận điều khoản');
                      } else {
                        isErrorFromServe = "";
                        signUpOnServe();
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            getbackgroudcolor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ))),
                    child: Container(
                      height: 40,
                      width: 160,
                      child: Center(
                        child: Text(
                          'Register',
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
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 33),
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(
                            color: Color(0xffd7cee9),
                            fontSize: 16,
                            fontFamily: 'SegoeUI',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                            color: Color(0xffd7cee9),
                            fontSize: 16,
                            fontFamily: 'SegoeUI',
                          ),
                        ),
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                            color: Color(0xff7243cf),
                            fontSize: 16,
                            fontFamily: 'SegoeUI',
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      color: Color(0xff7243cf),
                      fontSize: 16,
                      fontFamily: 'SegoeUI',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
