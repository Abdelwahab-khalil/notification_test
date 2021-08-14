import 'package:flutter/material.dart';
import 'package:notification/provider/may_know_provider.dart';
import 'package:notification/provider/request_provider.dart';
import 'package:notification/widgets/buttom_bar.dart';
import 'package:notification/widgets/follows.dart';
import 'package:provider/provider.dart';

import '../constantes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var follows = [];
  var followsSents = [];
  void getRequest() {
    follows = Provider.of<RequestProvider>(context, listen: false).confirms;
    followsSents = Provider.of<MayKnowProvider>(context, listen: false).follows;
  }

  void initState() {
    super.initState();
    getRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whith,
      bottomNavigationBar: BarMenu(),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                'Follows confirmed',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 15,
              ),
              for (int i = 0; i < follows.length; i++)
                FollowsWidget(follows[i]['name'], follows[i]['image'],
                    follows[i]['address'], () {
                  Provider.of<RequestProvider>(context, listen: false)
                      .deleteConfirm(follows[i]['address']);
                  getRequest();
                  setState(() {});
                }),
              Text(
                'Follows sent',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 15,
              ),
              for (int i = 0; i < followsSents.length; i++)
                FollowsWidget(followsSents[i]['name'], followsSents[i]['image'],
                    followsSents[i]['address'], () {
                  Provider.of<MayKnowProvider>(context, listen: false)
                      .delete(followsSents[i]['address']);
                  getRequest();
                  setState(() {});
                }),
            ],
          ),
        ),
      )),
    );
  }
}
