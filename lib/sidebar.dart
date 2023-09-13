import 'package:flutter/material.dart';
import 'package:serenitybyfatima/Tips.dart';
import 'package:serenitybyfatima/Videos.dart';
import 'package:serenitybyfatima/homescreen.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 247, 50, 115),
              shape: BoxShape.rectangle,
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Senerity',
                    style: TextStyle(
                      fontFamily: "Adelia",
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'By Fatima',
                    style: TextStyle(
                      fontFamily: "Quinger",
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home Page'),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.tips_and_updates),
            title: const Text('Self Defense Tips'),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Tips(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.video_collection),
            title: const Text('Self Defense Videos'),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const videopage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
