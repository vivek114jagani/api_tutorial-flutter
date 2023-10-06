import 'package:flutter/material.dart';
import 'model/sample.dart';
import 'respository/user_REPO.dart';

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  Sample? sample;
  UserRepo userRepo = UserRepo();
  bool isLoading = true;

  @override
  void initState() {
    gettoData();
    super.initState();
  }

  void gettoData() async {
    sample = await userRepo.userData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "API calling Practice",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: sample!.entries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(sample!.entries[index].api),
                  subtitle: Text(sample!.entries[index].description),
                );
              },
            ),
    );
  }
}
