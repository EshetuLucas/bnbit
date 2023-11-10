import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/data_model/breed/breeds.dart';
import 'package:bnbit_app/data_model/dogs/dogs.dart';
import 'package:bnbit_app/api/common/api_client.dart';
import 'package:bnbit_app/app/app.logger.dart';

String byBreedUrl = baseUrl + '/breed';
String allBreedsListUrl = baseUrl + '/breeds/list/all';

class DogsGetApis {
  final log = getLogger('DogsGetApis');
  ApiClient get apiClient => ApiClient();

  Future<Breeds> getAllBreeds() async {
    return await apiClient.get<Breeds>(
      allBreedsListUrl,
      key: jsonKey,
      modelKey: 'allBreeds',
    );
  }

  /* 
     **
      Because all API calls return dogs based on the given query parameters,
      we can construct a single common URL to get dogs. 
      The pattern is baseUrl + '/breed/subBreed/images/random'.

      Let's see some scenarios:

    1. If the sub-breed is empty and the fetch type is all, we will have:
      commonUrl = baseUrl/breed//images//
      This is an invalid URL, so we need to replace the double slashes (//) with a single slash (/).

      commonUrl = baseUrl/breed//images//.replaceAll('//', '/');
      This gives us the URL baseUrl/breed/images/, which returns a list of images for the specified breed.

    2. If the sub-breed is empty and the fetch type is random, we will have:
      commonUrl = baseUrl//breed/images/random/50
      This is also an invalid URL, so we need to replace the double slashes (//) with a single slash (/).

      commonUrl = baseUrl/breed//images/random/20.replaceAll('//', '/');
      This gives us the URL baseUrl/breed/images/random/20, which returns a random image for the specified breed.

    3. If the sub-breed is not empty and the fetch type is random, we will have:
      commonUrl = baseUrl/breed/subBreed/images/random/50
      This is a valid URL, so we don't need to make any changes.

      commonUrl = baseUrl/breed/subBreed/images/random/20
      This URL returns a random image for the specified breed and sub-breed.

    4.  If the sub-breed is not empty and the fetch type is all, we will have:
      commonUrl = baseUrl/breed/subBreed/images//
      This is an invalid URL, so we need to replace the double slashes (//) with a single slash (/).

      commonUrl = baseUrl/breed/subBreed/images//.replaceAll('//', '/');
      This gives us the URL baseUrl/breed/subBreed/images/, which returns a list of images for the specified breed and sub-breed.

      The key and modelKey parameters are used to extract and customize JSON responses. For example, if the JSON data is like this:

      {
          "message": [
              "https://images.dog.ceo/breeds/labrador/n02099712_5657.jpg",
              "https://images.dog.ceo/breeds/greyhound-italian/n02091032_9131.jpg",
              "https://images.dog.ceo/breeds/saluki/n02091831_7957.jpg"
          ],
          "status": "success"
      }

      We can extract the image URLs using the following code:

      key = "message"
      rawData = {
          "message": [
              "https://images.dog.ceo/breeds/labrador/n02099712_5657.jpg",
              "https://images.dog.ceo/breeds/greyhound-italian/n02091032_9131.jpg",
              "https://images.dog.ceo/breeds/saluki/n02091831_7957.jpg"
          ],
          "status": "success"
      }

      parsedData = rawData[key]

      This will give us the following list of image URLs:

 
      [
         "https://images.dog.ceo/breeds/labrador/n02099712_5657.jpg",
         "https://images.dog.ceo/breeds/greyhound-italian/n02091032_9131.jpg",
          "https://images.dog.ceo/breeds/saluki/n02091831_7957.jpg"
        ]

      We can then pass this list to the Breeds.fromJson() method to create a Breeds object

  */

  Future<Dogs> getDogs(
    String breed, {
    bool isRandom = false,
    String subBreed = '',
  }) async {
    String randomPath = isRandom ? randomSuffix : '';
    String commonUrl = byBreedUrl +
        '/$breed/$subBreed/images/$randomPath'.replaceAll('//', '/');
    return await apiClient.get<Dogs>(
      commonUrl,
      key: jsonKey,
      modelKey: 'imageUrls',
    );
  }
}
