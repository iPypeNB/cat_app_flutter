import 'package:cat_app_flutter/features/authentication/application/bloc/login/login_bloc.dart';
import 'package:cat_app_flutter/features/authentication/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../config/mocks/features/authentication/application/bloc/mock_loging_bloc.mock.dart';

final getIt = GetIt.instance;

void main() {
  late MockLoginBloc mockLoginBloc;
  //late StreamController<LoginState> loginStreamController;

  Widget buildSut() {
    return const MaterialApp(
      home: Scaffold(
        body: WelcomeScreen(),
      ),
    );
  }

  setUpAll(() {
    mockLoginBloc = MockLoginBloc();
    when(() => mockLoginBloc.state).thenReturn(InitialState());

    getIt.registerFactory<LoginBloc>(() => mockLoginBloc);
  });

  group('WelcomeScreen test', () {
    testWidgets('Find event initial state', (tester) async {
      // Arrange

      // Act
      tester.pumpWidget(buildSut());

      // Assert

    });
  });
}
