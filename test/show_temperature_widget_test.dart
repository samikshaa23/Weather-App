import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:second_task/show_temperature.dart';

void main(){
  testWidgets('when show temperature loads', (tester) async {
   await tester.pumpWidget(const MaterialApp(home: ShowTemp(cityName: '', temperature: '', description: '',)));

    final cityWtext= find.byKey(const Key('city weather'));
    expect(cityWtext, findsOneWidget);

   final tempText= find.byKey(const Key('temperature'));
   expect(tempText, findsOneWidget);

   final desText= find.byKey(const Key('description'));
   expect(desText, findsOneWidget);

   final backButton= find.byKey(const Key('back'));
   expect(backButton, findsOneWidget);

  });
}