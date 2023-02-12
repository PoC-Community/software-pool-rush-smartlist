import 'package:flutter/material.dart';
import 'package:smartlist/pages/LoginScreen.dart';
import 'package:smartlist/pages/RegisterScreen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            ///***If you have exported images you must have to copy those images in assets/images directory.
            Image(
              image: const AssetImage("assets/images/home_background.png"),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: const Alignment(0.0, 0.6),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 16, 16, 80),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                              },
                              color: const Color(0xffffd200),
                              elevation: 30,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                              padding: const EdgeInsets.all(16),
                              textColor: const Color(0xff2e2e2e),
                              height: MediaQuery.of(context).size.height * 0.08,
                              minWidth: MediaQuery.of(context).size.width * 0.8,
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                            },
                            color: const Color(0xffffffff),
                            elevation: 30,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            padding: const EdgeInsets.all(16),
                            textColor: const Color(0xff2e2e2e),
                            height: MediaQuery.of(context).size.height * 0.08,
                            minWidth: MediaQuery.of(context).size.width * 0.8,
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Align(
                alignment: Alignment(0.0, -0.1),
                child: Text(
                  "Organize your shopping",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Simplify your life",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
