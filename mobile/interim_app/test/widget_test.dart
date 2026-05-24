import 'package:flutter_test/flutter_test.dart';
import 'package:interim_app/app/interim_app.dart';

void main() {
  testWidgets('home screen shows product boundary', (tester) async {
    await tester.pumpWidget(const InterimApp());

    expect(find.text('interim'), findsOneWidget);
    expect(find.text('No medical advice'), findsOneWidget);
    expect(find.text('No real name required.'), findsOneWidget);
    expect(find.text('AI is optional and off by default.'), findsOneWidget);
  });
}
