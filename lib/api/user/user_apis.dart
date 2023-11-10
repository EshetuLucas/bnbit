import 'package:bnbit_app/api/user/get_apis.dart';
import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/api/user/post_apis.dart';

String allBreedsListUrl = baseUrl + '/breeds/list/all';

class UserApis with GetApis, PostApis {}
