import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flash_chat/route_paths.dart' as route_paths;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/action_button.dart';
import 'package:flash_chat/components/text_input_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _firebaseAuth = FirebaseAuth.instance;

  late String? emailAddressInputValue;
  late String? passwordInputValue;

  Future<void> signIn() async {
    try {
      if (emailAddressInputValue!.isNotEmpty &&
          passwordInputValue!.isNotEmpty) {
        final loggedUserCredential =
            await _firebaseAuth.signInWithEmailAndPassword(
          email: emailAddressInputValue as String,
          password: passwordInputValue as String,
        );

        if (loggedUserCredential.user != null) {
          Navigator.pushNamed(context, route_paths.chatScreen);
        } else {
          print("Wrong email address or password.");
        }
      } else {
        print("Enter your email address and password.");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextInputField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              placeholder: 'Enter your email',
              placeholderColor: Colors.grey,
              textColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  emailAddressInputValue = value;
                });
              },
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextInputField(
              autocorrect: false,
              enableSuggestion: false,
              obscureText: true,
              placeholder: 'Enter your password',
              placeholderColor: Colors.grey,
              textColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  passwordInputValue = value;
                });
              },
            ),
            const SizedBox(
              height: 24.0,
            ),
            ActionButton(
              buttonText: 'Login',
              buttonColor: Colors.lightBlueAccent,
              onPressed: () async {
                EasyLoading.show(
                  status: 'Logging in...',
                  maskType: EasyLoadingMaskType.black,
                );

                signIn()
                    .whenComplete(() => EasyLoading.dismiss(animation: true));
              },
            ),
          ],
        ),
      ),
    );
  }
}
