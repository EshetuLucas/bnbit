import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = dotenv.env['bnbit_BASE_URL']!;
String randomSuffix = '/random/50';
String jsonKey = 'message';
