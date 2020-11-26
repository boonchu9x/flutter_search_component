import 'package:flutter/material.dart';
import 'package:flutter_search_compenent/search_component.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search main',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchData());
            },
          )
        ],
      ),
    );
  }
}
