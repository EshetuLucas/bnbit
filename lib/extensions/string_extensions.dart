extension StringUtils on String? {
  String get toCityDocument {
    return this!.split(' ').join('_').toLowerCase();
  }

  String get capitalizeFirstLetter {
    return this!.isEmpty
        ? ''
        : this![0].toUpperCase() + this!.replaceRange(0, 1, '');
  }

  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }
}
