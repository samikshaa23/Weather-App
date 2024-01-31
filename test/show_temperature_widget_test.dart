import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:second_task/show_temperature.dart';

void main(){
  testWidgets('when show temperature loads', (tester) async {
   await tester.pumpWidget(const MaterialApp(home: ShowTemp(cityName: '', temperature: '', description: '',)));

    final city_wtext= find.byKey(const Key('city weather'));
    expect(city_wtext, findsOneWidget);

   final temptext= find.byKey(const Key('temperature'));
   expect(temptext, findsOneWidget);

   final destext= find.byKey(const Key('description'));
   expect(destext, findsOneWidget);

   final backbutton= find.byKey(const Key('back'));
   expect(backbutton, findsOneWidget);

  });
}