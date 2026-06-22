import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/core/di/injector.dart';
import 'package:kan_board_web/app/features/goals/presentation/cubit/goal_cubit.dart';
import 'package:kan_board_web/app/features/goals/presentation/cubit/goals_state.dart';
import 'package:kan_board_web/app/features/goals/presentation/widgets/goals_list_widget.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GoalsCubit>()..loadGoals(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meus Objetivos'),
        ),
        body: BlocBuilder<GoalsCubit, GoalsState>(
          builder: (context, state) {
            switch (state) {
              case GoalsInitial():
              case GoalsLoading():
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case GoalsError():
                return Center(
                  child: Text(
                    state.message,
                  ),
                );

              case GoalsSuccess():
                return GoalsListWidget(
                  goals: state.goals,
                );
            }
          },
        ),
      ),
    );
  }
}
