import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await ref.read(authNotifierProvider.notifier).login(
          _emailController.text,
          _passwordController.text,
        );

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Successful')),
      );
      // Navigate to Home
      // Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final res = ResponsiveHelper(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p24)),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Welcome Back',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: res.scaleText(28),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: res.scaleHeight(AppSpacing.p8)),
                  Text(
                    'Please login to continue',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: res.scaleText(14),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: res.scaleHeight(AppSpacing.p32)),
                  if (authState.error != null)
                    Container(
                      padding: EdgeInsets.all(res.scaleSpacing(AppSpacing.p12)),
                      margin: EdgeInsets.only(bottom: res.scaleSpacing(AppSpacing.p16)),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.error.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(res.scaleRadius(AppSpacing.radiusMd)),
                      ),
                      child: Text(
                        authState.error!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: res.scaleText(14),
                        ),
                      ),
                    ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Email is required' : null,
                  ),
                  SizedBox(height: res.scaleHeight(AppSpacing.p16)),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Password is required' : null,
                  ),
                  SizedBox(height: res.scaleHeight(AppSpacing.p24)),
                  ElevatedButton(
                    onPressed: authState.isLoading ? null : _handleLogin,
                    child: authState.isLoading
                        ? SizedBox(
                            width: res.scaleWidth(24),
                            height: res.scaleHeight(24),
                            child: const CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                          )
                        : Text(
                            'Login',
                            style: TextStyle(fontSize: res.scaleText(16)),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
