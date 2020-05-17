import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mine_sweeper/business/game/actions/create_empty_board.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/screens/home/home.dart';

class HomeConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, ViewModel>(
      model: ViewModel(),
      builder: (BuildContext context, ViewModel vm) {
        return Home(
          initGameBoard: vm.initBoard,
        );
      },
    );
  }
}

class ViewModel extends BaseModel<GameState> {
  ViewModel();

  void Function(Difficulty) initBoard;

  ViewModel.build({
    @required this.initBoard
  });

  @override
  ViewModel fromStore() {
    return ViewModel.build(
      initBoard: (Difficulty d) => dispatch(CreateEmptyBoardAction(d))
    );
  }
}