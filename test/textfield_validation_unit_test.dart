import 'package:flutter_test/flutter_test.dart';
import 'package:second_task/main.dart';

void main(){
  group('test username and password-', ()
  {
    test('email is empty', () {
      String? res = LoginScreen.validateUsername('');
      expect(res, 'please enter username');
    });

    test('password is empty', () {
      String? pass = LoginScreen.validatePassword('');
      expect(pass, 'please enter password');
    });
  });
}