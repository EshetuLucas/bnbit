#  All api related codes goes here 

## We use freezed for our data model

### You can add a new data model like the code below 
1. Create a new folder (User)
2. Create a new file under a created folder (user.dart)

@freezed
class User with _$UserModel {
  User._();
  factory User({
    required String userId,
    String? firstName,
    String? lastName,
    String? phoneNumber,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
3. Then run the command below to genrate freezed.dart and g.dart files.
    flutter pub run build_runner build --delete-conflicting-outputs



