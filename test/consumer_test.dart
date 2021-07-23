import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:my_provider/index.dart';

const providerKey = 'SIMPLE_PROVIDER';
const valueString = 'HELLO';
const valueStringNext = 'GOOD BYE';

main() {
  testWidgets("Consumer: basic usage", (WidgetTester tester) async {
    var simpleProvider =
        Provider<String?>(providerKey: providerKey, value: valueString);

    var consumer = Consumer<String>(
        providerKey: providerKey,
        builder: (context, value) {
          return Text(value);
        });

    // with initial value
    await tester.pumpWidget(consumer);
    var valueFinder = find.text(valueString);
    expect(valueFinder, findsOneWidget);

    // update provider's value
    simpleProvider.setValue(valueStringNext);
    await tester.pump();
    valueFinder = find.text(valueStringNext);
    expect(valueFinder, findsOneWidget);
  });
}
