class LoginResponMain {
  String message;
  String success;
  UserDetail data;

  LoginResponMain({this.message, this.success, this.data});

  LoginResponMain.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    data = json['data'] != null ? new UserDetail.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class UserDetail {
  String userId;
  String userStep;
  String isCoach;
  String username;
  String userFullname;
  String userBirthday;
  String userPic;
  String userEmail;
  String userCountryCode;
  String userCountryName;
  String userNumber;
  String userTimezone;
  String userToken;
  String userWorkNumber;
  String userWebsiteUrl;
  String userInstagramAccount;
  String userTwitterAccount;
  String userLinkedinAccount;
  String userRole;
  String userBio;
  String userEducationUniversity;
  String userEducationProgram;
  String userEducationTitle;
  String userLanguage;
  String userCoverPhoto;

  UserDetail({
    this.userStep,
    this.isCoach,
    this.userId,
    this.username,
    this.userFullname,
    this.userBirthday,
    this.userPic,
    this.userEmail,
    this.userCountryCode,
    this.userCountryName,
    this.userNumber,
    this.userTimezone,
    this.userToken,
    this.userWorkNumber,
    this.userWebsiteUrl,
    this.userInstagramAccount,
    this.userTwitterAccount,
    this.userLinkedinAccount,
    this.userRole,
    this.userBio,
    this.userEducationUniversity,
    this.userEducationProgram,
    this.userEducationTitle,
    this.userLanguage,
    this.userCoverPhoto,
  });

  UserDetail.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userStep = json['user_step'];
    isCoach = json['is_coach'];
    username = json['username'];
    userFullname = json['user_fullname'];
    userBirthday = json['user_birthday'];
    userPic = json['user_pic'];
    userEmail = json['user_email'];
    userCountryCode = json['user_country_code'];
    userCountryName = json['user_country_name'];
    userNumber = json['user_number'];
    userTimezone = json['user_timezone'];
    userToken = json['user_token'];
    userWorkNumber = json['user_work_number'];
    userWebsiteUrl = json['user_website_url'];
    userInstagramAccount = json['user_instagram_account'];
    userTwitterAccount = json['user_twitter_account'];
    userLinkedinAccount = json['user_linkedin_account'];
    userRole = json['user_role'];
    userBio = json['user_bio'];
    userEducationUniversity = json['user_education_university'];
    userEducationProgram = json['user_education_program'];
    userEducationTitle = json['user_education_title'];
    userLanguage = json['user_language'];
    userCoverPhoto = json['user_cover_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_step'] = this.userStep;
    data['username'] = this.username;
    data['user_fullname'] = this.userFullname;
    data['user_birthday'] = this.userBirthday;
    data['user_pic'] = this.userPic;
    data['user_email'] = this.userEmail;
    data['user_country_code'] = this.userCountryCode;
    data['user_country_name'] = this.userCountryName;
    data['user_number'] = this.userNumber;
    data['user_timezone'] = this.userTimezone;
    data['user_token'] = this.userToken;
    data['user_work_number'] = this.userWorkNumber;
    data['user_website_url'] = this.userWebsiteUrl;
    data['user_instagram_account'] = this.userInstagramAccount;
    data['user_twitter_account'] = this.userTwitterAccount;
    data['user_linkedin_account'] = this.userLinkedinAccount;
    data['user_role'] = this.userRole;
    data['user_bio'] = this.userBio;
    data['user_education_university'] = this.userEducationUniversity;
    data['user_education_program'] = this.userEducationProgram;
    data['user_education_title'] = this.userEducationTitle;
    data['user_language'] = this.userLanguage;
    data['user_cover_photo'] = this.userCoverPhoto;

    return data;
  }
}

class ProfessionRes {
  int professionId;
  String name;

  ProfessionRes({this.professionId, this.name});

  ProfessionRes.fromJson(Map<String, dynamic> json) {
    professionId = json['profession_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profession_id'] = this.professionId;
    data['name'] = this.name;
    return data;
  }
}

class UserAccountType {
  String keyId;
  UserAccountType({this.keyId});
  UserAccountType.fromJson(Map<String, dynamic> json) {
    keyId = json['key_id'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key_id'] = this.keyId;
    return data;
  }
}

class Permissions {
  int id;
  int userid;
  int keyId;
  bool list;
  bool view;
  bool add;
  bool edit;
  bool delete;
  bool other;
  Null ctime;
  Null utime;
  String moduleTitle;
  bool isAccessible;

  Permissions(
      {this.id,
      this.userid,
      this.keyId,
      this.list,
      this.view,
      this.add,
      this.edit,
      this.delete,
      this.other,
      this.ctime,
      this.utime,
      this.moduleTitle,
      this.isAccessible});

  Permissions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    keyId = json['key_id'];
    list = json['list'];
    view = json['view'];
    add = json['add'];
    edit = json['edit'];
    delete = json['delete'];
    other = json['other'];
    ctime = json['ctime'];
    utime = json['utime'];
    moduleTitle = json['module_title'];
    isAccessible = json['is_accessible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userid'] = this.userid;
    data['key_id'] = this.keyId;
    data['list'] = this.list;
    data['view'] = this.view;
    data['add'] = this.add;
    data['edit'] = this.edit;
    data['delete'] = this.delete;
    data['other'] = this.other;
    data['ctime'] = this.ctime;
    data['utime'] = this.utime;
    data['module_title'] = this.moduleTitle;
    data['is_accessible'] = this.isAccessible;
    return data;
  }
}
