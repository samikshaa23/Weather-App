import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:second_task/show_data.dart';

void main(){
  testWidgets('when show data page opened', (tester) async {

    await tester.pumpWidget(const MaterialApp(home: ShowData()));

    final titletext= find.byKey(const Key('profile'));
    expect(titletext, findsOneWidget);

    final nametext= find.byKey(const Key('name'));
    expect(nametext, findsNWidgets(3));

    final phonenotext= find.byKey(const Key('phone no'));
    expect(phonenotext, findsNWidgets(3));

    final mailidtext= find.byKey(const Key('mail id'));
    expect(mailidtext, findsNWidgets(3));

    final citytext= find.byKey(const Key('city'));
    expect(citytext, findsNWidgets(3));

    final backbutton= find.byKey(const Key('back'));
    expect(backbutton, findsOneWidget);


  });
}