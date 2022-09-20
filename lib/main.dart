import 'dart:ffi';

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
        child: DecoratedBox(
      decoration: BoxDecoration(
        //This is for background color
        color: Colors.white.withOpacity(0.0),

        //This is for bottom border that is needed
        border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 2)),
      ),
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
    ));
  }

  Widget createTabSection() {
    return Container(
        child: Center(
      child: TabBar(
        tabs: myTabs,
        isScrollable: true,
        indicatorColor: Colors.red,
        labelColor: Colors.black,
        controller: tabController,
      ),
    ));
  }

  var yearSection = Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                    TabContentImage(
                      imgSrc: 'images/pavlova.jpg',
                      year: '2018',
                      month: '9',
                    )
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
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          image: const DecorationImage(
            image: AssetImage("images/dabanCastle.png"),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "June",
                      style: GoogleFonts.msMadi(
                          fontSize: 50,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      "2018",
                      style: GoogleFonts.msMadi(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "",
                        style: GoogleFonts.notoSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: 1),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

// Image.asset(
// 'images/pavlova.jpg',
// fit: BoxFit.cover,
// )
