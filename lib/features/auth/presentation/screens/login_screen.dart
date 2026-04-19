import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/localization/generated/app_localizations.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../providers/auth_provider.dart';
import '../widgets/language_switcher_button.dart';
import '../widgets/login_form_card.dart';
import '../widgets/login_header_section.dart';
import '../widgets/login_info_row.dart';

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
        SnackBar(content: Text(AppLocalizations.of(context)!.welcomeMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final res = ResponsiveHelper(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: res.scaleSpacing(AppSpacing.p24)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: res.scaleHeight(AppSpacing.p48)), // Spacing for top language button
                    const LoginHeaderSection(),
                    SizedBox(height: res.scaleHeight(AppSpacing.p32)),
                    LoginFormCard(
                      formKey: _formKey,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      isLoading: authState.isLoading,
                      errorMessage: authState.error,
                      onLogin: _handleLogin,
                    ),
                    SizedBox(height: res.scaleHeight(AppSpacing.p24)),
                    const LoginInfoRow(),
                    SizedBox(height: res.scaleHeight(AppSpacing.p32)),
                  ],
                ),
              ),
            ),
            
            // Language Switcher Positioned at the Top (Stable)
            Positioned(
              top: res.scaleHeight(16),
              right: Directionality.of(context) == TextDirection.ltr ? res.scaleWidth(16) : null,
              left: Directionality.of(context) == TextDirection.rtl ? res.scaleWidth(16) : null,
              child: const LanguageSwitcherButton(),
            ),
          ],
        ),
      ),
    );
  }
}
