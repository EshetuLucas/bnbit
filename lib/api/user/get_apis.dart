import 'package:bnbit_app/api/common/api_client.dart';
import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/data_model/user/user_model.dart';

String getUserUrl = baseUrl + '/accounts/get-me';

mixin GetApis {
  final log = getLogger('UserGetApis');
  ApiClient get apiClient => ApiClient();

  Future<UserModel> getUserById(String userId) async {
    return await apiClient.get<UserModel>(
      getUserUrl,
    );
  }
}
