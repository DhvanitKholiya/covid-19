import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const final_page(),
    },
  ));
}

class final_page extends StatefulWidget {
  const final_page({Key? key}) : super(key: key);

  @override
  State<final_page> createState() => _final_pageState();
}

class _final_pageState extends State<final_page> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("${data['loc']}"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 20)),
          Center(
              child: Text(
            "${data['loc']}",
            style: const TextStyle(
              fontSize: 20,
            ),
          )),
          const Card(
            child: Text(
              "Covid_19 All Data",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 50)),
          Container(
            width: 320,
            height: 300,
            decoration:  BoxDecoration(
              color: Colors.blueGrey.shade200,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Confirmed CasesIndian:${data['confirmedCasesIndian']}",
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Confirmed CasesForeign:${data['confirmedCasesForeign']}",
                    style: const TextStyle(color: Colors.black, fontSize: 19),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Discharged:${data['discharged']}",
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Deaths:${data['deaths']}",
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Total Confirmed:${data['totalConfirmed']}",
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
