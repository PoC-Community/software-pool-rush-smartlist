import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smartlist/pages/CurrentScreen.dart';
import 'package:http/http.dart' as http;
import '../utils/Email.dart';
import '../utils/Token.dart';
import 'dart:convert';

class ShopsScreen extends StatefulWidget {
  @override
  State<ShopsScreen> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  List<Container> shopslist = [];

  @override
  void initState() {
    super.initState();
    _getShops();
  }

  Future<void> _getShops() async {
    final token = await getToken();
    final email = await getEmail();
    final response = await http.get(
        Uri.http('51.159.159.151:3000', '/lists/shops'),
        headers: {'Authorization': token!, "email": email!});
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> data = [];
      data = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      for (var i = 0; i < data.length; i++) {
        shopslist.add(Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: const Color(0xff636262),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data[i]["name"],
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: Color(0xffffac00),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(
                  data[i]["count"] + " items",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ],
          ),
        ),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2e2e2e),
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff262626),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: const Text(
          "All lists",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xffffd200),
          ),
        ),
      ),
      bottomNavigationBar: GNav(
        rippleColor: const Color(0xffffd200),
        hoverColor: const Color(0xffffd200),
        gap: 8,
        activeColor: const Color(0xf5ffd200),
        backgroundColor: const Color(0xff262626),
        iconSize: 35,
        duration: const Duration(milliseconds: 800),
        tabBackgroundColor: const Color(0xff636262),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        color: const Color(0xff000000),
        tabs: const [
          GButton(
            icon: Icons.update,
            textSize: 20,
            text: 'Current',
          ),
          GButton(
            icon: Icons.list,
            text: 'All',
            textSize: 20,
          ),
        ],
        selectedIndex: 1,
        onTabChange: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 1) {
          }},
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.3,
        ),
        children: [
          ...shopslist,
        ],
      ),
    );
  }
}

