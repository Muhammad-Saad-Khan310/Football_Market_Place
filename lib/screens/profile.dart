import 'package:flutter/material.dart';
import 'package:footballmarketplace/providers/profileProvider.dart';
import 'package:provider/provider.dart';
import '../widgets/profile/profile.dart';
import "package:firebase_auth/firebase_auth.dart";

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      var id = FirebaseAuth.instance.currentUser!.uid.toString();

      await Provider.of<ProfileProvider>(context, listen: false)
          .fetchUserProfile(id)
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }

    _isInit = false;

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var userData =
        Provider.of<ProfileProvider>(context, listen: false).getprofileItem;

    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(color: Color.fromRGBO(233, 236, 239, 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(231, 255, 226, 1),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Image(image: AssetImage("assets/images/user.png")),
            ),
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(Icons.logout)),
            Image(image: AssetImage("assets/images/chat.png")),
            Image(image: AssetImage("assets/images/dollar.png")),
            Image(image: AssetImage("assets/images/dots.png"))
          ],
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Profile(
              id: userData[0].id,
              userName: userData[0].userName,
              bio: userData[0].bio,
              transferMarketLink: userData[0].transferMarketLink,
              videoDemo: userData[0].videoDemo,
              cv: userData[0].cv,
              nationality: userData[0].nationality,
              phoneNumber: userData[0].phoneNumber,
              dateOfBirth: userData[0].dateOfBirth,
              position: userData[0].position),
    );
  }
}
