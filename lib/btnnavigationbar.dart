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

  int current = 0 ;
  List screens =[ 
    Myhome() , Edit() , Account() ,Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

            appBar: AppBar(
        backgroundColor: Color.fromRGBO(235, 221, 255, 1),
        elevation: 0.0,
        title: Text(
          'image processing',
          style: TextStyle(
            color: Color.fromARGB(255, 134, 141, 145),
            fontSize: 20.0,
          ),
        ),
        // leading: Icon(Icons.location_on,
        // size: 25.0,
        // color: Colors.black,
        // ),

        // actions: [

        // Icon(Icons.search),

        // Icon(Icons.notifications),

        // Icon(Icons.settings)
        // ],
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 134, 141, 145),
          size: 25.0,
        ),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color.fromRGBO(239, 230, 251, 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    child: Image.asset('assets/profile.jpg'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Alaa',
                  style: TextStyle(color: const Color.fromARGB(255, 131, 131, 131)),
                  )
                ],

              ),
              ),

              ListTile(
                leading: Icon(Icons.home , color: const Color.fromARGB(255, 131, 131, 131) ),
                title: Text('Home',
                style: TextStyle(color: const Color.fromARGB(255, 131, 131, 131)  ,fontSize: 16.0),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Myhome()), 
                    );
                },
                ),

                ListTile(
                leading: Icon(Icons.edit, color: const Color.fromARGB(255, 131, 131, 131) ),
                title: Text('Edit',
                style: TextStyle(color: const Color.fromARGB(255, 131, 131, 131) ,fontSize: 16.0),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Edit()), 
                    );
                },
                ),

                ListTile(
                leading: Icon(Icons.account_circle , color: const Color.fromARGB(255, 131, 131, 131)),
                title: Text('Account',
                style: TextStyle(color: const Color.fromARGB(255, 131, 131, 131)  ,fontSize: 16.0),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Account()), 
                    );
                },
                ),

                ListTile(
                leading: Icon(Icons.settings , color: const Color.fromARGB(255, 131, 131, 131)),
                title: Text('Settings',
                style: TextStyle(color: const Color.fromARGB(255, 131, 131, 131)  ,fontSize: 16.0),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Settings()), 
                    );
                },
                ),
          ],
        ),
      ),
      
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: BottomNavigationBar(
        items:[

        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          ),

          BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          label: 'Edit',
          ),

          BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
          ),

          BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          ),

        ],
        backgroundColor: Colors.grey[300],
        elevation: 5.0,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 15.0,
        selectedIconTheme: IconThemeData(color: Colors.black , size:20.0),
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
        ),

        unselectedFontSize: 15.0,
        unselectedIconTheme: IconThemeData(color: Colors.grey , size:20.0),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
        ),

        currentIndex: current ,
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