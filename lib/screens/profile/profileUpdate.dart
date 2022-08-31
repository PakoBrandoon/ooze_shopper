import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../home/home.dart';
import '../home/navbar.dart';
import '../home/popUpMenu.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  String? dropDownValue;
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController5;
  TextEditingController? textController6;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> item = [
    '   Mascom Pinless Airtime(MPAT)',
    '   Orange Pinless Airtime(OPAT)',
    '   Electricity(BPC)',
  ];

  final List<String> items = [
    '   Dashboard',
    '   Profile',
    '   Change Password',
    '   Sign out',
  ];
  String? selectedValue;

  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController5 = TextEditingController();
    textController6 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        drawer: const NavBar(),
    key: scaffoldKey,
    appBar: PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: AppBar(
    iconTheme: const IconThemeData( color: Colors.grey,),
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
    padding: EdgeInsetsDirectional.fromSTEB(0,0,5,0),
    child: PopUpMenu(
    itemBuilder: [ ],
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
          child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                   mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 220, 20),
                      child: Container(
                        child: const Text('Profile Updates',
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
                                bottom: BorderSide(width: 1.5, color: Color(0xFFBDBDBD), style: BorderStyle.solid),
                              ),
                            ),
                          ),
                      ),
                    const Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0, 0, 260, 10),
                      child: Text(
                        'Own Cell Number',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
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
                          controller: textController3,
                          obscureText: false,
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
                            ),labelText: 'Cell Number',
                          ),
                        ),
                      ),
                    ),

                      const Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0, 0, 310, 10),
                        child: Text(
                          'Product',
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
                        child:DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: const Text('   Please select Product',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            items: item.map((item) =>
                                DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as String;
                              });
                            },
                            buttonHeight: 40,
                            buttonWidth: 350,
                            itemHeight: 40,
                            buttonDecoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                color: const Color(0xFFC5C5C5),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0, 0, 288, 10),
                        child: Text(
                          'First Name',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
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
                            controller: textController3,
                            obscureText: false,
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
                              ),labelText: 'First Name',
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0, 0, 288, 10),
                        child: Text(
                          'Last Name',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
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
                            controller: textController3,
                            obscureText: false,
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
                              ),labelText: 'Last Name',
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0, 0, 318, 10),
                        child: Text(
                          'Email',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
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
                            controller: textController3,
                            obscureText: false,
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
                              ),labelText: 'Email',
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
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                child: const Text("Update"),
                              ),
                            ),
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
