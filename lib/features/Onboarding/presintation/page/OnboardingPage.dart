import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:versomarket/core/AppTheme.dart';
import 'package:versomarket/features/Registration/presintation/page/LoginPage.dart';
class OnboardingPage extends StatefulWidget {
  OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _introKey = GlobalKey<IntroductionScreenState>();
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 600,
        child: IntroductionScreen(
          // 2. Pass that key to the `IntroductionScreen` `key` param
          key: _introKey,
          pages: [
            PageViewModel(
                title: 'Page One',
                bodyWidget: Column(
                  children: [
                    Image.asset(
                      'assets/Images/Onboarding1.png'),
                    Text("Page One")
                  ],
                )),
            PageViewModel(
                title: 'Page Two',
                bodyWidget: Column(
                  children: [
                    Image.asset(
                      'assets/Images/Onboarding2.png'),
                    Text("page Two")
                  ],
                )),
            PageViewModel(
                title: 'Page Three',
                bodyWidget: Column(
                  children: [
                    Image.asset(
                      'assets/Images/Onboarding3.png'),
                    Text("Page Three")
                  ],
                )),
          ],
          done: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(border: Border.all(color: AppTheme.primaryColor,width: 5)),
            child: Text('Done'),
          ),
          showNextButton: false,
          showDoneButton: true,
          onDone: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void dispose() {
    super.dispose();
  }
}
