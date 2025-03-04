import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:versomarket/features/Home/presintation/page/HomePage.dart';
import 'package:versomarket/features/Registration/presintation/page/LoginPage.dart';
import 'core/util/common.dart';
import 'features/Onboarding/presintation/page/OnboardingPage.dart';
import 'injection_container.dart' as object;

late final String token;
late bool seenOnboarding;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await object.init();
  token = await getCachedData(key: "token", retrievedDataType: String, returnType: "") ?? "";

  final prefs = await SharedPreferences.getInstance();
  seenOnboarding = prefs.getBool("seenOnboarding") ?? false;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: (seenOnboarding || token.isNotEmpty) ? (token.isEmpty ? LoginPage() : homePage()) : OnboardingPage(),
    );
  }
}
