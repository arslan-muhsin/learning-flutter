import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/route_paths.dart' as route_paths;
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: route_paths.welcomeScreen,
      routes: {
        route_paths.welcomeScreen: (context) => const WelcomeScreen(),
        route_paths.registerScreen: (context) => const RegistrationScreen(),
        route_paths.loginScreen: (context) => const LoginScreen(),
        route_paths.chatScreen: (context) => const ChatScreen(),
      },
      builder: EasyLoading.init(),
    );
  }
}
