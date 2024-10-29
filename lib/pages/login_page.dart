import 'dart:math';
import 'package:e_commerce/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:status_alert/status_alert.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageSate();
  }
}

class _LoginPageSate extends State<LoginPage> {
  GlobalKey<FormState> _loginFormKey = GlobalKey();

  String? username, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 255, 255, 255), // couleur de fond de login page
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "\n Connexion",
        ),
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(),
          _loginForm(),
        ],
      ),
    );
  }

  Widget _title() {
    return Text(
      "Shopy SHow \n   😊😊😊",
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _loginForm() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.90,
      height: MediaQuery.sizeOf(context).height * 0.30,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: 'emilys',
              onSaved: (value) {
                setState(() {
                  username = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter your Username";
                }
              },
              decoration: const InputDecoration(
                hintText: "Username",
              ),
            ),
            TextFormField(
              initialValue: 'emilyspass',
              obscureText: true, //cacher le texte du mot de passe
              onSaved: (value) {
                setState(() {
                  password = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 5) {
                  return "Enter a valid Password ";
                }
              },
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.60,
      child: ElevatedButton(
        onPressed: () async {
          if (_loginFormKey.currentState?.validate() ?? false) {
            _loginFormKey.currentState?.save();

            bool result = await AuthService().login(
              username!,
              password!,
            );
            if (result) {
              Navigator.pushReplacementNamed(context, "/home");
            } else {
              StatusAlert.show(
                context,
                duration: const Duration(seconds: 2),
                title: 'Login Failed',
                subtitle: 'Please try Again',
                configuration: const IconConfiguration(
                  icon: Icons.error,
                ),
                maxWidth: 260,
              );
              Navigator.pushReplacementNamed(context, "/home"); //je force l'entree malgree que le login a un souci avec mon api
            }
          }
        },
        child: const Text(
          "Login",
        ),
      ),
    );
  }
}
