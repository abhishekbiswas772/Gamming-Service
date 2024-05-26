import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class SignupAssets {
  String imagePath;
  String title;
  String subTitle;

  SignupAssets({
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });
}

class _SignUpScreenState extends State<SignUpScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final List<SignupAssets> _list_of_assets = [
    SignupAssets(
      imagePath: "assets/images/1Heal.jpg",
      title: "Play Online with friends",
      subTitle: "Always on standby to play together all the time",
    ),
    SignupAssets(
      imagePath: "assets/images/3Heal.png",
      title: "Pro and Beautiful",
      subTitle: "Playing while chatting live",
    ),
    SignupAssets(
      imagePath: "assets/images/4Heal.png",
      title: "Carried by Pro Player",
      subTitle: "Always Win and get lots of Surprises in the game",
    ),
  ];

  Widget _buildPageView(
      double height, String title, String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          height: height * 0.50,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70, right: 70),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: _list_of_assets.length,
                  itemBuilder: (context, index) {
                    final asset = _list_of_assets[index];
                    return _buildPageView(
                      height,
                      asset.title,
                      asset.subTitle,
                      asset.imagePath,
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _list_of_assets.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    width: _currentIndex == index ? 12.0 : 8.0,
                    height: _currentIndex == index ? 12.0 : 8.0,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? Colors.blue
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                width: width * 0.85,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(27.5)),
                  gradient: LinearGradient(colors: [
                    Colors.purple.shade400,
                    Colors.purple.shade500,
                    Colors.purple.shade700
                  ])
                ),
                child: TextButton(
                  onPressed: () {
                    if (_currentIndex < _list_of_assets.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      
                    }
                  },
                  child: const Text("Next"),
                ),
              ),
              const SizedBox(height: 25.0),
            ],
          ),
        ),
      ),
    );
  }
}
