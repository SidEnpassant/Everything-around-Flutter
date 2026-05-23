import 'package:flutter_test/flutter_test.dart';
import 'package:testapp/unit_test/counter.dart';

void main(){

  late Counter counter;
  setUp((){
    counter = Counter();
  });
  // Pretest
  // setUp(() => null); // called before every single test will run
  // setUpAll(() => null); // called before all the test

  // setUp -> test -> setUp -> test -> setUp -> test ......
  // setUpAll -> test  -> test  -> test ......

  group(
      'Counter Class - ', (){
        // ARRANGE

        test('given counter class when it is instantiated then value of count should be 0',
            (){

            // ACT
            final val = counter.count;

            // ASSERT
            expect(val, 0);
          },
        );
        test('given counter class when it is incremented then the value of count should be 1',
              (){

            // ACT
            counter.incrementCounter();
            final val = counter.count;

            // ASSERT
            expect(val, 1);
          },
        );
        test('given counter class when it is decremented then the value of count should be -1',
            (){

         // ACT
          counter.decrementCounter();
          final val = counter.count;
         // ASSERT
          expect(val, -1);
            }
        );
        test('given counter class when it is reset then the value of count should be 0', (){
          counter.resetCounter();
          final val = counter.count;
          expect(val, 0);
        });
      }
  );

  // Post Test
  // tearDown(() => null);// called after every single test ran
  // tearDownAll(() => null);// called after all the test ran

  // test -> tearDown -> test -> tearDown -> test -> tearDown
  // test  -> test  -> test -> tearDownAll

}