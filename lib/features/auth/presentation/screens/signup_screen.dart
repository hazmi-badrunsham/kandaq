import 'package:flutter/material.dart';
import 'package:kandaq/core/theme/app_colors.dart';
import 'package:kandaq/core/theme/app_typography.dart';
import 'package:kandaq/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:kandaq/features/auth/presentation/widgets/auth_divider.dart';
import '../auth_state.dart';
import '../../data/auth_repository.dart';
import 'package:go_router/go_router.dart'; // 🆕 Add this to fix context.push
import '../pages/auth_layout.dart'; // 🆕 THIS IS THE KEY IMPORT

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmPassCtrl = TextEditingController();
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
    _confirmPassCtrl.dispose();
    super.dispose();
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != _passCtrl.text) return 'Passwords do not match';
    return null;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _auth.signUp(email: _emailCtrl.text.trim(), password: _passCtrl.text);
    }
  }

  void _goToLogin() {
    Navigator.of(context).pop();
  }

  // lib/features/auth/presentation/screens/signup_screen.dart
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      // 🆕 Simplified wrapping
      child: ValueListenableBuilder<AuthState>(
        valueListenable: _auth,
        builder: (_, state, __) {
          if (state.user != null) {
            return const Center(child: Text('Account created! Redirecting...'));
          }

          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'kandaq',
                  style: AppTypography.headingLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                Text(
                  'Create Your Account',
                  style: AppTypography.headingMedium.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 25),

                AuthTextField(
                  label: 'Email',
                  controller: _emailCtrl /* validator */,
                ),
                const SizedBox(height: 16),
                AuthTextField(
                  label: 'Password',
                  controller: _passCtrl,
                  obscureText: true /* validator */,
                ),
                const SizedBox(height: 16),
                AuthTextField(
                  label: 'Confirm Password',
                  controller: _confirmPassCtrl,
                  obscureText: true,
                  validator: _validateConfirmPassword,
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

                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: state.isLoading ? null : _submit,
                    style: ElevatedButton.styleFrom(/* style */),
                    child: state.isLoading
                        ? const CircularProgressIndicator()
                        : Text('Create Account', style: AppTypography.button),
                  ),
                ),

                const AuthDivider(text: 'or'),

                TextButton(
                  onPressed: state.isLoading
                      ? null
                      : () => context.go('/login'),
                  child: Text(
                    'Already have an account? Sign in',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
