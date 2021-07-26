import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:my_provider/index.dart';
import 'package:my_provider/provider_controller.dart';

const providerKey = 'SIMPLE_PROVIDER';
const providerKey2 = 'SIMPLE_PROVIDER2';
const valueString = 'HELLO';
const valueStringNext = 'GOOD BYE';
const valueString3rd = 'provider_vn';

main() {
  testWidgets("Consumer: basic usage", (WidgetTester tester) async {
    // provider cho key 1
    var simpleProvider = ProviderController(
        providers: [
          Provider<String?>(providerKey: providerKey, value: valueString)
        ],
        builderChild: () {
          return Consumer(
              providerKey: providerKey,
              builder: (context, value) {
                return Text(
                  value.toString(),
                  textDirection: TextDirection.ltr,
                );
              });
        });
    // test lan dau
    await tester.pumpWidget(simpleProvider);
    var valueFinder = find.text(valueString);
    expect(valueFinder, valueFinder);
  });
}
