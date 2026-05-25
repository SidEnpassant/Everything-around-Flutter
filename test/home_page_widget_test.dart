import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testapp/widget_test/counter_app/home_page.dart';

void main(){
  testWidgets('given counter is 0 when increment button is clicked then counter should be 1',
    (tester) async{
    await tester.pumpWidget(
      const MaterialApp(
      home: MyHomePage(
        title:'Counter app',
       ),
     ),
    );
    final counter = find.text('0');
    expect(counter, findsOneWidget);
    // expect(counter, findsNWidgets(1));
    // expect(counter, findsNothing);

    final counter2 = find.text('1');
    expect(counter2, findsNothing);

    //final incrementBTN = find.byType(FloatingActionButton);
    final incrementBTN = find.byKey(const Key('increment_counter'));
    await tester.tap(incrementBTN);

    await tester.pump(); // because setS tate called in home screen so need to pump here to realise the reflected change in home page

    final counter3 = find.text('1');
    expect(counter3, findsOneWidget);

    final counter4 = find.text('0');
    expect(counter4, findsNothing);
    
    expect(find.byType(AppBar), findsOneWidget);
   },
  );
}