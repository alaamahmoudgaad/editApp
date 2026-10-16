import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_application_1/account.dart';
import 'package:flutter_application_1/edit.dart';
import 'package:flutter_application_1/settings.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {

  final ImagePicker picker = ImagePicker();
File? selectedImage;

Future<void> pickImage(ImageSource source) async {
  final XFile? image = await picker.pickImage(
    source: source,
  );

  if (image == null) return;

  setState(() {
    selectedImage = File(image.path);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          padding: EdgeInsets.all(24.0),

          child: Container(
            width: double.infinity,
            height: 380,
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(30.0,), 
              border: Border.all(color: Colors.grey.shade300, width: 1,), 
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),

            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            children: [
              if (selectedImage != null)
  Image.file(
    selectedImage!,
    height: 180,
    width: 220,
    fit: BoxFit.contain,
  )
else
  const Icon(
    Icons.add_photo_alternate_outlined,
    size: 90.0,
    color: Color.fromRGBO(222, 208, 240, 1),
  ),
              SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: ()=> pickImage(ImageSource.gallery),
                  icon: Icon(Icons.photo_library, color: Color.fromARGB(255, 115, 115, 118)),
                  label: Text(
                    'Upload from gallery',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 115, 115, 118),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(235, 221, 255, 1),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: ()=> pickImage(ImageSource.camera),
                  icon: const Icon(Icons.camera_alt, color: Colors.grey),
                  label: const Text(
                    'Capture from camera',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ),

          // child: ListView(
          //   scrollDirection: Axis.vertical,
          //   children: <Widget>[
          //     ListTile(
          //       leading: Text('most popular', style: TextStyle()),
          //       trailing: Text('view all'),
          //       onTap: () {},
          //     ),

          //     Container(
          //       height: 400.0,
          //       margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          //       child: ListView(
          //         scrollDirection: Axis.horizontal,
          //         children: <Widget>[
          //           Container(
          //             height: 100.0,
          //             width: 100.0,
          //             margin: EdgeInsets.all(8.0),
          //             decoration: BoxDecoration(
          //               // color: Colors.amber,
          //               borderRadius: BorderRadius.circular(30.0),
          //               // border: Border.all(color: Colors.black12, width: 1.0),
          //             ),
          //             child: Column(
          //               children: <Widget>[
          //                 Container(
          //                   height: 80.0,
          //                   decoration: BoxDecoration(
          //                     image: DecorationImage(
          //                       image: AssetImage('assets/download2.jpg'),
          //                       fit: BoxFit.fill,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),

          //           Container(
          //             height: 100.0,
          //             width: 100.0,
          //             margin: EdgeInsets.all(8.0),
          //             decoration: BoxDecoration(
          //               // color: Colors.amber,
          //               borderRadius: BorderRadius.circular(30.0),
          //               // border: Border.all(color: Colors.black12, width: 1.0),
          //             ),
          //             child: Column(
          //               children: <Widget>[
          //                 Container(
          //                   height: 80.0,
          //                   decoration: BoxDecoration(
          //                     image: DecorationImage(
          //                       image: AssetImage('assets/download2.jpg'),
          //                       fit: BoxFit.fill,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
