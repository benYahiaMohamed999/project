part of 'test_cubit.dart';

sealed class TestState extends Equatable {
  const TestState();

  @override
  List<Object> get props => [];
}

final class TestInitial extends TestState {}

final class ChangeContainerPlace extends TestState {
  final Offset posiition;

  const ChangeContainerPlace({required this.posiition});

  @override
  List<Object> get props => [posiition];
}

final class NewPosition extends TestState {
  final Offset newPosition;

  NewPosition({required this.newPosition});
  @override
  List<Object> get props => [newPosition];

}
