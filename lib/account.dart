import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(235, 221, 255, 1),
        title: Text(
          'My Account',
          style: TextStyle(
            color: Color.fromARGB(255, 134, 141, 145),
            fontSize: 20.0,
          ),
        ),
      ),

      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(8.0),
              child: ClipOval(
                child: Image.asset('assets/profile.jpg', fit: BoxFit.fill,
                width: 150.0,
                height: 150.0,),
              ),
            ),

            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                title: Text(
                  'Alaa',
                  style: TextStyle(
                    color:  const Color.fromARGB(255, 123, 123, 123),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),

                leading: Icon(
                  Icons.account_circle,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  size: 20.0,
                ),

                trailing: Icon(
                  Icons.edit,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  size: 20.0,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                title: Text(
                  'Alaa@gmail.com',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 123, 123, 123),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),

                leading: Icon(
                  Icons.email,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  size: 20.0,
                ),

                trailing: Icon(
                  Icons.edit,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  size: 20.0,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                title: Text(
                  '*********',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 123, 123, 123),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),

                leading: Icon(
                  Icons.lock,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  size: 20.0,
                ),

                trailing: Icon(
                  Icons.edit,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  size: 20.0,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
