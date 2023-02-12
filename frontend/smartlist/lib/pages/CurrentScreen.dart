import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smartlist/pages/CreateList.dart';
import 'package:smartlist/pages/ShopsScreen.dart';
import 'package:smartlist/utils/Email.dart';
import 'package:smartlist/utils/Token.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrentScreen extends StatefulWidget {
  @override
  State<CurrentScreen> createState() => _CurrentScreenState();
}

class _CurrentScreenState extends State<CurrentScreen> {
  List<Container> listslist = [];

  @override
  void initState() {
    super.initState();
    _getLists();
  }

  Future<void> _getLists() async {
    final token = await getToken();
    final email = await getEmail();
    final response = await http.get(
        Uri.http('51.159.159.151:3000', '/lists'),
        headers: {'Authorization': token!, "email": email!});
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> data = [];
      data = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      for (var i = 0; i < data.length; i++) {
        listslist.add(Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xff636262),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12.0),
            border:
            Border.all(color: const Color(0xffffd200), width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Icon(
                Icons.article,
                color: Color(0xffffd200),
                size: 50,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    data[i]["name"],
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.more_horiz,
                            color: Color(0xff212435),
                            size: 20,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            0, 4, 0, 0),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                             Expanded(
                              flex: 1,
                              child: Text(
                                data[i]["date"],
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                            Container(
                              margin:
                              const EdgeInsets.fromLTRB(
                                  8, 0, 0, 0),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              decoration: BoxDecoration(
                                color: const Color(0x4dffd200),
                                shape: BoxShape.rectangle,
                                borderRadius:
                                BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                data[i]["shop"],
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        );
      }
    } else {
      throw Exception('Failed to load lists');
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
          "Current",
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
        selectedIndex: 0,
        onTabChange: (index) {
          if (index == 0) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CurrentScreen()));
          } else if (index == 1) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShopsScreen()));
          }
        },
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ListView(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    children: [
                      ...listslist,
                    ]
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.8, 0.8),
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.2,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.1,
              decoration: BoxDecoration(
                color: const Color(0xffffd200),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
              ),
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateList()));
                },
                color: const Color(0xff000000),
                iconSize: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
