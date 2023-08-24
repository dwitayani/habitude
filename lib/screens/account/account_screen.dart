import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {},
        ),
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "account",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "TitanOne",
            fontSize: 35,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(28),
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              color: Colors.green,
              child: Text("Sign in"),
            )
          ],
        ),
      ),
    );
  }
}
