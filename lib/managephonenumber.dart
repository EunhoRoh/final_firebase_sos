import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
/*
class ManagePhoneNumberPage extends StatefulWidget {
  const ManagePhoneNumberPage({Key? key}) : super(key: key);

  @override
  _ManagePhoneNumberPageState createState() => _ManagePhoneNumberPageState();

}

class _ManagePhoneNumberPageState extends State<ManagePhoneNumberPage> {
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
            Text('등록된 연락처',
              style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(120, 120, 120, 100),

              ),
            ),
            const SizedBox(height: 50.0),
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



          ],
        ),
      ),
    );
  }
}
*/

class ManagePhoneNumberPage extends StatelessWidget {
  const ManagePhoneNumberPage({Key? key}) : super(key: key);
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
            Text('등록된 연락처',
              style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(120, 120, 120, 100),

              ),
            ),
            const SizedBox(height: 50.0),
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



          ],
        ),
      ),
    );
  }
}


