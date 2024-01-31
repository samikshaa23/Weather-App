
import 'package:flutter_test/flutter_test.dart';
import 'package:second_task/main.dart' as app;
import 'senario/robot.dart';



class LoginScenarios{
  LoginRobot robot= LoginRobot();

  Future<void> runAllTestcases()async {
    group('run all testcaes', () {
      testWithTextFields();
    });
  }

  Future<void> testWithTextFields() async {
    testWidgets('run login page testcaes', (WidgetTester tester) async{
      app.main();
     /* await tester.runAsync(() async {
        await robot.login(tester, 'sam23@gmail.com', 'sam12345');
        // Additional test logic or assertions
      });*/

      await robot.login(tester, 'sam23@gmail.com','sam12345');
    //  sleep(const Duration(seconds: 2));

    });
  }
}