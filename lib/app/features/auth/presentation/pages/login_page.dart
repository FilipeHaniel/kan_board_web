import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/core/design_system/foundations/spacing/kanboard_ds_spacing.dart';
import 'package:kan_board_web/app/core/design_system/foundations/typography/kanboard_ds_text_styles.dart';
import 'package:kan_board_web/app/core/design_system/primitives/button/kanboard_ds_button.dart';
import 'package:kan_board_web/app/core/design_system/primitives/text_field/kanboard_ds_text_field.dart';
import 'package:kan_board_web/app/core/routes/app_routes.dart';
import 'package:kan_board_web/app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:kan_board_web/app/features/auth/presentation/cubit/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future<void> _login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    await context.read<LoginCubit>().login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 420,
            ),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.goals,
                      );
                    }

                    if (state is LoginError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    final loading = state is LoginLoading;

                    return Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'KanBoard',
                            style: KanBoardDSTextStyles.displaySmall(context),
                          ),
                          const SizedBox(
                            height: KanBoardDSSpacing.space8,
                          ),
                          Text(
                            'Entre para continuar',
                            style: KanBoardDSTextStyles.bodyLargeSecondary(
                              context,
                            ),
                          ),
                          const SizedBox(
                            height: KanBoardDSSpacing.space32,
                          ),
                          KanBoardDSTextField(
                            controller: emailController,
                            label: 'E-mail',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: KanBoardDSSpacing.space16,
                          ),
                          KanBoardDSTextField(
                            controller: passwordController,
                            label: 'Senha',
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: KanBoardDSSpacing.space24,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: KanBoardDSButton(
                              text: 'Entrar',
                              loading: loading,
                              onPressed: loading ? null : _login,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
