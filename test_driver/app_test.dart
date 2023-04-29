import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Flutter Driver demo', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      await driver.close();
    });

    test('UI Testing add urls', () async {
      await driver.tap(find.byValueKey('keyUrlSend'));
      await driver.enterText('www.google.com');
      await driver.tap(find.byValueKey('keyButtonSend'));

      final finder = find.byValueKey('itemListView0');
      bool elementFound = true;
      await driver.runUnsynchronized(() async {
        try {
          await driver.waitFor(finder, timeout: const Duration(seconds: 3));
        } catch (error) {
          elementFound = false;
        }
      });
      expect(elementFound, isTrue);
    });

    test('UI Testing add wrong urls', () async {
      await driver.tap(find.byValueKey('keyUrlSend'));
      await driver.enterText('google');
      await driver.tap(find.byValueKey('keyButtonSend'));

      final wrongFinder = find.byValueKey('itemListView1');
      bool elementFound = false;
      await driver.runUnsynchronized(() async {
        try {
          await driver.waitForAbsent(wrongFinder, timeout: const Duration(seconds: 3));
        } catch (error) {
          elementFound = true;
        }
      });
      expect(elementFound, isFalse);
    });

    test('UI Testing add empty urls', () async {
      await driver.tap(find.byValueKey('keyUrlSend'));
      await driver.enterText('google');
      await driver.tap(find.byValueKey('keyButtonSend'));

      final wrongFinder = find.byValueKey('itemListView1');
      bool elementFound = false;
      await driver.runUnsynchronized(() async {
        try {
          await driver.waitForAbsent(wrongFinder, timeout: const Duration(seconds: 3));
        } catch (error) {
          elementFound = true;
        }
      });
      expect(elementFound, isFalse);
    });
  });
}
