import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'onboarding.dart'; // Ensure this import points to your onboarding file

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Onboarding content
          Expanded(
            child: OnboardingPagePresenter(
              pages: [
                OnboardingPageModel(
                  title: 'Fast, Fluid and Secure',
                  description:
                      'Enjoy the best of the world in the palm of your hands.',
                  imageUrl: 'https://i.ibb.co/cJqsPSB/scooter.png',
                  bgColor: Colors.indigo,
                ),
                OnboardingPageModel(
                  title: 'Connect with your friends.',
                  description: 'Connect with your friends anytime anywhere.',
                  imageUrl:
                      'https://i.ibb.co/LvmZypG/storefront-illustration-2.png',
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
                  description:
                      'Follow your favourite creators to stay in the loop.',
                  imageUrl: 'https://i.ibb.co/cJqsPSB/scooter.png',
                  bgColor: Colors.purple,
                ),
              ],
            ),
          ),

          // Only Login button at the bottom
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => context.go('/login'),
                  child: const Text('Login'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
