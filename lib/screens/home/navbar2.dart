import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ooze_shopper/screens/profile/changePassword.dart';
import 'package:ooze_shopper/screens/profile/profileUpdate.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

class NavBar2 extends StatefulWidget {
  const NavBar2({Key? key}) : super(key: key);

  @override
  State<NavBar2> createState() => _NavBar2State();
}

class _NavBar2State extends State<NavBar2> {
  @override
  Widget build(BuildContext context) {
    return MultiLevelDrawer(
      header: Container(
        height: 2,
        width: 120,
      ),
        children: [
          MLMenuItem(
              leading: Column(
                children: [
                  Icon(
                      Icons.person_outlined,
                      color: Colors.black54,
                      size: 20,
                    ),
                ],
              ),
                    onClick: () async {
                        await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                        builder: (context) => ProfileUpdate(),
                            ),
                            (r) => false,
                      );
                    },
                    content: const Text(
                                'Profile',
                                  style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                      ),
                                  ),
              ),

          MLMenuItem(
            leading: Icon(
                Icons.person_add_alt,
                color: Colors.black54,
                size: 20,
              ),
              onClick: () async {
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileUpdate(),
                  ),
                    (r) => false,
                );
              },content : const Text(
            'Profile Updates',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
            ),
          ),
            ),

          MLMenuItem(
            leading: Icon(
                Icons.lock_outline,
                color: Colors.black54,
                size: 20,
              ),
              onClick: () async {
              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangePassword(),
                ),
                  (r) => false,
              );
              },
              content : const Text(
                          'Change Password',
                          style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                               ),
                              ),
            ),
        ],
      );
  }
}
