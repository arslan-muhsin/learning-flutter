import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/action_button.dart';
import 'package:flash_chat/components/text_input_field.dart';
import 'package:flash_chat/route_paths.dart' as route_paths;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _firebaseAuth = FirebaseAuth.instance;

  String? emailAddressInputValue;
  String? passwordInputValue;

  Future<void> register() async {
    if (emailAddressInputValue!.isNotEmpty && passwordInputValue!.isNotEmpty) {
      try {
        final newUserCredential =
            await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailAddressInputValue as String,
          password: passwordInputValue as String,
        );

        if (newUserCredential.user != null) {
          Navigator.pushNamed(context, route_paths.chatScreen);
        }
      } catch (e) {
        print(e);
      }
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
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
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
              buttonText: 'Register',
              buttonColor: Colors.blueAccent,
              onPressed: () async {
                EasyLoading.show(
                  status: 'Registering...',
                  maskType: EasyLoadingMaskType.black,
                );

                register()
                    .whenComplete(() => EasyLoading.dismiss(animation: true));
              },
            ),
          ],
        ),
      ),
    );
  }
}
