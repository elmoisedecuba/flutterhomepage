import 'package:flutter/material.dart';

// Import of external pages
import 'package:myapp/pages/first_page.dart';
import 'package:myapp/pages/second_page.dart';
import 'package:myapp/pages/third_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // This makes the selected button the second
  int bottomSelectedIndex = 1;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: new Icon(Icons.search), title: new Text('First Page')),
      BottomNavigationBarItem(
          icon: new Icon(Icons.home), title: new Text('Second Page')),
      BottomNavigationBarItem(
          icon: Icon(Icons.info_outline), title: Text('Third Page')),
    ];
  }

  PageController pageController = PageController(
    // This makes it start on the second page
    initialPage: 1,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        // This is where the pages are displayed
        _firstPage(),
        _secondPage(),
        _thirdPage(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}

// This is where the external pages are called
Widget _firstPage() {
  return FirstPage();
}

Widget _secondPage() {
  return SecondPage();
}

Widget _thirdPage() {
  return ThirdPage();
}
