import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../auth_bloc/auth_bloc.dart';

class SignUpScreenContent extends StatefulWidget {
  const SignUpScreenContent({super.key});

  @override
  State<SignUpScreenContent> createState() => _SignUpScreenContentState();
}

class _SignUpScreenContentState extends State<SignUpScreenContent> {
  late final TextEditingController _emailTextEditingController;
  late final TextEditingController _passwordTextEditingController;
  late final TextEditingController _usernameTextEditingController;
  late final ValueNotifier<bool> _obscureNotifier;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _usernameTextEditingController = TextEditingController();
    _obscureNotifier = ValueNotifier<bool>(true);
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _usernameTextEditingController.dispose();
    _obscureNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(
              left: 24.0,
              right: 24,
              top: MediaQuery.of(context).padding.top,
            ),
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (BuildContext context, AuthState state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 24),
                    Text(
                      'auth.signUp'.tr(),
                      style: AppFonts.headingH3,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'auth.createAccountToGetStarted'.tr(),
                      style: AppFonts.bodyS.copyWith(
                        color: AppColors.of(context).textSecondary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'auth.username'.tr(),
                      style: AppFonts.headingH5,
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: state.errorMessage == null
                          ? InputDecoration(
                              hintText: 'auth.username'.tr(),
                            )
                          : InputDecoration(
                              hintText: 'auth.username'.tr(),
                              enabledBorder: Theme.of(context)
                                  .inputDecorationTheme
                                  .errorBorder,
                            ),
                      controller: _usernameTextEditingController,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'auth.emailAddress'.tr(),
                      style: AppFonts.headingH5,
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: state.errorMessage == null
                          ? InputDecoration(
                              hintText: 'auth.emailAddress'.tr(),
                            )
                          : InputDecoration(
                              hintText: 'auth.emailAddress'.tr(),
                              enabledBorder: Theme.of(context)
                                  .inputDecorationTheme
                                  .errorBorder,
                            ),
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailTextEditingController,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'auth.password'.tr(),
                      style: AppFonts.headingH5,
                    ),
                    const SizedBox(height: 8),
                    ValueListenableBuilder<bool>(
                      valueListenable: _obscureNotifier,
                      builder: (BuildContext context, bool isObscured,
                          Widget? child) {
                        return Column(
                          children: <Widget>[
                            TextField(
                              style: const TextStyle(color: Colors.black),
                              obscureText: isObscured,
                              decoration: InputDecoration(
                                hintText: 'auth.createPassword'.tr(),
                                errorText: state.errorMessage,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isObscured
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppColors.of(context).darkIcon,
                                  ),
                                  onPressed: () => _obscureNotifier.value =
                                      !_obscureNotifier.value,
                                ),
                              ),
                              controller: _passwordTextEditingController,
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: () => context.read<AuthBloc>().add(
                            SignUpWithCredentials(
                              login: _emailTextEditingController.text,
                              password: _passwordTextEditingController.text,
                              username: _usernameTextEditingController.text,
                            ),
                          ),
                      child: Text('auth.signUp'.tr()),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${'auth.alreadyHaveAccount'.tr()} ',
                          style: AppFonts.bodyS,
                        ),
                        GestureDetector(
                          onTap: () =>
                              context.read<AuthBloc>().add(NavigateToLogin()),
                          child: Text(
                            'auth.login'.tr(),
                            style: AppFonts.actionM.copyWith(
                              color: AppColors.of(context).primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
