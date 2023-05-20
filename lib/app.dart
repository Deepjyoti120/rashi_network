import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:rashi_network/routes.dart';
import 'package:rashi_network/theme.dart';
import 'package:rashi_network/ui/theme/text.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  late SnackBar noInternetSnackBar;
  @override
  void initState() {
    super.initState();
    noInternetSnackBar = SnackBar(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            Icons.info,
            color: Colors.white,
          ),
          SizedBox(width: 6),
          DesignText(
            'No Internet Connection',
            fontSize: 12,
            fontWeight: 700,
            color: Colors.white,
          )
        ],
      ),
      duration: const Duration(seconds: 30),
      backgroundColor: Colors.black.withOpacity(0.85),
      behavior: SnackBarBehavior.floating,
    );
    Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        scaffoldMessengerKey.currentState!.showSnackBar(noInternetSnackBar);
      } else {
        scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: 'The Taramandal',
      routes: appRoutes,
      themeMode: ThemeMode.light, //darkMode.isDark ? ThemeMode.dark :
      theme: theme,
      darkTheme: darkTheme,
    );
  }
}
