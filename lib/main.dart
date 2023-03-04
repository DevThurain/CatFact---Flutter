import 'package:catfacts/network/data/model/cat_fact_model.dart';
import 'package:catfacts/network/data/model/cat_fact_model_impl.dart';
import 'package:catfacts/network/data/vos/cat_fact_vo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String currentFact = "";
  bool isLoading = false;
  CatFactModel mCatFactModel = CatFactModelImpl();

  @override
  void initState() {
    super.initState();
    _getRamdomFact();
  }

  void _getRamdomFact() async {
    setState(() {
      isLoading = true;
    });
    CatFactVO catFact = await mCatFactModel.getRandomCatFact();
    setState(() {
      currentFact = catFact.fact ?? "no fact available";
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          currentFact,
          textAlign: TextAlign.center,
        ),
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _getRamdomFact();
        },
        label: const Text("Refresh"),
        icon: isLoading
            ? const SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ))
            : const SizedBox(),
      ),
    );
  }
}
