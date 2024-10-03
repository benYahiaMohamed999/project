import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());

  Offset position = const Offset(0, 0);
  void changePosition(DragUpdateDetails details) {
    position += details.delta;
    emit(ChangeContainerPlace(posiition:position));
    print(position);
  }



  void updatePosition(Offset newPosition) {
    emit(NewPosition(newPosition:newPosition));
  }

}
  

