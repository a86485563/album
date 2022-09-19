import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // 宣告 TabController
  TabController? tabController;

  final List<Tab> myTabs = const <Tab>[
    Tab(text: '4月'),
    Tab(text: '5月'),
    Tab(text: '6月'),
    Tab(text: '7月'),
    Tab(text: '8月'),
  ];

  @override
  void initState() {
    // 建立 TabController，vsync 接受的型態是 TickerProvider
    tabController = TabController(length: myTabs.length, vsync: this);
    super.initState();
  }

  Widget createMonthSection() {
    return Container(
      color: Colors.amber[800],
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: const Icon(Icons.keyboard_double_arrow_left),
          ),
          Expanded(child: createTabSection()),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: const Icon(Icons.keyboard_double_arrow_right),
          )
        ],
      ),
    );
  }

  Widget createTabSection() {
    return Container(
        child: Center(
      child: TabBar(
        tabs: myTabs,
        isScrollable: true,
        indicatorColor: Colors.red,
        labelColor: Colors.white,
        controller: tabController,
      ),
    ));
  }

  var yearSection = Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      color: Colors.red[800],
      child: const Padding(
        padding: EdgeInsets.all(5),
        child: Text('2018'),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Ablum App")),
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
              Expanded(
                  child: Container(
                    width: double.infinity,
                    child: TabBarView(controller: tabController, children: [
                      for (var i = 0; i < this.myTabs.length; i++)
                        TabContentImage(imgSrc: 'images/pavlova.jpg',year: '2018',month: '9',)
                    ]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class TabContentImage extends StatelessWidget {
  final String imgSrc;
  final String year;
  final String month;
  String? title = null;

  TabContentImage({
    Key? key,
    required this.imgSrc,
    required this.year,
    required this.month,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  SizedBox(
        width: double.infinity,
        height: 300,
        child:
        Card(
          elevation: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                width: double.infinity,
                height: 200,
              ),
              Row(
                children:  [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "June",
                      style: GoogleFonts.msMadi(
                        fontSize: 50,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  )

                ],
              )
            ],
          ),
        )
    );
  }
}

// Image.asset(
// 'images/pavlova.jpg',
// fit: BoxFit.cover,
// )