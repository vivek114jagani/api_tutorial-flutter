import 'package:api_calling/model/user_model.dart';
import 'package:api_calling/respository/get_user_repo.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserDataModel? userDataModel;
  GetUserRepo getUserRepo = GetUserRepo();
  bool isLoading = true;
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    userDataModel = await getUserRepo.getUserData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: userDataModel!.country.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    userDataModel!.country[index].countryId,
                  ),
                  subtitle: Text(
                    userDataModel!.country[index].probability.toString(),
                  ),
                );
              },
            ),
    );
  }
}
