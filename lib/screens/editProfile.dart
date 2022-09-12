import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import "../providers/profileProvider.dart";
import '../widgets/profile/editProfile.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
                  color: const Color.fromRGBO(231, 255, 226, 1),
                  borderRadius: BorderRadius.circular(10)),
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: const Image(image: AssetImage("assets/images/user.png")),
            ),
            const Image(image: AssetImage("assets/images/chat.png")),
            const Image(image: AssetImage("assets/images/dollar.png")),
            const Image(image: AssetImage("assets/images/dots.png"))
          ],
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : EditProfile(
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
