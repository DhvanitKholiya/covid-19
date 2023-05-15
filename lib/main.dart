import 'package:flutter/material.dart';

import 'finl.dart';
import 'helper/api.dart';
import 'models/castam.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const myapp(),
        'final': (context) => const final_page(),
      },
    ),
  );
}

class myapp extends StatefulWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid 19"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder(
        future: API.api.fetchCurrency(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            Covid? data = snapshot.data;

            return (data != null)
                ? Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: data.loc
                            .map((e) => Card(
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushNamed('final', arguments: e);
                                        },
                                        child: ListTile(
                                          title: Text("${e['loc']}"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  )
                : const Center(
                    child: Text("No Data"),
                  );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
