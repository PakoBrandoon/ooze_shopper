import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({Key? key, required List<PopupMenuItem<String>> itemBuilder, required CircleAvatar icon}) : super(key: key);

  @override
  _PopUpMenuState createState() => _PopUpMenuState();

}


class _PopUpMenuState extends State {
  var selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const CircleAvatar(
        backgroundImage: AssetImage(
            'assets/profile-pic.jpg'
        ),
      ),
      onSelected: (value){
        setState(() {
          selectedItem =value.toString();
        });
        Navigator.pushNamed(context, value.toString());
      },
      itemBuilder: (BuildContext bc){
        return const [
          PopupMenuItem(
            value: '/Dashboard',
            child: Text('Dashbord'),
          ),

          PopupMenuItem(
            value: '/Profile',
            child:  Text('Profile'),
          ),

          PopupMenuItem(
            value: '/Change Password',
            child: Text('Change Password'),
          ),

          PopupMenuItem(
            value: '/SignOut',
            child: Text('Sign out'),
          ),

        ];
      } ,
      position: PopupMenuPosition.under,
    );
  }
}
