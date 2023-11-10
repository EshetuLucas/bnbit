#  All duplicated business logic codes goes here

# Mixins allows us to inject ducplicated codes into a class.

### You can add a new mixin like the code below 

mixin DogsServiceMixin {
  ///... You code goes here 
  final _dogsService = locator<DogsServiceMixin>();
   ....///
  }


