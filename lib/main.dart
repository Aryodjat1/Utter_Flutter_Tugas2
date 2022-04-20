import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Products',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(primarySwatch: Colors.blue, appBarTheme: AppBarTheme(color: Colors.white)),
      // A widget which will be started on application startup
      home: MyHomePage(title: 'Products'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  final List<String> stock = <String>[
    '3',
    '25',
    '17'
  ];
  final List<Color> color = <Color>[
    Colors.red,
    Colors.green,
    Colors.green
  ];

  void temp() {
    print('Whats New?');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title, style: TextStyle(color: Colors.blue)),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_bag_outlined, color: Colors.blue),
        ),
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(top: 30.0, right: 8.0, left: 8.0),
          itemCount: stock.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(top: 15),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: Colors.blueGrey[50],
              child: Column(children: <Widget>[
                ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1554866585-cd94860890b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YnJhbmR8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60",
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Column(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Brand New Beverage", maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Original", style: TextStyle(color: Colors.grey, fontSize: 10.0)),
                    )
                  ]),
                  subtitle: Container(margin: EdgeInsets.only(top: 10), child: Text('Stock: ' + stock[index], style: TextStyle(fontSize: 16, color: color[index]))),
                  trailing: Icon(
                    Icons.delete_forever_rounded,
                  ),
                  isThreeLine: true,
                ),
              ]),
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        label: Text('New Product'),
        icon: Icon(Icons.shopping_bag_rounded),
        onPressed: () => temp(),
      ),
    );
  }
}
