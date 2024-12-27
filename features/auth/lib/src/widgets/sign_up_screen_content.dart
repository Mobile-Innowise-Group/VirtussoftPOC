import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../auth_bloc/auth_bloc.dart';

class SignUpScreenContent extends StatefulWidget {
  const SignUpScreenContent({super.key});

  @override
  State<SignUpScreenContent> createState() => _SignUpScreenContentState();
}

class _SignUpScreenContentState extends State<SignUpScreenContent> {
  late final AuthBloc _bloc;
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();
  final TextEditingController _usernameTextEditingController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'auth.signUp'.tr(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: BlocBuilder<AuthBloc, AuthState>(
          bloc: _bloc,
          builder: (BuildContext context, AuthState state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      label: Text(
                        'auth.email'.tr(),
                      ),
                      hintText: 'auth.enterEmail'.tr(),
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailTextEditingController,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      label: Text(
                        'Username',
                      ),
                      hintText: 'Enter your username, please',
                      prefixIcon: Icon(Icons.person),
                    ),
                    controller: _usernameTextEditingController,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    style: const TextStyle(color: Colors.black),
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      label: Text(
                        'auth.password'.tr(),
                      ),
                      hintText: 'auth.enterPassword'.tr(),
                      prefixIcon: const Icon(Icons.password_outlined),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {
                          setState(
                            () => _obscurePassword = !_obscurePassword,
                          );
                        },
                      ),
                    ),
                    controller: _passwordTextEditingController,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _bloc.add(
                      SignUpWithCredentials(
                        login: _emailTextEditingController.text,
                        password: _passwordTextEditingController.text,
                        username: _usernameTextEditingController.text,
                      ),
                    ),
                    child: Text('auth.createAccount'.tr()),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'auth.alreadyCreatedAccount'.tr(),
                      ),
                      TextButton(
                        onPressed: () => _bloc.add(
                          NavigateToLogin(),
                        ),
                        child: Text(
                          'auth.login'.tr(),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
