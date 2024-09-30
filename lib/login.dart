import 'package:flutter/material.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String _password = "";
  bool isClicked = false;

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 1), () {});
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomePage(username: _username)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text("HALAMAN LOGIN")),
          body: Column(
            children: [
              _usernameField(),
              _passwordField(),
              _LoginButton(context),
            ],
          )),
    );
  }

// Field Input Username
  Widget _usernameField() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: TextFormField(
            enabled: true,
            onChanged: (value) {
              _username = value;
            },
            decoration: InputDecoration(
                hintText: 'Masukkan Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(width: 5, color: Colors.blueAccent),
                ))));
  }

//Field input Password
  Widget _passwordField() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: TextFormField(
            enabled: true,
            onChanged: (value) {
              _password = value;
            },
            decoration: InputDecoration(
                hintText: 'Masukkan Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(width: 5, color: Colors.grey),
                ))));
  }

// Tombol Login
  Widget _LoginButton(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: isClicked == true
                ? WidgetStateProperty.all(
                    const Color.fromARGB(255, 30, 170, 185))
                : WidgetStateProperty.all(
                    const Color.fromARGB(255, 43, 210, 179),
                  ),
          ),
          onPressed: () {
            if (_username == 'etika' && _password == '123') {
              _navigateToHome();

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Login Berhasil'),
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Username atau Password Salah'),
              ));
            }

            setState(() {
              isClicked = !isClicked;
            });
          },
          child: const Text('Login'),
        ));
  }
}
