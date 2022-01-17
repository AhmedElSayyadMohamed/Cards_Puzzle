import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/datalayer/states.dart';

class PuzzleBloc extends Cubit<PuzzleStates> {
  PuzzleBloc() : super(InitialState());

  static PuzzleBloc get(context) => BlocProvider.of(context);

  List<int> numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  bool iswin = false;
  bool oneTileSorted = true;
  int countOfWalk = 0;
  int tile = 4;

  void Shuffle_Numbers() {
    numbers.shuffle();
    countOfWalk = 0;
    tile = 4;
    emit(SuffleNumberState());
  }

  void move_card(int index) {
    if (index == 3 || index == 7 || index == 11) {
      if (numbers.indexOf(0) - index == -1 ||
          (numbers.indexOf(0) - index).abs() == 4) {
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
        countOfWalk++;
      }
    } else if ((numbers.indexOf(0) - index).abs() == 1 ||
        (numbers.indexOf(0) - index).abs() == 4) {
      numbers[numbers.indexOf(0)] = numbers[index];
      numbers[index] = 0;
      countOfWalk++;
    }

    emit(MoveNumberState());
  }

  void playerWin() {
    for (int i = 1; i <= 4; i++) {
      if (numbers.indexOf(i) == i - 1) {
        // if (oneTileSorted) {
        tile--;
        oneTileSorted = false;
      }
      //}
    }




    /*numbers.indexOf(i+2) == 1 &&
          numbers.indexOf(i+3) == 2 &&
          numbers.indexOf(i+4) == 3*/
  }
}
