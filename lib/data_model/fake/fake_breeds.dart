import 'package:bnbit_app/data_model/breed/breeds.dart';

import 'fake_model.dart';

class FakeBreeds extends FakeModel<Breeds> {
  @override
  Breeds generate() {
    return Breeds(
      allBreeds: {
        'breed1': [],
        'breed2': ['subBreed1'],
        'breed3': [
          'subBreed1',
          'subBreed2',
          'subBreed3',
        ],
        'breed4': [
          'subBreed1',
          'subBreed2',
          'subBreed3',
          'subBreed3',
        ],
      },
    );
  }
}
