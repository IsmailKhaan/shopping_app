import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int code;
  String msg;
  Data data;

  LoginModel({
    required this.code,
    required this.msg,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json['code'],
        msg: json['msg'],
        data: Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'msg': msg,
        'data': data.toJson(),
      };

  @override
  String toString() {
    return 'LoginModel{code: $code, msg: $msg, data: $data}';
  }
}

class Data {
  MemberInfo memberInfo;
  List<AllGamePlatform> allGamePlatform;

  Data({
    required this.memberInfo,
    required this.allGamePlatform,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        memberInfo: MemberInfo.fromJson(json['memberInfo']),
        allGamePlatform: List<AllGamePlatform>.from(
            json['allGamePlatform'].map((x) => AllGamePlatform.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'memberInfo': memberInfo.toJson(),
        'allGamePlatform':
            List<dynamic>.from(allGamePlatform.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'Data{memberInfo: $memberInfo, allGamePlatform: $allGamePlatform}';
  }
}

class AllGamePlatform {
  String platformName;
  String uniqueCode;
  String platformStatus;
  String platformType;
  String hallGame;

  AllGamePlatform({
    required this.platformName,
    required this.uniqueCode,
    required this.platformStatus,
    required this.platformType,
    required this.hallGame,
  });

  factory AllGamePlatform.fromJson(Map<String, dynamic> json) =>
      AllGamePlatform(
        platformName: json['platformName'],
        uniqueCode: json['uniqueCode'],
        platformStatus: json['platformStatus'],
        platformType: json['platformType'],
        hallGame: json['hallGame'],
      );

  Map<String, dynamic> toJson() => {
        'platformName': platformName,
        'uniqueCode': uniqueCode,
        'platformStatus': platformStatus,
        'platformType': platformType,
        'hallGame': hallGame,
      };

  @override
  String toString() {
    return 'AllGamePlatform{platformName: $platformName, uniqueCode: $uniqueCode, platformStatus: $platformStatus, platformType: $platformType, hallGame: $hallGame}';
  }
}

class MemberInfo {
  String username;
  int userLevel;
  String userIcon;
  String authToken;
  int freeTransfer;
  int registerTime;

  MemberInfo({
    required this.username,
    required this.userLevel,
    required this.userIcon,
    required this.authToken,
    required this.freeTransfer,
    required this.registerTime,
  });

  factory MemberInfo.fromJson(Map<String, dynamic> json) => MemberInfo(
        username: json['username'],
        userLevel: json['userLevel'],
        userIcon: json['userIcon'],
        authToken: json['authToken'],
        freeTransfer: json['freeTransfer'],
        registerTime: json['registerTime'],
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'userLevel': userLevel,
        'userIcon': userIcon,
        'authToken': authToken,
        'freeTransfer': freeTransfer,
        'registerTime': registerTime,
      };

  @override
  String toString() {
    return 'MemberInfo{username: $username, userLevel: $userLevel, userIcon: $userIcon, authToken: $authToken, freeTransfer: $freeTransfer, registerTime: $registerTime}';
  }
}
