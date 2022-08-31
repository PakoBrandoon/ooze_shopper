import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ooze_shopper/screens/authenticate/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPws extends StatefulWidget {
  const ForgotPws({Key? key}) : super(key: key);

  @override
  _ForgotPwsWidgetState createState() => _ForgotPwsWidgetState();
}

class _ForgotPwsWidgetState extends State<ForgotPws> {
  bool _isLoading = false;
  final TextEditingController emailController = new TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String Success = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      //backgroundColor: Colors.indigoAccent,
      body: Container(
        height: 800,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/innerbg.jpg"),
              fit: BoxFit.cover,
            ),
        ),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0,150, 0, 10),
                    child: Image.asset(
                      'assets/logo-black.png',
                      width: 350,
                      height: 60,
                      fit: BoxFit.contain,
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [

                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 30),
                                  child: Container(
                                    width: 350,
                                    height: 100,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFE2E2E2),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: const [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              20, 25, 20, 0),
                                          child: Text(
                                            'Please enter your Email-ID or cell No. so we can send you an email to reset your password.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 180, 10),
                                    child: Text(
                                      'Forgot Password',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional
                                          .fromSTEB(
                                          10, 0, 10, 0),
                                      child: Container(
                                        width: 300,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                        child: TextFormField(
                                          controller: emailController,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            labelText: 'Email/ Cell Number',
                                            labelStyle: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w300,
                                            ),
                                            hintText: ' ',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC5C5C5),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC5C5C5),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    30, 20, 25, 0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(width: 1.5,
                                          color: Color(0xFFBDBDBD),
                                          style: BorderStyle.solid),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(
                                            125, 0, 0, 10),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: const Color(0xff090337),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: new BorderRadius
                                                  .circular(30.0),
                                            ),
                                            fixedSize: const Size(170, 40),
                                          ),
                                          onPressed: emailController.text == "" ? null : () async {
                                            setState(() {
                                              _isLoading = false;
                                            });
                                            reset(emailController.text);
                                          },
                                          child: const Text("GET PASSWORD"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    120, 0, 0, 0),
                                child: Text(Success,
                                  style: const TextStyle(
                                    color: Colors.lightGreenAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Text(
                                      '                                                                          ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w100,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 25),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const Login(),
                                          ),
                                              (r) => false,
                                        );
                                      },
                                      child: const Text(
                                        'Login My Account',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFFF0000),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void reset(String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
    };
    var jsonResponse = null;
    var response = await http.post(Uri.parse(
        'https://www.ooze.co.bw/demo/cust-app/api/forgotpass?email=faizan@discreet.co.bw'),
        body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
          Success ="Sent";
        });
        sharedPreferences.setString("customer_id", jsonResponse['customer_id']);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
              (r) => false,
        );
      } else {
        print(response.body);
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}


