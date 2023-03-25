import 'package:flutter/material.dart';
import 'package:inop_app/widgets/custome_button.dart';
import 'package:inop_app/screens/register_screen.dart';
import 'package:inop_app/provider/auth_provider.dart';
import 'package:inop_app/provider/teacherauth_provider.dart';
import 'package:provider/provider.dart';
import 'package:inop_app/screens/user_home_screen.dart';
import 'package:inop_app/screens/teacher_home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final auth_provider = Provider.of<AuthProvider>(context, listen: false);
    final teacherauth_provider =
        Provider.of<TeacherAuthProvider>(context, listen: false);
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/image1.jpg",
            height: 300,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Let's get Started",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Never a better time than now to start",
            style: TextStyle(
              fontSize: 22,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          // Custom button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: CustomButton(
              onPressed: () async {
                if (auth_provider.isSignedIn == true) {
                  await auth_provider
                      .getDataFromSharedPreference()
                      .whenComplete(
                        () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        ),
                      );
                } else if (teacherauth_provider.isSignedIn == true) {
                  await teacherauth_provider
                      .getTeacherDataFromSharedPreference()
                      .whenComplete(
                        () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TeacherHomeScreen(),
                          ),
                        ),
                      );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                }
              },
              text: "Get Started",
            ),
          )
        ],
      ),
    ))));
  }
}
