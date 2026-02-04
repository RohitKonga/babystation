import 'package:babystation/features/auth/view/login_page.dart';
import 'package:flutter/material.dart';

class OnboardingScreenPage extends StatefulWidget {
  const OnboardingScreenPage({super.key});

  @override
  State<OnboardingScreenPage> createState() => _OnboardingScreenPageState();
}

class _OnboardingScreenPageState extends State<OnboardingScreenPage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/baby1.png",
      "title": "Adorable fashion for your little one",
      "desc":
          "Discover cute, comfortable, and trendy outfits made with love for babies.",
    },
    {
      "image": "assets/images/baby2.png",
      "title": "Soft & Safe Fabrics",
      "desc":
          "Premium-quality materials designed for all-day comfort and care.",
    },
    {
      "image": "assets/images/baby3.png",
      "title": "Welcome to Baby Station",
      "desc":
          "Stylish, soft & comfy outfits for your baby, Designed with love for delicate skin & Simple ordering & fast delivery.",
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isLastPage = _currentPage == _onboardingData.length - 1;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Image.asset(
                      _onboardingData[index]["image"]!,
                      width: size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 80),
                          Text(
                            _onboardingData[index]["title"]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            _onboardingData[index]["desc"]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          if (!isLastPage)
            Positioned(
              top: 40,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  _pageController.jumpToPage(_onboardingData.length - 1);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Color(0xFF9C278F),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          Align(
            alignment: const Alignment(0.0, 0.35),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                _onboardingData.length,
                (index) => buildDot(index),
              ),
            ),
          ),

          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: isLastPage
                ? SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9C278F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _currentPage > 0
                          ? Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF9C278F)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 45,
                              width: 45,
                              child: IconButton(
                                onPressed: _previousPage,
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Color(0xFF9C278F),
                                  size: 18,
                                ),
                              ),
                            )
                          : const SizedBox(width: 48),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF9C278F),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 45,
                        width: 45,
                        child: IconButton(
                          onPressed: _nextPage,
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: _currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Color(0xFF9C278F) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
