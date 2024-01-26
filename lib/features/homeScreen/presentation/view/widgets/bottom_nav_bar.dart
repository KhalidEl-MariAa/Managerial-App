import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kuhl_store/core/usable_names.dart';

import '../home_screen_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key,required this.ontap});
  final void Function(int)? ontap;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: widget.ontap,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic,),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedFontSize: 15,
          unselectedFontSize: 13,
          backgroundColor: UsableNames.col,
          items: const [
              BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(right:5.0),
                child: Icon(FontAwesomeIcons.warehouse),
              ),
              label:'Stocks'
              ),

              BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.handshake),
              label: 'Orders'),

              BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.truck),
              label: 'Incoming',
              ),
             BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.clockRotateLeft),
              label:'History' )
          ]);
  }
}