import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footballmarketplace/providers/profileProvider.dart';
import 'package:footballmarketplace/screens/auth.dart';
import 'package:footballmarketplace/screens/editProfile.dart';
import 'package:footballmarketplace/screens/profile.dart';
import 'package:footballmarketplace/verify.dart';
import 'package:footballmarketplace/widgets/authentication.dart';
import 'package:footballmarketplace/widgets/home.dart';
import 'package:footballmarketplace/widgets/profile/editProfile.dart';
import 'package:footballmarketplace/widgets/profile/profile.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProfileProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FootBallMarketPlace',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: StreamBuilder(
        //     stream: FirebaseAuth.instance.authStateChanges(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         return const VerfiyPage();
        //       }
        //       return const AuthScreen();
        //     })
        home: EditProfileScreen(),
      ),
    );
  }
}
