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
  late final ValueNotifier<bool> _obscureNotifier;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _obscureNotifier = ValueNotifier<bool>(true);
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
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
              right: 24.0,
              bottom: 120,
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
                            style: AppFonts.headingH1,
                          ),
                          const SizedBox(height: 24),
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
                          ValueListenableBuilder<bool>(
                            valueListenable: _obscureNotifier,
                            builder: (BuildContext context, bool isObscured,
                                Widget? child) {
                              return TextField(
                                style: const TextStyle(color: Colors.black),
                                obscureText: isObscured,
                                decoration: InputDecoration(
                                  hintText: 'auth.password'.tr(),
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
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'auth.forgotPassword'.tr(),
                              style: AppFonts.actionM.copyWith(
                                color: AppColors.of(context).primary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          FilledButton(
                            onPressed: () => context.read<AuthBloc>().add(
                                  SignInWithCredentials(
                                    login: _emailTextEditingController.text,
                                    password:
                                        _passwordTextEditingController.text,
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
                                '${'auth.notAMember'.tr()} ',
                                style: AppFonts.bodyS,
                              ),
                              GestureDetector(
                                onTap: () => context.read<AuthBloc>().add(
                                      NavigateToSignUp(),
                                    ),
                                child: Text(
                                  'auth.registerNow'.tr(),
                                  style: AppFonts.actionM.copyWith(
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
        ),
      ),
    );
  }
}
