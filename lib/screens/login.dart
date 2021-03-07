// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('graphic/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(80.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome Google  Welfare',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 40,
                        fontFamily: 'Open Sans',
                        color: Colors.grey[800],
                      )),
                  Center(
                    child: Text('Touch the World',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          fontFamily: 'Open Sans',
                          color: Colors.black87,
                        )),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle:
                          TextStyle(fontSize: 20.0, color: Colors.brown[900]),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle:
                          TextStyle(fontSize: 20.0, color: Colors.brown[900]),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    child: Text('ENTER'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/map');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen[900],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
