import 'package:flutter/material.dart';

class OnboardingPageModel {
  final String title;
  final String description;
  final String imageUrl;
  final Color bgColor;
  final Color textColor;

  OnboardingPageModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.bgColor = Colors.blue,
    this.textColor = Colors.white,
  });
}

class OnboardingPagePresenter extends StatefulWidget {
  final List<OnboardingPageModel> pages;

  const OnboardingPagePresenter({super.key, required this.pages});

  @override
  State<OnboardingPagePresenter> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPagePresenter> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void _nextPage() {
    if (_currentPage < widget.pages.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 250),
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 250),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: widget.pages[_currentPage].bgColor,
      child: SafeArea(
        child: Column(
          children: [
            // Onboarding slides
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.pages.length,
                onPageChanged: (idx) {
                  setState(() {
                    _currentPage = idx;
                  });
                },
                itemBuilder: (context, idx) {
                  final item = widget.pages[idx];
                  return Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Image.network(item.imageUrl),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                item.title,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: item.textColor,
                                    ),
                              ),
                            ),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 280),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                                vertical: 8.0,
                              ),
                              child: Text(
                                item.description,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: item.textColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Page indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.pages.map((item) {
                final isActive = widget.pages.indexOf(item) == _currentPage;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: isActive ? 30 : 8,
                  height: 8,
                  margin: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                );
              }).toList(),
            ),

            // Prev/Next buttons only
            SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: _currentPage > 0,
                    child: TextButton(
                      onPressed: _previousPage,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      child: const Text("Previous"),
                    ),
                  ),
                  TextButton(
                    onPressed: _nextPage,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    child: Text(
                      _currentPage == widget.pages.length - 1 ? "Done" : "Next",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
