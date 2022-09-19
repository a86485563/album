import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  final List<Tab> myTabs = const <Tab>[
    Tab(text: '4月'),
    Tab(text: '5月'),
    Tab(text: '6月'),
    Tab(text: '7月'),
    Tab(text: '8月'),
  ];

  Widget createMonthSection() {
    return Container(
      color: Colors.amber[800],
      child: Row(
        children: [
          Container(
            padding:  const EdgeInsets.fromLTRB(0,0,10,0),
            child: const Icon(Icons.keyboard_double_arrow_left) ,
          ),
          Expanded(child: createTabSection()) ,
          Container(
            padding:  const EdgeInsets.fromLTRB(10,0,0,0),
            child: const Icon(Icons.keyboard_double_arrow_right),
          )
        ],
      ),
    );
  }
 Widget createTabSection() {
   return DefaultTabController(
     length: myTabs.length,
     child: Container(
         child:
         Center(
           child: TabBar(
             tabs: myTabs,
             isScrollable: true,
             indicatorColor: Colors.red,
             labelColor: Colors.white,
           ),
         )
       ),
     );
 }

  var yearSection =
  Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      color: Colors.red[800],
      child: const Padding(
        padding: EdgeInsets.all(5),
        child: Text('2018'),)
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title :const Text( "My Ablum App")),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
          height: double.infinity,
          width: double.infinity,
          color: Colors.blue[800],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              yearSection,
              createMonthSection(),
              const Text("1234"),
              const Text("1234"),
            ],
          ),
        ),
      ),
    );
  }

}

class MyHomePage extends StatelessWidget {

  var yearSection =
   Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Text('2018'),)
  );


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title :const Text( "My Ablum App")),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
          height: double.infinity,
          width: double.infinity,
          color: Colors.blue[800],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SizedBox(
                child: yearSection,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
