import 'package:flutter/material.dart';
import 'package:flutter_application_1/account.dart';
import 'package:flutter_application_1/edit.dart';
import 'package:flutter_application_1/myhome.dart';
import 'package:flutter_application_1/settings.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [ 
      Myhome(
        onImageSelected: (index) {
          setState(() {
            current = index; 
          });
        },
      ), 
      selectedImage != null 
          ? Edit(image: selectedImage!) 
          : const Scaffold(body: Center(child: Text('Please select an image first!'))),
      const Account(), 
      const Settings(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(235, 221, 255, 1),
        elevation: 0.0,
        title: const Text(
          'image processing',
          style: TextStyle(
            color: Color.fromARGB(255, 134, 141, 145),
            fontSize: 20.0,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 134, 141, 145),
          size: 25.0,
        ),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color.fromRGBO(239, 230, 251, 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    child: Image.asset('assets/profile.jpg'),
                  ),
                  const SizedBox(height: 10.0),
                  const Text('Alaa',
                    style: TextStyle(color: Color.fromARGB(255, 131, 131, 131)),
                  )
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home, color: Color.fromARGB(255, 131, 131, 131)),
              title: const Text('Home', style: TextStyle(color: Color.fromARGB(255, 131, 131, 131), fontSize: 16.0)),
              onTap: () {
                Navigator.pop(context);
                setState(() { current = 0; });
              },
            ),

            ListTile(
              leading: const Icon(Icons.edit, color: Color.fromARGB(255, 131, 131, 131)),
              title: const Text('Edit', style: TextStyle(color: Color.fromARGB(255, 131, 131, 131), fontSize: 16.0)),
              onTap: () {
                Navigator.pop(context);
                setState(() { current = 1; });
              },
            ),

            ListTile(
              leading: const Icon(Icons.account_circle, color: Color.fromARGB(255, 131, 131, 131)),
              title: const Text('Account', style: TextStyle(color: Color.fromARGB(255, 131, 131, 131), fontSize: 16.0)),
              onTap: () {
                Navigator.pop(context);
                setState(() { current = 2; });
              },
            ),

            ListTile(
              leading: const Icon(Icons.settings, color: Color.fromARGB(255, 131, 131, 131)),
              title: const Text('Settings', style: TextStyle(color: Color.fromARGB(255, 131, 131, 131), fontSize: 16.0)),
              onTap: () {
                Navigator.pop(context);
                setState(() { current = 3; });
              },
            ),
          ],
        ),
      ),
      
      backgroundColor: Colors.grey[100],
      
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Edit'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        backgroundColor: Colors.grey[300],
        elevation: 5.0,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 15.0,
        selectedIconTheme: const IconThemeData(color: Colors.black, size: 20.0),
        selectedItemColor: Colors.black,
        unselectedFontSize: 15.0,
        unselectedIconTheme: const IconThemeData(color: Colors.grey, size: 20.0),
        unselectedItemColor: Colors.grey,
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
      ),

      body: screens[current], 
    );
  }
}