import 'package:flutter/material.dart';
import 'package:rashi_network/services/firebase/auth_servoces.dart';
import 'package:rashi_network/ui/widgets/progress_circle.dart';
import 'package:rashi_network/views/home_controller.dart';
import 'package:rashi_network/views/login/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // return LoginScreen();
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          return const HomeController();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}

class Waiting extends StatelessWidget {
  const Waiting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              // AuthService().signOut();
            },
            child: const DesignProgress(size: 60)),
      ),
    );
  }
}
