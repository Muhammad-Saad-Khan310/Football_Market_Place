import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:footballmarketplace/widgets/authentication.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../providers/profileProvider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthFrom(String name, String email, String password, bool isLogin,
      BuildContext ctx) async {
    UserCredential result;
    try {
      setState(() {
        _isLoading = true;
      });

      if (isLogin) {
        result = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        setState(() {
          _isLoading = true;
        });

        result = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        await Provider.of<ProfileProvider>(context, listen: false)
            .CreateProfile(result.user!.uid.toString(), name);

        // await FirebaseFirestore.instance
        //     .collection('users')
        //     .doc(result.user!.uid)
        //     .set({
        //   'userName': name,
        //   'email': email,
        // });
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      var message = error.toString().split("]");

      final snackBar = SnackBar(
        content: Text(message[1]),
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Auth(_submitAuthFrom, _isLoading),
    );
  }
}
