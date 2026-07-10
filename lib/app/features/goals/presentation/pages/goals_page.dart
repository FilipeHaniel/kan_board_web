import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/core/design_system/foundations/spacing/kanboard_ds_spacing.dart';
import 'package:kan_board_web/app/core/design_system/foundations/typography/kanboard_ds_text_styles.dart';
import 'package:kan_board_web/app/core/di/injector.dart';
import 'package:kan_board_web/app/features/goals/presentation/cubit/goal_cubit.dart';
import 'package:kan_board_web/app/features/goals/presentation/cubit/goals_state.dart';
import 'package:kan_board_web/app/features/goals/presentation/widgets/create_goal_dialog.dart';
import 'package:kan_board_web/app/features/goals/presentation/widgets/goals_list_widget.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GoalsCubit>()..loadGoals(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<GoalsCubit, GoalsState>(
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
                      style: KanBoardDSTextStyles.error(context),
                    ),
                  );

                case GoalsSuccess():
                  return Padding(
                    padding: const EdgeInsets.all(
                      KanBoardDSSpacing.space32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Planos de estudo',
                          style: KanBoardDSTextStyles.displaySmall(context),
                        ),
                        const SizedBox(height: KanBoardDSSpacing.space8),
                        Text(
                          'Organize seus objetivos antes de começar a estudar.',
                          style: KanBoardDSTextStyles.bodyLarge(context),
                        ),
                        const SizedBox(height: KanBoardDSSpacing.space32),
                        SizedBox(
                          width: 280,
                          child: OutlinedButton.icon(
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (_) => BlocProvider.value(
                                  value: context.read<GoalsCubit>(),
                                  child: const CreateGoalDialog(),
                                ),
                              );

                              if (context.mounted) {
                                context.read<GoalsCubit>().loadGoals();
                              }
                            },
                            icon: const Icon(Icons.add),
                            label: const Text('Novo plano'),
                          ),
                        ),
                        const SizedBox(height: KanBoardDSSpacing.space32),
                        Expanded(
                          child: GoalsListWidget(
                            goals: state.goals,
                          ),
                        ),
                      ],
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
