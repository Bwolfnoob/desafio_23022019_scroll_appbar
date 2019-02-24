import 'package:desafio_23022019_scroll_appbar/custom-appbar.dart';
import 'package:scroll_appbar/scroll_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _controller;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollAppBar(
        title: Text("Flutterando Bwolf"),
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text("Aa"),
            padding: EdgeInsets.only(right: 20),
          ),
          Icon(
            FontAwesomeIcons.share,
            size: 16,
          ),
          SizedBox(
            width: 30,
          )
        ],
        leading: Icon(Icons.arrow_back),
        backgroundColor: MaterialColor(
          0xFF000000,
          <int, Color>{
            600: Color(0xFFcc000000),
          },
        ),
        controller: _controller,
      ),
      // appBar: CustomAppbar(scrollController: _controller),
      body: ListView.builder(
        controller: _controller,
        itemCount: 100,
        itemBuilder: (context, index) => ListTile(title: Text("Item $index")),
      ),
    );
  }
}
