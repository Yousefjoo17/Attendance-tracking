class UserModel {
  String? name;
  String? password;
  List<dynamic>? checkList;
  String? docID;
  bool? shouldCheckIn;
  UserModel({
    this.name,
    this.password,
    this.checkList,
    this.docID,
    this.shouldCheckIn,
  });
}
