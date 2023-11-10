import 'package:bnbit_app/api/common/api_client.dart';
import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/user/user_model.dart';

String updateUserUrl = baseUrl + '/accounts/update-user';

//check it now http://ec2-54-161-157-16.compute-1.amazonaws.com/accounts/update-user/<id>

mixin PostApis {
  final log = getLogger('UserPostApis');
  ApiClient get apiClient => ApiClient();

  Future<UserModel> updateUser(UserModel user) async {
    return await apiClient.put<UserModel>(
      updateUserUrl + "/${user.id}",
      user.toJson(),
    );
  }
}
