import 'package:flutter/material.dart';
import 'package:ooze_shopper/models/transaction.dart';
import 'package:ooze_shopper/screens/home/navbar.dart';
import 'package:ooze_shopper/screens/home/popUpMenu.dart';
import 'package:ooze_shopper/screens/profile/changePassword.dart';
import 'package:ooze_shopper/screens/profile/profileUpdate.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/remote_service.dart';
import '../authenticate/login.dart';
import '../home/home.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory ({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {

  late Future<Transaction> futureTransaction;
  var isLoaded = false;
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
    futureTransaction = RemoteService().fetchTransaction();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('customer_id') == null) {
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
            ),
          ],
          elevation: 2,
        ),
      ), drawer: const NavBar(),
      backgroundColor: Colors.grey[50],


    body: Center(
      child: Column(
        children: [
          Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 180, 20),
          child: Container(
            child: const Text('Transaction History',
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
          FutureBuilder<Transaction>(
            future: futureTransaction,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return Text(snapshot.data!.name);
              }else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }
          ),
        ],
      ),
      ),
      );
  }
}