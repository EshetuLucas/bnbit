#  All services codes goes here 

Services allow us to communicate with APIs, core functions, and native functions. All services are registered as lazy singletons, meaning that the values inside the service will persist throughout the app session unless changed.


You can add a new service class like the code below 

class DogService {
  ///... You code goes here 
 final _getApi = locator<DogsGetApis>();

  Future<Breeds> getAllBreeds() async {
    return await _getApi.getAllBreeds();
  }

   ....///
  }

## Then run the command below to genrate freezed.dart and g.dart files.
    flutter pub run build_runner build --delete-conflicting-outputs


