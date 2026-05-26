import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:automated_integration_test/automated_integration_test.dart';
import 'package:testapp/main.dart' as app;
import 'package:testapp/integration_Test/home_screen.dart';


void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  group('end to end test',
    (){
    testWidgets('verify login screen with correct username and password',
        (tester)async{
          app.main();
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 3));
          await tester.enterText(find.byKey(Key('username_controller')), 'username');
          await Future.delayed(const Duration(seconds: 3));
          await tester.enterText(find.byKey(Key('password_controller')), 'password');
          await Future.delayed(const Duration(seconds: 3));
          await tester.tap(find.byType(ElevatedButton));
          await Future.delayed(const Duration(seconds: 3));
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 3));
          expect(find.byType(HomeScreen), findsOneWidget);
        }
     );
    testWidgets('verify login screen with incorrect username and password',
            (tester)async{
          app.main();
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 3));
          await tester.enterText(find.byKey(Key('username_controller')), 'siddhes');
          await Future.delayed(const Duration(seconds: 3));
          await tester.enterText(find.byKey(Key('password_controller')), 'siddddwee');
          await Future.delayed(const Duration(seconds: 3));
          await tester.tap(find.byType(ElevatedButton));
          await Future.delayed(const Duration(seconds: 3));
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 3));
          // expect(find.byType(AlertDialog), findsOneWidget);
              // OR
          expect(find.text('Invalid username or password'), findsOneWidget);
        }
    );
   },
  );
}

// how integration testing different from widget testing ; widget testing works on isolated
// environment but integration testing really checks the app so before running integration test
// have to stop emulator running debug connection for integration test to run, integration testing checks the app
// behaving like user(automated system) and checks the whole actual app