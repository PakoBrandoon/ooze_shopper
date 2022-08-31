import 'package:flutter/material.dart';
import 'package:ooze_shopper/screens/authenticate/login.dart';
import 'package:ooze_shopper/screens/home/home.dart';
import 'package:ooze_shopper/screens/home/navbar2.dart';
import 'package:ooze_shopper/screens/profile/profileUpdate.dart';
import 'package:ooze_shopper/screens/trannsaction/transactionHistory.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
            width: 120,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0,80,0,0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.store_mall_directory_outlined,
                      color: Colors.black54,
                      size: 30,
                    ),
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
                const Text(
                  'Dashboards',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.person_outlined,
                    color: Colors.black54,
                    size: 30,
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBar2(),
                      ),
                    );
                  },
                ),
                const Text(
                    'Profile',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                    ),
                  ),
                IconButton(
                  icon: const Icon(
                    Icons.lightbulb_outlined,
                    color: Colors.black54,
                    size: 30,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
                const Text(
                  'Online Recharge',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.sync,
                    color: Colors.black54,
                    size: 30,
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransactionHistory(),
                      ),
                    );
                  },
                ),
                const Text(
                  'Transaction History',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.storage_sharp,
                    color: Colors.black54,
                    size: 30,
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransactionHistory(),
                      ),
                    );
                  },
                ),
                const Text(
                  'Transaction Status',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.sensor_door_outlined,
                    color: Colors.black54,
                    size: 30,
                  ),
                  onPressed: () async {
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                          (r) => false,
                    );
                  },
                ),
                const Text(
                  'Logout',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
  }
}
