import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(" This is our home page"),
            ),
            TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
