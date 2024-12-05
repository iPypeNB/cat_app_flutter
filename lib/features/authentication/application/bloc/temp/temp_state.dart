part of 'temp_bloc.dart';

final class TempState extends Equatable {
  const TempState({required this.data});

  final TempDto data;

  @override
  List<Object?> get props => [data];
}

final class InitialState extends TempState {
  InitialState() : super(data: TempDto.empty());
}

final class DataTempUpdated extends TempState {
  const DataTempUpdated({
    required super.data,
  });
}
