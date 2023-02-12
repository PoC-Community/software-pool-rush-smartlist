import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smartlist/pages/CurrentScreen.dart';

class ShopsScreen extends StatefulWidget {
  @override
  State<ShopsScreen> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2e2e2e),
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff262626),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "All lists",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xffffd200),
          ),
        ),
        actions: [
          Icon(Icons.search, color: Color(0xffffd200), size: 22),
        ],
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CurrentScreen()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopsScreen()),
            );
          }
        },
      ),
      body: GridView(
        padding: EdgeInsets.all(16),
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.3,
        ),
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Color(0xff636262),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Color(0x4d9e9e9e), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Leclerc",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Color(0xffffac00),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text(
                    "1 items",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
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
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Color(0xff636262),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Color(0x4d9e9e9e), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Casino",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Color(0xffffac00),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text(
                    "2 items",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
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
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Color(0xff636262),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Color(0x4d9e9e9e), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Casto",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Color(0xffffac00),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text(
                    "1 items",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
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
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Color(0xff636262),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Color(0x4d9e9e9e), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "XD",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Color(0xffffac00),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text(
                    "2 items",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
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
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Color(0xff636262),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Color(0x4d9e9e9e), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Lorem",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Color(0xffffac00),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text(
                    "1 items",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
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
        ],
      ),
    );
  }
}
