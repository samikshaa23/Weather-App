//import 'package:flutter/cupertino.dart';
//import 'package:flutter/semantics.dart';
//import 'package:flutter/rendering.dart';


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:second_task/show_data.dart';
import 'package:second_task/show_temperature.dart';

class LoginRobot{

  Future<void> findLoginTitle(WidgetTester tester) async {
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('log in')), findsOneWidget);
  }
  Future<void> findEmailAndFillIt(WidgetTester tester, String email)async {
    final email2=find.byType(TextFormField).first;
    await tester.ensureVisible(email2);
    await tester.enterText(email2, email);
    await tester.pumpAndSettle();
  }

  Future<void> findPasswordAndFillIt(WidgetTester tester,String password)async {
    final password2=find.byType(TextFormField).last;
    await tester.ensureVisible(password2);
    await tester.enterText(password2, password);
    await tester.pumpAndSettle();
  }

  Future<void> clickLoginButton(WidgetTester tester)async {
    final login=find.byKey(const Key('log in'));
    await tester.ensureVisible(login);
    await tester.tap(login);
    await tester.pumpAndSettle();
    //await tester.idle();

  }


  Future<void> findProfileTitle(WidgetTester tester) async {
    // await tester.pumpAndSettle();
    // expect(find.byKey(const Key('profileKey')), findsOneWidget);
    await tester.pumpWidget(const MaterialApp(home: ShowData()));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    final profile=find.byKey(const Key('profileKey'));
    expect(profile, findsOneWidget);
    await tester.ensureVisible(profile);
    await tester.pumpAndSettle();
  }
  Future<void> findNameText(WidgetTester tester)async {
    final nametext= find.byKey(const Key('name'));
    expect(nametext, findsNWidgets(3));
    await tester.pumpAndSettle();
  }
  Future<void> findphonenoText(WidgetTester tester)async {
    final phonenotext= find.byKey(const Key('phone no'));
    expect(phonenotext, findsNWidgets(3));
    await tester.pumpAndSettle();
  }

  Future<void> findEmailIDText(WidgetTester tester)async {
    final emailidtext= find.byKey(const Key('mail id'));
    expect(emailidtext, findsNWidgets(3));
    await tester.pumpAndSettle();
  }

  Future<void> clickCityText(WidgetTester tester)async {
    final citytext=find.byKey(const Key('city')).first;
    await tester.ensureVisible(citytext);
    await tester.tap(citytext);
    await tester.pumpAndSettle();
    //await tester.idle();
  }

  Future<void> findCityTitle(WidgetTester tester) async {
    // await tester.pumpAndSettle();
    // expect(find.byKey(const Key('profileKey')), findsOneWidget);
    await tester.pumpWidget(const MaterialApp(home: ShowTemp(cityName: '', temperature: '', description: '',)));
    await tester.pumpAndSettle();

    final cityweather=find.byKey(const Key('city weather'));
    expect(cityweather, findsOneWidget);
    await tester.ensureVisible(cityweather);
    await tester.pumpAndSettle();
  }

  Future<void> findTempText(WidgetTester tester)async {
    final temptext= find.byKey(const Key('temperature'));
    expect(temptext, findsOneWidget);
    await tester.pumpAndSettle();
  }

  Future<void> findDescriptionText(WidgetTester tester)async {
    final destext= find.byKey(const Key('description'));
    expect(destext, findsOneWidget);
    await tester.pumpAndSettle();
  }






  Future<void> login(WidgetTester tester,String email,String password) async{
  await findLoginTitle(tester);
  sleep(const Duration(seconds: 1));
  await findEmailAndFillIt(tester,email);
  sleep(const Duration(seconds: 1));
  await findPasswordAndFillIt(tester, password);
  sleep(const Duration(seconds: 1));
  await clickLoginButton(tester);
 // await findProfileTitle(tester);
  sleep(const Duration(seconds: 2));
  await findProfileTitle(tester);
  sleep(const Duration(seconds: 2));
  await findNameText(tester);
  sleep(const Duration(seconds: 1));
  await findphonenoText(tester);
  sleep(const Duration(seconds: 1));
  await findEmailIDText(tester);
  sleep(const Duration(seconds: 1));
  await clickCityText(tester);
  sleep(const Duration(seconds: 1));
  await findCityTitle(tester);
  sleep(const Duration(seconds: 1));
  await findTempText(tester);
  sleep(const Duration(seconds: 1));
  await findDescriptionText(tester);


  }

}