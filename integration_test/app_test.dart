import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'login_test.dart';



Future<void> main() async{

  final binding=IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy=LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  LoginScenarios loginScenarios=LoginScenarios();
  await loginScenarios.runAllTestcases();
}