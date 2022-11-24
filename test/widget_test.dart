// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_todo/main.dart';

void main() {
  testWidgets('Widget generates todos', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    var todos = List.generate(5, (index) => Todo("title $index", "desc $index"));
    await tester.pumpWidget(TodoApp(todos: todos));

    expect(find.text('title 0'), findsOneWidget);
    expect(find.text('title 20'), findsNothing);

    await tester.tap(find.text('title 0'));
    await tester.pumpAndSettle();

    expect(find.text('title 0'), findsOneWidget);
    expect(find.text('desc 0'), findsOneWidget);
  });
}
