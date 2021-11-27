import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
/*
class EditPhoneNumberPage extends StatefulWidget {
  const EditPhoneNumberPage({Key? key}) : super(key: key);

  @override
  _EditPhoneNumberPageState createState() => _EditPhoneNumberPageState();

}

class _EditPhoneNumberPageState extends State<EditPhoneNumberPage> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.black,
                  icon: Icon(Icons.arrow_back)
              ),
            ),
            const SizedBox(height: 80.0),
            Text('긴급 연락처 수정',
              style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(120, 120, 120, 100),

              ),
            ),
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget> [
                    Text('이름',
                      style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,

                      ),
                    ),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'Name',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget> [
                    Text('전화번호',
                      style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,

                      ),
                    ),
                    TextField(
                      controller: _phoneNumberController,
                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'PhoneNumber',
                      ),
                      obscureText: true,
                    ),
                  ],
                ),

                const SizedBox(height: 12.0),



                const SizedBox(height: 16.0),
              ],
            ),
            const SizedBox(height: 50.0),



            ElevatedButton(
              child: Text('수정'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUp()),
                );
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide(width:3, color:Colors.brown)),
                elevation: MaterialStateProperty.all(2),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(30)
                    )),
                backgroundColor: MaterialStateProperty.all(Colors.red),
                padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold)),

              ),
            ),
            const SizedBox(height: 12.0),


          ],
        ),
      ),
    );
  }
}*/


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


class EditPhoneNumberPage extends StatelessWidget {
  const EditPhoneNumberPage({Key? key}) : super(key: key);
  //final _nameController = TextEditingController();
  //final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.black,
                  icon: Icon(Icons.arrow_back)
              ),
            ),
            const SizedBox(height: 80.0),
            Text('긴급 연락처 수정',
              style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(120, 120, 120, 100),

              ),
            ),
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget> [
                    Text('이름',
                      style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,

                      ),
                    ),
                    TextField(
                      //controller: _nameController,
                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'Name',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget> [
                    Text('전화번호',
                      style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,

                      ),
                    ),
                    TextField(
                      //controller: _phoneNumberController,
                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'PhoneNumber',
                      ),
                      obscureText: true,
                    ),
                  ],
                ),

                const SizedBox(height: 12.0),



                const SizedBox(height: 16.0),
              ],
            ),
            const SizedBox(height: 50.0),



            ElevatedButton(
              child: Text('수정'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUp()),
                );
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide(width:3, color:Colors.brown)),
                elevation: MaterialStateProperty.all(2),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(30)
                    )),
                backgroundColor: MaterialStateProperty.all(Colors.red),
                padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold)),

              ),
            ),
            const SizedBox(height: 12.0),


          ],
        ),
      ),
    );
  }
}