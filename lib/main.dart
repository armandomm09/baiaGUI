import 'package:baia_ui/firebase_options.dart';
import 'package:baia_ui/pages/home_page.dart';
import 'package:baia_ui/pages/sells_page.dart';
import 'package:baia_ui/services/auth/auth_gate.dart';
import 'package:baia_ui/widgets/materialApp/my_nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
/*  */
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: AuthGate()
    );
  }
}
