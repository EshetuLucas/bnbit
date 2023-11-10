import 'package:faker/faker.dart';
import 'package:uuid/uuid.dart';

abstract class FakeModel<T> {
  Faker get faker => Faker();

  /// Creates a fake id.
  String createId() {
    return const Uuid().v4();
  }

  /// Generate fake list based on provided length.
  List<T> generateList({required int length}) {
    return List.generate(length, (index) => generate());
  }

  /// Generate a single fake model.
  T generate();
}
