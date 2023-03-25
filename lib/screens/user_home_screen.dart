import 'package:flutter/material.dart';
import 'package:inop_app/provider/auth_provider.dart';
import 'package:inop_app/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final auth_provider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text("INOP LEARN"),
            actions: [
              IconButton(
                onPressed: () {
                  auth_provider.userSignOut().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeScreen())));
                },
                icon: Icon(Icons.exit_to_app),
              )
            ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage:
                    NetworkImage(auth_provider.userModel.profilePic),
                radius: 50,
              ),
                          ),
              const SizedBox(height: 10),
              Text(auth_provider.userModel.name),
              Text(auth_provider.userModel.phoneNumber),
              Text(auth_provider.userModel.email),
              Text(auth_provider.userModel.bio),
            ],
            
          ),

        ));
  }
}
