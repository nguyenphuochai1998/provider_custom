import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:my_provider/index.dart';
import 'package:my_provider/provider_controller.dart';

const providerKey = 'SIMPLE_PROVIDER';
const valueString = 'HELLO';
const valueStringNext = 'GOOD BYE';
const valueString3rd = 'provider_vn';

main() {
  testWidgets("Consumer: basic usage", (WidgetTester tester) async {
    ProviderController providerController = new ProviderController();
    var simpleProvider =
        Provider<String?>(providerKey: providerKey, value: valueString);
    providerController.addProvider(providers: [simpleProvider]);
    var consumer = Consumer<String>(
        providerController: providerController,
        providerKey: providerKey,
        builder: (context, value) {
          return Text(value, textDirection: TextDirection.ltr);
        });

    // test lan dau
    await tester.pumpWidget(consumer);
    var valueFinder = find.text(valueString);
    expect(valueFinder, findsOneWidget);


    // test lần 2
    await providerController.getProviderByKey(key: providerKey)!.setValue(valueStringNext);
    // with initial value
    await tester.pump();
    valueFinder = find.text(valueStringNext);
    expect(valueFinder, findsOneWidget);


    // test lần 3
    await providerController.getProviderByKey(key: providerKey)!.setValue(valueString3rd);
    await tester.pump();
    valueFinder = find.text(valueString3rd);
    expect(valueFinder, findsOneWidget);

  });
}
