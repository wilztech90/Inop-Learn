import 'package:flutter/material.dart';

class TeacherUploadMaterial extends StatefulWidget {
  const TeacherUploadMaterial({super.key});

  @override
  State<TeacherUploadMaterial> createState() => _TeacherUploadMaterialState();
}

class _TeacherUploadMaterialState extends State<TeacherUploadMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const Text("Teacher Upload Material"),
      ),
    );
  }
}
