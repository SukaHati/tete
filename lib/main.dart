import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _itemAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("Hello", style: TextStyle(color: Colors.purple, fontSize: 40),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  Text("Need something?"),
                  Image.network("https://d1eipm3vz40hy0.cloudfront.net/images/AMER/types-of-customer-service-channels.png"),
                  Text("You can find something here!"),
                  Image.asset("assets/chess.png"),
                  Text("\"Do you like the chess?\"", style: TextStyle( fontStyle: FontStyle.italic)),
                  Text("Number of items: $_itemAmount"),
                  TextButton(onPressed: (){
                    //Refresh UI
                    setState(() {
                      _itemAmount += 1;
                    });
                  }, child: Text("Get item", style: TextStyle(backgroundColor: Colors.white, color: Colors.blue),)),
                  TextButton(onPressed: (){
                    // Refresh UI and decrease number of items
                    setState(() {
                      _itemAmount -= 1;
                    });
                  }, child: Text("Remove item", style: TextStyle(backgroundColor: Colors.white, color: Colors.red))),
                  TextButton(onPressed: (){
                    setState(() {
                      _itemAmount = 0;
                    });
                  }, child: Text("No item", style: TextStyle(backgroundColor: Colors.black, color: Colors.white)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}
