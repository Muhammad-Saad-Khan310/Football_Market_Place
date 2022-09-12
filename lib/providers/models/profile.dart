class ProfileModel {
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

  ProfileModel(
      {required this.id,
      required this.userName,
      required this.bio,
      required this.transferMarketLink,
      required this.videoDemo,
      required this.cv,
      required this.nationality,
      required this.phoneNumber,
      required this.position,
      required this.dateOfBirth});
}
