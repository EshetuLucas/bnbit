import 'package:bnbit_app/data_model/dogs/dogs.dart';

import 'fake_model.dart';

class FakeDog extends FakeModel<Dogs> {
  @override
  Dogs generate() {
    return Dogs(
      imageUrls: [faker.animal.name()],
    );
  }
}
