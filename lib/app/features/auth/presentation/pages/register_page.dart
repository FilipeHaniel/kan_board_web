import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kan_board_web/app/core/design_system/foundations/spacing/kanboard_ds_spacing.dart';
import 'package:kan_board_web/app/core/design_system/foundations/typography/kanboard_ds_text_styles.dart';
import 'package:kan_board_web/app/core/design_system/primitives/button/kanboard_ds_button.dart';
import 'package:kan_board_web/app/core/design_system/primitives/text_field/kanboard_ds_text_field.dart';
import 'package:kan_board_web/app/core/routes/app_routes.dart';
import 'package:kan_board_web/app/features/auth/presentation/cubit/register_cubit.dart';
import 'package:kan_board_web/app/features/auth/presentation/cubit/register_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _validateForm() {
    setState(() {
      _nameError = _nameController.text.trim().isEmpty
          ? 'Informe seu nome'
          : null;

      final email = _emailController.text.trim();

      _emailError = email.isEmpty
          ? 'Informe seu e-mail'
          : !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)
          ? 'Informe um e-mail válido'
          : null;

      _passwordError = _passwordController.text.length < 8
          ? 'A senha deve ter pelo menos 8 caracteres'
          : null;

      _confirmPasswordError =
          _confirmPasswordController.text != _passwordController.text
          ? 'As senhas não coincidem'
          : null;
    });

    return _nameError == null &&
        _emailError == null &&
        _passwordError == null &&
        _confirmPasswordError == null;
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();

    if (!_validateForm()) return;

    await context.read<RegisterCubit>().register(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Conta criada! Entre para continuar.',
                          ),
                        ),
                      );

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.login,
                        (route) => route.settings.name == AppRoutes.splash,
                      );
                    }

                    if (state is RegisterError) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(content: Text(state.message)),
                        );
                    }
                  },
                  builder: (context, state) {
                    final loading = state is RegisterLoading;

                    return Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'KanBoard',
                            textAlign: TextAlign.center,
                            style: KanBoardDSTextStyles.displaySmall(context),
                          ),
                          const SizedBox(
                            height: KanBoardDSSpacing.space8,
                          ),
                          Text(
                            'Crie sua conta',
                            textAlign: TextAlign.center,
                            style: KanBoardDSTextStyles.bodyLargeSecondary(
                              context,
                            ),
                          ),
                          const SizedBox(
                            height: KanBoardDSSpacing.space32,
                          ),
                          KanBoardDSTextField(
                            controller: _nameController,
                            label: 'Nome',
                            hintText: 'Seu nome',
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            enabled: !loading,
                            errorText: _nameError,
                            onChanged: (_) {
                              if (_nameError != null) {
                                setState(() => _nameError = null);
                              }
                            },
                          ),
                          const SizedBox(
                            height: KanBoardDSSpacing.space16,
                          ),
                          KanBoardDSTextField(
                            controller: _emailController,
                            label: 'E-mail',
                            hintText: 'voce@exemplo.com',
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            enabled: !loading,
                            errorText: _emailError,
                            onChanged: (_) {
                              if (_emailError != null) {
                                setState(() => _emailError = null);
                              }
                            },
                          ),
                          const SizedBox(
                            height: KanBoardDSSpacing.space16,
                          ),
                          KanBoardDSTextField(
                            controller: _passwordController,
                            label: 'Senha',
                            obscureText: true,
                            textInputAction: TextInputAction.next,
                            enabled: !loading,
                            helperText: 'Mínimo de 8 caracteres',
                            errorText: _passwordError,
                            onChanged: (_) {
                              if (_passwordError != null ||
                                  _confirmPasswordError != null) {
                                setState(() {
                                  _passwordError = null;
                                  _confirmPasswordError = null;
                                });
                              }
                            },
                          ),
                          const SizedBox(
                            height: KanBoardDSSpacing.space16,
                          ),
                          KanBoardDSTextField(
                            controller: _confirmPasswordController,
                            label: 'Confirmar senha',
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            enabled: !loading,
                            errorText: _confirmPasswordError,
                            onChanged: (_) {
                              if (_confirmPasswordError != null) {
                                setState(
                                  () => _confirmPasswordError = null,
                                );
                              }
                            },
                            onSubmitted: (_) {
                              if (!loading) _submit();
                            },
                          ),
                          const SizedBox(
                            height: KanBoardDSSpacing.space24,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: KanBoardDSButton(
                              text: 'Criar conta',
                              loading: loading,
                              onPressed: loading ? null : _submit,
                            ),
                          ),
                          const SizedBox(
                            height: KanBoardDSSpacing.space16,
                          ),
                          TextButton(
                            onPressed: loading
                                ? null
                                : () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      AppRoutes.login,
                                    );
                                  },
                            child: const Text(
                              'Já tem uma conta? Entrar',
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
