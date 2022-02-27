import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US' : {
      'hello': 'Hello World',
      'logged_in': 'logged in as @name \n email @email'
    },
    'id': {
      'hello' : 'Hai Dunia',
      'logged_in': 'masuk sebagai @name \n email @email'
    }
  };
}