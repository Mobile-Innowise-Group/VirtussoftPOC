import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../auth_bloc/auth_bloc.dart';

class LoginScreenContent extends StatefulWidget {
  const LoginScreenContent({super.key});

  @override
  State<LoginScreenContent> createState() => _LoginScreenContentState();
}

class _LoginScreenContentState extends State<LoginScreenContent> {
  late final TextEditingController _emailTextEditingController;
  late final TextEditingController _passwordTextEditingController;
  late final ValueNotifier<bool> obscureNotifier;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    obscureNotifier = ValueNotifier<bool>(true);
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          bottom: 120,
        ),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (BuildContext context, AuthState state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Image.asset(
                        'assets/images/app_main_logo.png',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 380,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'auth.welcome!'.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'auth.emailAddress'.tr(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailTextEditingController,
                      ),
                      const SizedBox(height: 16),
                      ValueListenableBuilder<bool>(
                        valueListenable: obscureNotifier,
                        builder: (BuildContext context, bool isObscured,
                            Widget? child) {
                          return TextField(
                            style: const TextStyle(color: Colors.black),
                            obscureText: isObscured,
                            decoration: InputDecoration(
                              hintText: 'auth.password'.tr(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isObscured
                                      ? Icons.remove_red_eye
                                      : Icons.remove_red_eye_outlined,
                                  color: AppColors.of(context).darkIcon,
                                ),
                                onPressed: () => obscureNotifier.value =
                                    !obscureNotifier.value,
                              ),
                            ),
                            controller: _passwordTextEditingController,
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'auth.forgotPassword'.tr(),
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.of(context).primary,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      FilledButton(
                        onPressed: () => context.read<AuthBloc>().add(
                              SignInWithCredentials(
                                login: _emailTextEditingController.text,
                                password: _passwordTextEditingController.text,
                              ),
                            ),
                        child: Text(
                          'auth.loginButton'.tr(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'auth.notAMember'.tr(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextButton(
                            onPressed: () => context.read<AuthBloc>().add(
                                  NavigateToSignUp(),
                                ),
                            child: Text(
                              'auth.registerNow'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColors.of(context).primary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
