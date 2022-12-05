import 'package:flutter/material.dart';
import 'dart:math';
import 'favorites.dart';
import 'cart.dart';

final _randomvar = new Random();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo pt 2',
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
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'E CART'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _list = 13;

  void _randomizeList() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _listLength without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _list = _randomvar.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _randomizeList method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 25, 98),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => cart()));
              },
              child: Icon(
                Icons.shopping_bag,
                size: 26.0,
              ),
            ),
          ),
        ],

        // child: Text('Cart'),
      ),

      body: SafeArea(
        child: Column(
          //  PageView(
          //   children: [
          //     Container(
          //       color: Colors.indigo,
          //     ),
          //     Container(
          //       color: Colors.red,
          //     )
          //   ],
          // ),
          // BottomNavigationBar(

          //   items: [
          //     BottomNavigationBarItem(
          //       icon: const Icon(Icons.shopping_bag)
          //     )
          //   ]
          // ),

          children: [
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 100,
                    height: 50,
                    color: Colors.amberAccent,
                    child: ListTile(
                      //return ListTile(
                      leading: const Icon(Icons.arrow_back_ios_new),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.shopping_bag),
                                  const Text("trial")
                                ]),
                          ),
                        ],
                      ),

                      // subtitle: const Text("hi"),
                      title: Text(
                        "${index + 1}",
                      ),
                    ),
                  );
                },
              ),
            ), //
          ],
        ),
      ),

      // Column(
      //   children: [
      //     PageView(
      //       children: [
      //         Container(
      //           color: Colors.indigo,
      //         ),
      //         Container(
      //           color: Colors.red,
      //         ),
      //       ],
      //     ),
      //   ],
      // ),

      // bottomNavigationBar: BottomNavigationBar(
      //     items: [BottomNavigationBarItem(icon: Icon(Icons.home))]),

      bottomNavigationBar: Container(
        height: 60,
        color: Color.fromARGB(180, 6, 1, 1),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => favorites()));
          },
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.favorite,
                  color: Colors.deepPurple,
                ),
                Text(
                  'favorites',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        //onPressed: _randomizeList,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => favorites()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.favorite,
          size: 30,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.symmetric(),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text(
                'Sign In Page',
                style: TextStyle(fontSize: 27),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      // PageView(
      //         children: [
      //         Container(
      //           color: Colors.indigo,
      //         ),
      //         Container(
      //           color: Colors.red,
      //         ),
      //       ],
    ); // ),

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}

// @override
// Widget build(BuildContext context) {
//   final PageController controller = PageController();
//   return PageView(
//     /// [PageView.scrollDirection] defaults to [Axis.horizontal].
//     /// Use [Axis.vertical] to scroll vertically.
//     controller: controller,
//     children: const <Widget>[
//       Center(
//         child: Text('First Page'),
//       ),
//       Center(
//         child: Text('Second Page'),
//       ),
//       Center(
//         child: Text('Third Page'),
//       ),
//     ],
//   );
// }

