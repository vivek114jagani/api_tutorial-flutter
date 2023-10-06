import 'package:flutter/material.dart';
import 'model/my_data.dart';
import 'respository/data_call.dart';

class MyApi extends StatefulWidget {
  const MyApi({super.key});

  @override
  State<MyApi> createState() => _MyApiState();
}

class _MyApiState extends State<MyApi> {
  MyData? mydata;
  DataCall datacall = DataCall();
  bool isLoading = true;

  @override
  void initState() {
    calldata();
    super.initState();
  }

  void calldata() async {
    mydata = await datacall.datacall();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("This is new Api for You Good Practis"),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: mydata!.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "NATION : ",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            mydata!.data[index].nation,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        mydata!.data[index].idNation,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        mydata!.data[index].idYear.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        mydata!.data[index].year,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        mydata!.data[index].population.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
