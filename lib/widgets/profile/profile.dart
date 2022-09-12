import "package:flutter/material.dart";

class Profile extends StatelessWidget {
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

  Profile(
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    child: Container(
                  width: double.infinity,
                  child: Image(
                    image: AssetImage("assets/images/messi.png"),
                    fit: BoxFit.cover,
                  ),
                )),
                Positioned(
                  left: 10,
                  bottom: -50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/messi.png"),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Flexible(
              child: Text(
                bio,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "TransferMarkt: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                    onPressed: () {}, child: Text(transferMarketLink))),
            Row(
              children: [
                Text(
                  "Video Demo: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(onPressed: () {}, child: Text(videoDemo)),
            ),
            Row(
              children: [
                Text(
                  "CV/Resume:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(onPressed: () {}, child: Text(cv)),
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color.fromRGBO(153, 217, 140, 1)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Full name:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(userName)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Nationality:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(nationality),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Phone number:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(phoneNumber)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Position:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(position)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Date of Birth: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(dateOfBirth)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
