import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:smartlist/utils/Email.dart';
import 'package:smartlist/utils/Token.dart';
import 'dart:convert';

Future<List<Container>> getLists() async {
  List<Container> list = [];
  final token = await getToken();
  final email = await getEmail();
  final response = await http.get(
      "http://my-api.com/lists" as Uri,
  headers: {'Authorization': token!, "email": email!});
  if (response.statusCode == 200) {
    List<Map<String, dynamic>> data = jsonDecode(response.body);
    for (var i = 0; i < data.length; i++) {
      list.add(Container(
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
                            children: const [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Chap 1",
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
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
                          const Expanded(
                            flex: 1,
                            child: Text(
                              "22 Mar 2020",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
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
                            child: const Text(
                              "Leroy Merlin",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
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
  }
  return list;
}

List<Container> ProcessLists(Future<List<Container>> lists) {
  List<Container> list = [];
  lists.then((value) => list = value);
  return list;
}
