import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/home.dart';
import '../home/navbar.dart';
import '../home/popUpMenu.dart';
import 'package:http/http.dart' as http;

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String? dropDownValue;
  final TextEditingController currentController = new TextEditingController();
  final TextEditingController newController = new TextEditingController();
  final TextEditingController conController = new TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String Success = "";

  final List<String> items = [
    '   Dashboard',
    '   Profile',
    '   Change Password',
    '   Sign out',
  ];
  String? selectedValue;

  bool _isLoading = false;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: const NavBar(),
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.grey,),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: IconButton(
                alignment: Alignment.centerLeft,
                icon: Image.asset('assets/logo-mobile.png'),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
              child: PopUpMenu(
                itemBuilder: [],
                icon: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/profile-pic.jpg'
                  ),
                ),
              ),
            )
          ],
          elevation: 2,
        ),
      ),
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Form(
        key: _formkey,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 220, 20),
                  child: Container(
                    child: const Text('Change Password',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.5,
                            color: Color(0xFFBDBDBD),
                            style: BorderStyle.solid),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(0, 0, 255, 10),
                  child: Text(
                    'Current Password',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                  child: Container(
                    width: 350,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    child: TextFormField(
                      controller: currentController,
                      obscureText: true,
                      decoration: const InputDecoration(

                        labelStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
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
                        ), labelText: 'Current Password',
                      ),
                    ),
                  ),
                ),

                const Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(0, 0, 260, 10),
                  child: Text(
                    'New Password',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                  child: Container(
                    width: 350,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    child: TextFormField(
                      controller: newController,
                      obscureText: true,
                      decoration: const InputDecoration(

                        labelStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
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
                        ), labelText: 'New Password',
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(0, 0, 250, 10),
                  child: Text(
                    'Confirm Password',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                  child: Container(
                    width: 350,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                    child: TextFormField(
                      controller: conController,
                      obscureText: true,
                      decoration: const InputDecoration(

                        labelStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
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
                        ), labelText: 'Confirm Password',
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding:
                  const EdgeInsetsDirectional.fromSTEB(30, 20, 25, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0, 0, 0, 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff090337),
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            fixedSize: const Size(120, 40),
                          ),
                          onPressed: currentController.text == "" || newController == "" || conController == "" ? null : () async {
                            setState(() {
                              _isLoading =false;
                            });

                            update(currentController.text,newController.text,conController.text);
                          },
                          child: const Text("Update"),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(120, 0, 0, 0),
                        child: Text(Success,
                          style: const TextStyle(
                            color: Colors.lightGreenAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
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
    );
  }
  Future update(String currentPassword, newPassword, confirmPassword) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'opass': currentPassword,
      'npass': newPassword,
      'cpass': confirmPassword,
      'custID' : '15'
    };
    var jsonResponse = null;
    var response =  await http.post(
        Uri.parse('https://www.ooze.co.bw/demo/cust-app/api/changepassword?opass=faizan108&npass=faizan108&cpass=faizan108&custID=15'),body: data);
    if (response.statusCode == 200) {
      jsonResponse =json.decode(response.body);
      if(jsonResponse != null){
        setState(() {
          _isLoading =false;
          Success= "Updated";

        });
        sharedPreferences.setString("url", jsonResponse['url']);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
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
