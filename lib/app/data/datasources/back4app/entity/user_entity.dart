import 'package:bens/app/data/datasources/back4app/entity/user_profile_entity.dart';
import 'package:bens/app/domain/models/user_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserEntity {
  UserModel fromParse(ParseUser parseUser) {
    return UserModel(
      id: parseUser.objectId!,
      email: parseUser.username!,
      profile: parseUser.get('profile') != null
          ? UserProfileEntity().fromParse(parseUser.get('profile'))
          : null,
    );
  }
}
