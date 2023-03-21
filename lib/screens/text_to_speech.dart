import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const SpeechApp());
}

class SpeechApp extends StatelessWidget {
  const SpeechApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: Center(child: TextToSpeech())),
    );
  }
}

class TextToSpeech extends StatelessWidget {
  TextToSpeech({Key? key}) : super(key: key);
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textEditingController = TextEditingController();

  speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: textEditingController,
            ),
            ElevatedButton(
              child: const Text('Start text to speech'),
              onPressed: () => speak(textEditingController.text),
            )
          ],
        ),
      ),
    );
  }
}
