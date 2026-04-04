import 'package:flutter/material.dart';
import 'package:kandaq/core/theme/app_colors.dart';
import 'package:kandaq/core/theme/app_typography.dart';
import 'package:kandaq/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:kandaq/features/auth/presentation/widgets/auth_divider.dart'; // 1. Add this import
import 'auth_state.dart';
import '../data/auth_repository.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: ValueListenableBuilder<AuthState>(
          valueListenable: _auth,
          builder: (context, state, _) {
            if (state.user != null) {
              return const Center(child: Text('Welcome! Redirecting...'));
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Form(
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
                          validator: (v) => v != null && v.contains('@') 
                              ? null 
                              : 'Enter a valid email',
                        ),
                        const SizedBox(height: 16),
                        AuthTextField(
                          label: 'Password',
                          controller: _passCtrl,
                          obscureText: true,
                          validator: (v) => (v?.length ?? 0) >= 6 
                              ? null 
                              : 'Min 6 characters',
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
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.background,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: state.isLoading ? null : _onSignIn,
                            child: state.isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.background,
                                    ),
                                  )
                                : Text('Sign In', style: AppTypography.button),
                          ),
                        ),
                        
                        // 2. APPLY HERE: Separating primary action from alternative
                        const AuthDivider(text: 'or'), 

                        TextButton(
                          onPressed: state.isLoading ? null : _onSignUp,
                          child: Text(
                            'Create Account',
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}