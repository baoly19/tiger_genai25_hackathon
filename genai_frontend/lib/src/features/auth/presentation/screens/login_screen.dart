import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


import '../../../../core/services/auth_service.dart';
import 'onboarding.dart'; // Make sure this points to your updated onboarding file

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  bool _isLoading = false;

  

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    final authService = AuthService(Supabase.instance.client);

    try {
      final response = await authService.signInWithEmail(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      final user = response.user;

      if (user != null) {
        if (mounted) context.go('/home');
      } else {
        throw Exception("Login failed: no user returned");
      }
    } on AuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login failed: ${e.message}')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Unexpected error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    final onboardingPages = [
      OnboardingPageModel(
        title: 'Fast, Fluid and Secure',
        description: 'Enjoy the best of the world in the palm of your hands.',
        imageUrl: 'https://i.ibb.co/cJqsPSB/scooter.png',
        bgColor: Colors.indigo,
      ),
      OnboardingPageModel(
        title: 'Connect with your friends.',
        description: 'Connect with your friends anytime anywhere.',
        imageUrl: 'https://i.ibb.co/LvmZypG/storefront-illustration-2.png',
        bgColor: const Color(0xff1eb090),
      ),
      OnboardingPageModel(
        title: 'Bookmark your favourites',
        description:
            'Bookmark your favourite quotes to read at a leisure time.',
        imageUrl: 'https://i.ibb.co/420D7VP/building.png',
        bgColor: const Color(0xfffeae4f),
      ),
      OnboardingPageModel(
        title: 'Follow creators',
        description: 'Follow your favourite creators to stay in the loop.',
        imageUrl: 'https://i.ibb.co/cJqsPSB/scooter.png',
        bgColor: Colors.purple,
      ),
    ];

    return Scaffold(
      body: Center(
        child: isSmallScreen
            ? SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const _Logo(), // Show simple logo on phone
                    const SizedBox(height: 24),
                    _FormContent(
                      formKey: _formKey,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      isPasswordVisible: _isPasswordVisible,
                      isLoading: _isLoading,
                      rememberMe: _rememberMe,
                      onTogglePassword: () => setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      }),
                      onToggleRemember: (value) => setState(() {
                        _rememberMe = value;
                      }),
                      onLogin: _handleLogin,
                    ),
                  ],
                ),
              )
            : Container(
                // padding: const EdgeInsets.all(32.0),
                // constraints: const BoxConstraints(maxWidth: 1000),
                child: Row(
                  children: [
                    // Show onboarding only on large screen
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 0.0,
                        ), // Top & bottom margin
                        child: Center(
                          child: Container(
                            // constraints: const BoxConstraints(
                            //   maxWidth: 800,
                            // ), // Wider than default
                            child: OnboardingPagePresenter(
                              pages: onboardingPages,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const _Logo(), // Logo on top of the form
                          const SizedBox(height: 24),
                          _FormContent(
                            formKey: _formKey,
                            emailController: _emailController,
                            passwordController: _passwordController,
                            isPasswordVisible: _isPasswordVisible,
                            isLoading: _isLoading,
                            rememberMe: _rememberMe,
                            onTogglePassword: () => setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            }),
                            onToggleRemember: (value) => setState(() {
                              _rememberMe = value;
                            }),
                            onLogin: _handleLogin,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlutterLogo(size: 100),
        const SizedBox(height: 16),
        Text(
          "Clinical AI",
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        Text(
          "Smart diagnosis assistant",
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}


class _FormContent extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isPasswordVisible;
  final bool isLoading;
  final bool rememberMe;
  final VoidCallback onTogglePassword;
  final ValueChanged<bool> onToggleRemember;
  final VoidCallback onLogin;

  const _FormContent({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.isPasswordVisible,
    required this.isLoading,
    required this.rememberMe,
    required this.onTogglePassword,
    required this.onToggleRemember,
    required this.onLogin,
  });

  Widget _gap() => const SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                bool emailValid = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                ).hasMatch(value);
                if (!emailValid) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            _gap(),
            TextFormField(
              controller: passwordController,
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: onTogglePassword,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              onFieldSubmitted: (_) => onLogin(),
            ),
            _gap(),
            CheckboxListTile(
              value: rememberMe,
              onChanged: (value) {
                if (value != null) onToggleRemember(value);
              },
              title: const Text('Remember me'),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              contentPadding: const EdgeInsets.all(0),
            ),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : onLogin,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
