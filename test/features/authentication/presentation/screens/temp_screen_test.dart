import 'package:cat_app_flutter/features/authentication/application/bloc/temp/temp_bloc.dart';
import 'package:cat_app_flutter/features/authentication/presentation/screens/temp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../config/mocks/features/authentication/application/bloc/mock_temp_bloc.mock.dart';

final getIt = GetIt.instance;

void main () {
  late MockTempBloc mockTempBloc;

  setUpAll((){
    mockTempBloc = MockTempBloc();
    when(() => mockTempBloc.state).thenReturn(InitialState());
    getIt.registerFactory<TempBloc>(() => mockTempBloc);
  });

  Widget buildSut() {
    return const MaterialApp(
      home: TempScreen(),
    );
  }

  group('TempScreen existence test', () {
    testWidgets('Verify Principal Icon exists', (tester) async {
      // Arrange
      // Act
      await tester.pumpWidget(buildSut());
      final finder = find.byType(Icon);

      // assert
      expect(finder, findsOneWidget);

    });

    testWidgets('Verify Principal Email Input exists', (tester) async {
      // Arrange
      // Act
      await tester.pumpWidget(buildSut());
      final finder = find.byKey(Key('temp-organism-email-field'));

      // assert
      expect(finder, findsOneWidget);

    });

    testWidgets('Verify text register exists', (tester) async {
      // Arrange
      // Act
      await tester.pumpWidget(buildSut());
      final finder = find.text('Registrarse');

      // assert
      expect(finder, findsOneWidget);

    });
  });
}