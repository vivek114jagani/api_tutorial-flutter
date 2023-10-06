// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  String errorMessage = "";
  String token = "";
  Future<void> logIn() async {
    isLoading = true;
    setState(() {});
    final response = await http.post(
      Uri.parse("https://reqres.in/api/login"),
      body: {"email": email.text, "password": password.text},
    );
    print(response.body);
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      errorMessage = "";
      isLoading = false;
      token = data['token'];
      print("Success");
      setState(() {});
    } else {
      isLoading = false;
      errorMessage = data["error"];

      print("Error");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(filled: true),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(filled: true),
            ),
            const SizedBox(
              height: 10,
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: () {
                      logIn();
                    },
                    child: const Text("LogIn")),
            const SizedBox(
              height: 10,
            ),
            Text(
              errorMessage.isEmpty ? token : errorMessage,
            ),
          ],
        ),
      ),
    );
  }
}
