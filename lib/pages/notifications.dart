import 'package:flutter/material.dart';
import 'package:notification/constantes.dart';
import 'package:notification/pages/follow.dart';
import 'package:notification/provider/request_provider.dart';
import 'package:notification/widgets/buttom_bar.dart';
import 'package:notification/widgets/notification_widget.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  var requests = 11;
  void getRequest() {
    requests =
        (Provider.of<RequestProvider>(context, listen: false).requests).length;
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
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Notifications',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                            color: blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          FollowPage()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset('assets/follows1.png'),
                                Text(
                                  '$requests',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text('Today',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 10,
                ),
                NotificationWidget(
                    'Catherine Doe Invited you to Check Cabestan',
                    'assets/pic1.png',
                    Text(
                      '1m ago',
                      style: TextStyle(color: Colors.grey),
                    ),
                    blue),
                NotificationWidget(
                    'You earned 150 points this week. Keep it Up!',
                    'assets/point1.png',
                    Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                            color: red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Center(
                            child: Text(
                          'check',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ))),
                    red),
                NotificationWidget(
                    'John Legend Added one of your EQOES to her To Discover List',
                    'assets/pic2.png',
                    Text(
                      '1m ago',
                      style: TextStyle(color: Colors.grey),
                    ),
                    blue),
                NotificationWidget(
                    'You just redeemed a gifts from Starbucks',
                    'assets/gift.png',
                    Text(
                      '1m ago',
                      style: TextStyle(color: Colors.grey),
                    ),
                    blue),
                NotificationWidget(
                    'Julia Andreson Invited you to Check Cabestan',
                    'assets/pic3.png',
                    Text(
                      '1m ago',
                      style: TextStyle(color: Colors.grey),
                    ),
                    whith),
                Text('Yesterday',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 10,
                ),
                NotificationWidget(
                    'Darell Steward Accpeted your follow request',
                    'assets/pic4.png',
                    Text(
                      '1m ago',
                      style: TextStyle(color: Colors.grey),
                    ),
                    blue),
                NotificationWidget(
                    'Congratulations! you are a Brilliant Magnet now',
                    'assets/Levels.png',
                    Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                            color: purple,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Center(
                            child: Text(
                          'check',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ))),
                    purple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
