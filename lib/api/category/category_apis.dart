import 'package:bnbit_app/api/category/get_apis.dart';
import 'package:bnbit_app/api/category/post_apis.dart';
import 'package:bnbit_app/api/common/api_consts.dart';

String allBreedsListUrl = baseUrl + '/breeds/list/all';

class CategoryApis with GetApis, PostApis {}
