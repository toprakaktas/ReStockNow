import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:restocknow/screens/home.dart';
import 'package:restocknow/utils/colors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.instance.subscribeToTopic('stock-notifications');
  await dotenv.load(fileName:".env");
  runApp(const MainApp());
}

final apiKey = dotenv.env['FIREBASE_API_KEY'];

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async { 
  // TODO: Handle background message
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (BuildContext context, ThemeMode currentMode, Widget? child) {
          return MaterialApp(
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
            title: 'ReStockNow',
            theme: ThemeData(useMaterial3: true,
                //colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple)
                primaryColor: lightButton, brightness: Brightness.light),
            darkTheme: ThemeData(
                primaryColor: darkButton, brightness: Brightness.dark),
            themeMode: currentMode,
          );
        });
  }
}