import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testapp/widget_test/animation_app/animation_screen.dart';

void main(){
  testWidgets('Animation Screen test', (tester)async{
    await tester.pumpWidget(
       MaterialApp(
         home: AnimationScreen(),
       )

      );
    var containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);
    var container = tester.widget<Container>(containerFinder);

    //INITIAL
    expect(container.constraints!.minWidth, 50);
    expect(container.constraints!.minHeight, 50);
    expect((container.decoration as BoxDecoration).color , Colors.blue);
    expect((container.decoration as BoxDecoration).borderRadius, BorderRadius.zero
     );




    // after event
    await tester.pumpAndSettle();
    containerFinder = find.byType(Container);
    container = tester.widget<Container>(containerFinder);

    expect(container.constraints!.minWidth, 200);
    expect(container.constraints!.minHeight, 200);
    expect((container.decoration as BoxDecoration).color , Colors.green);
    expect((container.decoration as BoxDecoration).borderRadius,
        BorderRadius.circular(50),
     );
    },
  );
}