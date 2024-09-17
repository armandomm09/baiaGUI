import 'package:baia_ui/pages/home_page.dart';
import 'package:baia_ui/services/auth/login_or_register.dart';
import 'package:baia_ui/widgets/materialApp/my_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

 

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot) {

          if(snapshot.hasData){
            return const MyNavBar();//TeamDetails( teamNickname: "Imperator", team: "5887", eventKey: "2024mxpu");
          } else {
            return const LoginOrRegisterPage();
          }      
        }),
    );
  }
}