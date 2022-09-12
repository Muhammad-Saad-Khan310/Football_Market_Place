import 'package:flutter/cupertino.dart';
import 'package:footballmarketplace/providers/models/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class ProfileProvider with ChangeNotifier {
  List<ProfileModel> _profileItems = [];

  List<ProfileModel> get getprofileItem {
    return [..._profileItems];
  }

  Future<void> fetchUserProfile(String userId) async {
    final url = Uri.parse(
        "https://football-marketplace-eea35-default-rtdb.firebaseio.com/userProfile/$userId.json");
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);

      List<ProfileModel> _loadedItems = [];

      extractedData.forEach((profileId, profileData) {
        _loadedItems.insert(
            0,
            ProfileModel(
                id: profileId,
                userName: profileData["name"],
                bio: profileData["bio"],
                transferMarketLink: profileData["transferMarketLink"],
                videoDemo: profileData["videoDemo"],
                cv: profileData["cv"],
                nationality: profileData["nationality"],
                phoneNumber: profileData["phoneNumber"],
                position: profileData["position"],
                dateOfBirth: profileData["dateOfBirth"]));

        _profileItems = _loadedItems;
        notifyListeners();
      });
    } catch (error) {
      throw error;
    }
  }

  Future<void> CreateProfile(String userId, String name) async {
    final url = Uri.parse(
        "https://football-marketplace-eea35-default-rtdb.firebaseio.com/userProfile/$userId.json");
    try {
      final response = await http.post(url,
          body: json.encode({
            "name": name,
            "bio": "Your bio data",
            "nationality": "Your country name",
            "phoneNumber": "0000000000",
            "transferMarketLink": "Your tansfermarkt Link",
            "dateOfBirth": "10-12-2000",
            "position": "Right Winger",
            "cv": "Your cv link",
            "videoDemo": "Your video demo link"
          }));
    } catch (error) {
      rethrow;
    }
  }
}
