import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testapp/widget_test/complex_api_app/home_screen.dart';
import 'package:testapp/widget_test/complex_api_app/user_model.dart';

void main(){
  testWidgets('Display list of users with title as name and subtitle as email',
  (tester) async{
    final users = [
      User(id: 1 , name: 'Siddhes' , email: 'siddhes2.o@gmail.com'),
      User(id: 2 , name: 'Samdesh' , email: 'samdy.o@gmail.com'),
    ];
    Future<List<User>> mockFetchUsers() async{
      return Future.delayed(Duration(seconds: 1), () => users);
      //return users;
    }
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(
          futureUsers: mockFetchUsers(),
        ),
      ),
    );
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle(); // this pumpAndSettle keeps on calling pump until future is settled or future is done
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(users.length));

    for(final user in users){
      expect(find.text(user.name), findsOneWidget);
      expect(find.text(user.email), findsOneWidget);
    }
  });
}