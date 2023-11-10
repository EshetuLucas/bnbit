#  All custom extensions goes here 

### You can add a custom extensions like the code below 

extension StringExtensions on String? {
   ///... You code goes here 
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }
   ....///
}


