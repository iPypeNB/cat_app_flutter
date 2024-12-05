import 'package:bloc_test/bloc_test.dart';
import 'package:cat_app_flutter/features/authentication/application/bloc/temp/temp_bloc.dart';

final class MockTempBloc extends MockBloc<TempEvent, TempState> implements TempBloc {}