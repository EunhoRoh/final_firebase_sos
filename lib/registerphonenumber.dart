import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup.dart';

class RegisterPhoneNumberPage extends StatefulWidget {
  const RegisterPhoneNumberPage({Key? key}) : super(key: key);

  @override
  _RegisterPhoneNumberPageState createState() => _RegisterPhoneNumberPageState();

}

class _RegisterPhoneNumberPageState extends State<RegisterPhoneNumberPage> {
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
            Text('긴급 연락처 등록',
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
              child: Text('등록'),
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