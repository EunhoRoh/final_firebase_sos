// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:final_firebase_sos/home.dart';
import 'package:final_firebase_sos/message_revise.dart';
import 'package:final_firebase_sos/search.dart';
import 'package:final_firebase_sos/mypage.dart';
import 'package:final_firebase_sos/f_hotels.dart';
import 'package:final_firebase_sos/login.dart';
import 'package:final_firebase_sos/home.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  CollectionReference _profiles =
  FirebaseFirestore.instance.collection('profile');

  TextEditingController saved_name = new TextEditingController(text : "   ");
  TextEditingController saved_phone = new TextEditingController(text : "");
  TextEditingController saved_age = new TextEditingController(text : "");
  TextEditingController saved_job = new TextEditingController(text : "");
  TextEditingController saved_address = new TextEditingController(text : "");

  TextEditingController protect_name = new TextEditingController(text : "");
  TextEditingController protect_address = new TextEditingController(text : "");

  String dropdownValue = '??????';
  String dropdownValue2 = '??????';

  var currentUser = FirebaseAuth.instance.currentUser;

  Future<void> _createOrUpdate(String name, String phone, String age, String job, String address, String pro_name, String pro_phone) async {
    DocumentReference documentReferencer = _profiles.doc(currentUser!.uid);

    Map<String, String> data = <String, String>{
      "name": name,
      "phone": phone,
      "age" : age,
      "job" : job,
      "address" : address,
      "protect_name" : pro_name,
      "protect_phone" : pro_phone,
    };
    await documentReferencer
        .set(data)
        .whenComplete(() => print("Notes item added to the database"))
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text(
                '?????? ?????????',
                style: TextStyle(height: 5, fontSize: 30, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
                leading: IconButton(
                  icon: const Icon(
                    Icons.home,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
                title: const Text('??? ??????'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }),
            ListTile(
                leading: IconButton(
                  icon: const Icon(
                    Icons.contact_page,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MessageRevise()),
                    );
                  },
                ),
                title: const Text('????????? ??????'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MessageRevise()),
                  );
                }),
            ListTile(
                leading: IconButton(
                  icon: const Icon(
                    Icons.contact_page_outlined,
                    semanticLabel: '????????? ??????',
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Search()),
                    );
                  },
                ),
                title: const Text('????????? ??????'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Search()),
                  );
                }),
            ListTile(
                leading: IconButton(
                  icon: const Icon(
                    Icons.message,
                    semanticLabel: 'SOS ????????? ??????',
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MessageRevise()),
                    );
                  },
                ),
                title: const Text('SOS ????????? ??????'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MessageRevise()),
                  );
                }),
            ListTile(
                leading: IconButton(
                  icon: const Icon(
                    Icons.person,
                    semanticLabel: '?????? ?????????',
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyPage()),
                    );
                  },
                ),
                title: const Text('?????? ?????????'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyPage()),
                  );
                }),
            ListTile(
                leading: IconButton(
                  icon: const Icon(
                    Icons.logout,
                    semanticLabel: '????????????',
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                ),
                title: const Text('????????????'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                }),
          ],
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
          future: _profiles.doc(currentUser!.uid).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData && !snapshot.data!.exists) {
                  saved_name.text = "";
                  saved_phone.text = "";
                  saved_age.text = "";
                  saved_job.text = "";
                  saved_address.text = "";
                  protect_name.text = "";
                  protect_address.text = "";
                }

                else if(snapshot.connectionState == ConnectionState.done){
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              saved_name.text = data["name"];
              saved_phone.text = data["phone"];
              saved_age.text = data["age"];
              saved_job.text = data["job"];
              saved_address.text = data["address"];
              protect_name.text = data["pro_name"];
              protect_address.text = data["pro_phone"];
            }


            return SafeArea(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                children: <Widget>[
                  const SizedBox(height: 10.0),
                  Column(
                    children: <Widget>[
                      Row(children: [
                        const Text(
                          '??? ??????',
                          style: TextStyle(
                              height: 1,
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
                        image != null
                            ? ClipOval(
                          child: Image.file(
                            image!,
                            fit: BoxFit.cover,
                            width: 70,
                            height: 70,
                          ),
                        )
                            : IconButton(
                          icon: Image.asset('image/sos_button.png'),
                          iconSize: 70,
                          onPressed: () {},
                        ),
                      ]),
                      const SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        //height: 300.0,
                        //width: 300.0,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  '??????',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 57),
                                Container(
                                  height: 30,
                                  width: 150,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 10.0, 5.0),
                                      border: OutlineInputBorder(),
                                      hintText: '??????',
                                    ),
                                    controller: saved_name,
                                  ),
                                ),
                                const SizedBox(width: 40),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                const Text(
                                  '????????????',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Container(
                                  height: 30,
                                  width: 150,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 10.0, 5.0),
                                      border: OutlineInputBorder(),
                                      hintText: '????????????',
                                    ),
                                    controller: saved_phone,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                const Text(
                                  '??????',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 57),
                                Container(
                                    height: 30,
                                    width: 150,
                                    child: DropdownButton<String>(
                                      value: dropdownValue,
                                      icon: const Icon(Icons.arrow_downward),
                                      iconSize: 24,
                                      elevation: 16,
                                      underline: Container(
                                        height: 2,
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue = newValue!;
                                        });
                                      },
                                      items: <String>[
                                        '??????',
                                        '???',
                                        '???',
                                      ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                const Text(
                                  '??????',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 57),
                                Container(
                                  height: 30,
                                  width: 150,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 10.0, 5.0),
                                      border: OutlineInputBorder(),
                                      hintText: '??????',
                                    ),
                                    controller: saved_age,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                const Text(
                                  '??????',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 57),
                                Container(
                                  height: 30,
                                  width: 150,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 10.0, 5.0),
                                      border: OutlineInputBorder(),
                                      hintText: '??????',
                                    ),
                                    controller: saved_job,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                const Text(
                                  '??????',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 57),
                                Container(
                                  height: 30,
                                  width: 240,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 10.0, 5.0),
                                      border: OutlineInputBorder(),
                                      hintText: '??????',
                                    ),
                                    controller: saved_address,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '????????? ??????',
                          style: TextStyle(
                              height: 1,
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 100,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 10.0, 5.0),
                                      border: OutlineInputBorder(),
                                      hintText: '??????',
                                    ),
                                    controller: protect_name,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 130,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 10.0, 5.0),
                                      border: OutlineInputBorder(),
                                      hintText: '????????????',
                                    ),
                                    controller: protect_address,
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.centerRight,
                                    height: 30,
                                    width: 100,
                                    child: DropdownButton<String>(
                                      value: dropdownValue2,
                                      icon: const Icon(Icons.arrow_downward),
                                      iconSize: 24,
                                      elevation: 16,
                                      underline: Container(
                                        height: 2,
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue2 = newValue!;
                                        });
                                      },
                                      items: <String>[
                                        '??????',
                                        '?????????',
                                        '?????????',
                                        '????????????',
                                        '?????????',
                                        '??????',
                                        '??????',
                                        '??????',
                                        '??????',
                                        '??????',
                                        '??????',
                                        '??????',
                                        '??????'
                                      ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 130.0, right: 130.0),
                    child: ElevatedButton(
                      child: Text('??????'),
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.red),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(
                                      color: Colors.red, width: 2.0)))),
                      onPressed: () {
                        _getImage(ImageSource.gallery);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 130.0, right: 130.0),
                    child: ElevatedButton(
                      child: Text('??????'),
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.red),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(
                                      color: Colors.red, width: 2.0)))),
                      onPressed: () {
                        _createOrUpdate(saved_name.text, saved_phone.text, saved_age.text, saved_job.text, saved_address.text,
                        protect_name.text, protect_address.text);
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  File? image;

  Future _getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      //final imageTemporary = File(image.path);
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() => this.image = imagePermanent);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    //writePath('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }
/*
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/path.txt');
  }

  Future<File> writePath(String path) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(path);
  }

  Future<String> readPath() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return '';
    }
  }

  void setImage () async{
    var temp = await readPath();
    if(temp != ''){
      this.image = File(temp);
      print(temp);
    }
  }
  */
}
