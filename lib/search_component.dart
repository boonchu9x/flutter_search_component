import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchData extends SearchDelegate<String> {
  final List listName = [
    "Adams",
    "Baker",
    "Clark",
    "Davis",
    "Evans",
    "Frank",
    "Ghosh",
    "Hills",
    "Irwin",
    "Jones",
    "Klein",
    "Lopez",
    "Mason",
    "Nalty",
    "Ochoa",
    "Patel",
    "Quinn",
    "Reily",
    "Smith",
    "Trott",
    "Usman",
    "Valdo",
    "White",
    "Xiang",
    "Yakub",
    "Zafar"
  ];

  final List lsRecentlyName = ["Mason", "Nalty", "Ochoa", "Patel"];

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions clear text in search

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {},
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the appbar search

    return IconButton(
      //Icon back với hiệu ứng động
      icon: AnimatedIcon(
        semanticLabel: 'back',
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some result based on the selection

    //only show character search
    return Center(
      child: Text(
        query,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone search for something

    //if query text empty to show list recently search
    final List lsSuggestName = query.isEmpty
        ? lsRecentlyName
        : listName.where((element) => element.startsWith(query)).toList();

    //return show list
    return ListView.builder(
      scrollDirection: Axis.vertical, //vertical scroll
      itemCount: lsSuggestName.length,
      itemBuilder: (context, index) => ListTile(
        //icon leading
        leading: Icon(Icons.person),

        //text name bold query text and normal text in word
        title: RichText(
          //bold query text
          text: TextSpan(
              text: lsSuggestName[index].substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
              ),

              //normal word
              children: [
                TextSpan(
                  text: lsSuggestName[index].substring(query.length),
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                  ),
                ),
              ]),
        ),

        //icon last item
        trailing: Container(
          child: Icon(Icons.phone),
        ),

        //call funtion showResult
        onTap: () {
          showResults(context);
        },
      ),
    );
  }
}
