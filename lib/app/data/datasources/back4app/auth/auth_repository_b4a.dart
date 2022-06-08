import 'package:bens/app/data/datasources/back4app/auth/auth_repository_exception.dart';
import 'package:bens/app/data/datasources/back4app/entity/user_entity.dart';
import 'package:bens/app/data/datasources/back4app/entity/user_profile_entity.dart';
import 'package:bens/app/data/datasources/repositories/auth_repository.dart';
import 'package:bens/app/domain/models/user_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:bens/app/domain/models/user_profile_model.dart';

class AuthRepositoryB4a implements AuthRepository {
  @override
  Future<UserModel?> registerEmail(
      {required String email, required String password}) async {
    try {
      final user = ParseUser.createUser(email, password, email);
      // ParseACL parseACL = ParseACL();
      // parseACL.setPublicReadAccess(allowed: false);
      // user.setACL(parseACL);
      var response = await user.signUp();
      if (response.success) {
        print('register success');
        UserModel userModel = UserEntity().fromParse(response.results!.first);
        return userModel;
      } else {
        print('register error');
        throw AuthRepositoryException(
            code: '${response.error!.code}', message: response.error!.message);
      }
    } on AuthRepositoryException catch (e) {
      print(e);
      throw AuthRepositoryException(
          code: '000', message: 'Erro no createUser ou SigUp. ${e.message}');
    }
  }

  @override
  Future<UserModel?> loginEmail(
      {required String email, required String password}) async {
    UserModel userModel;
    try {
      final user = ParseUser(email, password, null);

      var response = await user.login();
      if (response.success) {
        ParseUser user = response.results!.first;
        // QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(user);
        // query.includeObject(['profile']);

        // query.query();
        // final ParseResponse response2 = await query.query();
        // if (response2.success && response2.results != null) {
        //   print('query do user');
        //   userModel = UserEntity().fromParse(response.results!.first);
        //   return userModel;
        // } else {
        //   print('Sem query do user...');
        // }
        userModel = UserModel(
          id: user.objectId!,
          email: user.emailAddress!,
          profile: await getProfile(),
          // profile: userProfileEntity,
        );
        print(userModel);
        return userModel;
        // return null;
      } else {
        throw AuthRepositoryException(
            message: response.error!.message, code: '${response.error!.code}');
      }
    } on AuthRepositoryException catch (e) {
      if (e.message == '205') {
        throw AuthRepositoryException(
            code: '205',
            message: 'Cadastro ainda não confirmado no email do usuário.');
      } else {
        rethrow;
      }
    }
    // return null;
  }

  @override
  Future<void> forgotPassword(String email) async {
    final ParseUser user = ParseUser(null, null, email);
    final ParseResponse parseResponse = await user.requestPasswordReset();
    if (!parseResponse.success) {
      throw AuthRepositoryException(
          code: '000', message: 'Erro em recuperar senha');
    }
  }

  @override
  Future<bool> logout() async {
    final user = await ParseUser.currentUser() as ParseUser;
    var response = await user.logout();
    if (response.success) {
      return true;
    } else {
      return false;
    }
  }

  Future<UserProfileModel?> getProfile() async {
    var parseUser = await ParseUser.currentUser() as ParseUser;

    var profileField = parseUser.get('profile');
    print('===> profile');
    print(profileField);
    var profileObj = ParseObject(UserProfileEntity.className);
    var profileData = await profileObj.getObject(profileField.objectId);
    UserProfileModel? userProfileEntity;
    if (profileData.success) {
      userProfileEntity =
          UserProfileEntity().fromParse(profileData.result as ParseObject);
    } else {
      print('nao foi');
    }
    return userProfileEntity;
  }
}
