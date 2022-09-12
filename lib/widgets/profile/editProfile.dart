import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  final String id;
  final String userName;
  final String bio;
  final String transferMarketLink;
  final String videoDemo;
  final String cv;
  final String nationality;
  final String phoneNumber;
  final String position;
  final String dateOfBirth;

  EditProfile(
      {required this.id,
      required this.userName,
      required this.bio,
      required this.transferMarketLink,
      required this.videoDemo,
      required this.cv,
      required this.nationality,
      required this.phoneNumber,
      required this.dateOfBirth,
      required this.position});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final _form = GlobalKey<FormState>();

    String newId = id;
    String newUserName = "";
    String newBio = "";
    String newTransferMarketLink = "";
    String newVideoDemo = "";
    String newCv = "";
    String newNationality = "";
    String newPhoneNumber = "";
    String newPosition = "";
    String newDateOfBirth = "";

    Future<void> _updateProfile() async {
      // FocusScope.of(context).unfocus();
      _form.currentState!.save();
      print(newUserName);
      print(newBio);
      print(newPosition);
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(
          top: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text("Update your bio, cover and avatar")),
            const Divider(),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        child: Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      width: double.infinity,
                      child: const Image(
                        image: AssetImage("assets/images/messi.png"),
                        fit: BoxFit.cover,
                      ),
                    )),
                    const Positioned(
                        bottom: -50,
                        left: 30,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage("assets/images/messi.png"),
                        )),
                  ],
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: height * 0.09, left: 15, right: 15),
                  child: Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Full name"),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.06,
                          child: TextFormField(
                            initialValue: userName,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    top: 0, bottom: 0, left: 10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onSaved: (value) {
                              newUserName = value!;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Bio"),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: TextFormField(
                            maxLines: 4,
                            initialValue: bio,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  top: 10, bottom: 0, left: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onSaved: (newValue) {
                              newBio = newValue!;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Nationality"),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.06,
                          child: TextFormField(
                            initialValue: nationality,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  top: 0, bottom: 0, left: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onSaved: (newValue) {
                              newNationality = newValue!;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Phone number"),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.06,
                          child: TextFormField(
                            initialValue: phoneNumber,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  top: 0, bottom: 0, left: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onSaved: (newValue) {
                              newPhoneNumber = newValue!;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Transfer Link"),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.06,
                          child: TextFormField(
                            initialValue: transferMarketLink,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 10, top: 0, bottom: 0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onSaved: (newValue) {
                              newTransferMarketLink = newValue!;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Position"),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.06,
                          child: TextFormField(
                            initialValue: position,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  top: 0, bottom: 0, left: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onSaved: (newValue) {
                              newPosition = newValue!;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Add CV"),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(67, 172, 106, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text("Choose a file")),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Video Demo"),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.06,
                          child: TextFormField(
                            initialValue: videoDemo,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  top: 0, bottom: 0, left: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onSaved: (newValue) {
                              newVideoDemo = newValue!;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              primary: const Color.fromRGBO(67, 172, 106, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              _updateProfile();
                            },
                            child: const Text("SAVE")),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
