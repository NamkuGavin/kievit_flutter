class UserModel {
  String username;
  String email;
  String accesToken;
  List<dynamic> menuContent;

  UserModel(this.username, this.email, this.accesToken, this.menuContent);

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(data['data_user']['username'], data['data_user']['email'],
        data['access_token'], data['data'][1]['menu-content']);
  }
}
