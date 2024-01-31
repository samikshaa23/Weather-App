import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:second_task/main.dart';

void main(){

  testWidgets('my app loaded ', (tester) async{
      await tester.pumpWidget( MaterialApp(home: Scaffold(body: LoginScreen())),);

      final textfields= find.byKey(const Key('username'));
      expect(textfields, findsOneWidget);

      final textfields_2= find.byKey(const Key('password'));
      expect(textfields_2, findsOneWidget);

      final button= find.byKey(const Key('log in'));
      expect(button, findsOneWidget);

  });
}