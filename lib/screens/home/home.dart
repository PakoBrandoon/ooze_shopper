import 'package:flutter/material.dart';
import 'package:ooze_shopper/screens/home/navbar.dart';
import 'package:ooze_shopper/screens/home/popUpMenu.dart';
import 'package:ooze_shopper/screens/profile/changePassword.dart';
import 'package:ooze_shopper/screens/profile/profileUpdate.dart';
import 'package:ooze_shopper/screens/trannsaction/transactionHistory.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../authenticate/login.dart';
import 'navbar2.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late SharedPreferences sharedPreferences;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> items = [
    '   Dashboard',
    '   Profile',
    '   Change Password',
    '   Sign out',
  ];

  final List<String> proitem = [
    '   Profile',
    '   Profile Updates',
    '   Change Password',
  ];

  String? selectedValue;
  var selectedItem = '';

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString('customer_id') == null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
            (r) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
            ),
          ],
          elevation: 2,
        ),
      ),drawer: const NavBar(),
      backgroundColor: Colors.grey[50],
                       body: SafeArea(
                        child: GestureDetector(
                          onTap: () => FocusScope.of(context).unfocus(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(width: 1.5, color: Color(0xFFBDBDBD), style: BorderStyle.solid),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 260, 20),
                                            child: Container(
                                              child: const Text(
                                                'Dashboard',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                                    child: GridView(
                                      padding: EdgeInsets.zero,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 1,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ProfileUpdate(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                                                  child: Image.asset(
                                                    'assets/profile.png',
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  'YOUR\nPROFILE',
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ChangePassword(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                                                  child: Image.asset(
                                                    'assets/password.png',
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const Text(
                                                  'CHANGE\nPASSWORD',
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                                                child: Image.asset(
                                                  'assets/recharge.png',
                                                  width: 70,
                                                  height: 70,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const Text(
                                                'ONLINE\nRECHARGE',
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => TransactionHistory(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                                                  child: Image.asset(
                                                    'assets/history.png',
                                                    width: 70,
                                                    height: 70,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const Text(
                                                  'TRANSACTION\nHISTORY',
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                                                child: Image.asset(
                                                  'assets/fingerprint.png',
                                                  width: 70,
                                                  height: 70,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const Text(
                                                'Set Login with\nFinger Print',
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ),
                       ),
    );
  }
}
