import 'package:flutter/material.dart';
import 'package:kandaq/core/theme/app_colors.dart';
import 'package:kandaq/core/theme/app_typography.dart';
import 'package:kandaq/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:kandaq/features/auth/presentation/widgets/auth_divider.dart'; // 1. Add this import
import '../auth_state.dart';
import 'signup_screen.dart';
import 'package:go_router/go_router.dart'; // 🆕 Add this to fix context.push
import '../pages/auth_layout.dart'; // 🆕 THIS IS THE KEY IMPORT
import '../../data/auth_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  late final AuthProvider _auth;

  @override
  void initState() {
    super.initState();
    _auth = AuthProvider(repository: AuthRepository());
  }

  @override
  void dispose() {
    _auth.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _onSignIn() {
    if (_formKey.currentState!.validate()) {
      _auth.signIn(email: _emailCtrl.text.trim(), password: _passCtrl.text);
    }
  }

  void _onSignUp() {
    if (_formKey.currentState!.validate()) {
      _auth.signUp(email: _emailCtrl.text.trim(), password: _passCtrl.text);
    }
  }

  // lib/features/auth/presentation/screens/login_screen.dart
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      // 🆕 Using the layout wrapper
      child: ValueListenableBuilder<AuthState>(
        valueListenable: _auth,
        builder: (context, state, _) {
          if (state.user != null) {
            return const Center(child: Text('Welcome! Redirecting...'));
          }

          return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'kandaq',
                  style: AppTypography.headingLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Discover the best Nasi Kandar spots',
                  style: AppTypography.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                AuthTextField(
                  label: 'Email',
                  controller: _emailCtrl,
                  validator: (v) =>
                      v != null && v.contains('@') ? null : 'Enter valid email',
                ),
                const SizedBox(height: 16),
                AuthTextField(
                  label: 'Password',
                  controller: _passCtrl,
                  obscureText: true,
                  validator: (v) =>
                      (v?.length ?? 0) >= 6 ? null : 'Min 6 characters',
                ),
                const SizedBox(height: 24),

                if (state.error != null) ...[
                  Text(
                    state.error!,
                    style: const TextStyle(color: AppColors.error),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                ],

                // Sign In Button
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.background,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: state.isLoading ? null : _onSignIn,
                    child: state.isLoading
                        ? const CircularProgressIndicator(
                            color: AppColors.background,
                          )
                        : Text('Sign In', style: AppTypography.button),
                  ),
                ),

                const AuthDivider(text: 'or'),

                TextButton(
                  onPressed: state.isLoading
                      ? null
                      : () => context.push('/signup'), // Use GoRouter
                  child: const Text('Create Account'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
