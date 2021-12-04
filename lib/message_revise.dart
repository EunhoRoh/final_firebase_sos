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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class MessageRevise extends StatefulWidget {
  const MessageRevise({Key? key}) : super(key: key);

  @override
  _MessageReviseState createState() => _MessageReviseState();
}

class _MessageReviseState extends State<MessageRevise> {

  TextEditingController contents = new TextEditingController();

  CollectionReference _message =
  FirebaseFirestore.instance.collection('message');

  var currentUser = FirebaseAuth.instance.currentUser;

  Future<void> _createOrUpdate(String contents) async {
    DocumentReference documentReferencer = _message.doc(currentUser!.uid);

    Map<String, String> data = <String, String>{
      "message" : contents,
    };
    await documentReferencer.set(data)  .whenComplete(() => print("Notes item added to the database"))
        .catchError((e) => print(e));
    //await _profiles.add({"name": name, "phone" : phone});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: FutureBuilder<DocumentSnapshot>(
      future: _message.doc(currentUser!.uid).get(),
    builder:
    (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasData && !snapshot.data!.exists) {
        //contents.text = "";
      }
      else if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String,
            dynamic>;
        contents.text = data["message"];
      }
      return Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Text(
                  'SOS 메세지 수정',
                  style: TextStyle(height: 1,
                      fontSize: 30,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '  메세지를 적으세요',
                    style: TextStyle(height: 1,
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term',
                    ),
                    controller: contents,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 130.0, right: 130.0),
              child: ElevatedButton(
                child: Text('저장'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red, width: 2.0)))),
                onPressed: () {
                  _createOrUpdate(contents.text);
                },
              ),
            ),
          ],
        ),
      );
    }),
    );
  }
}
