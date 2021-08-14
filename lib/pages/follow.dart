import 'package:flutter/material.dart';
import 'package:notification/constantes.dart';
import 'package:notification/provider/may_know_provider.dart';
import 'package:notification/provider/request_provider.dart';
import 'package:notification/services/notification_service.dart';
import 'package:notification/widgets/buttom_bar.dart';
import 'package:notification/widgets/may_know.dart';
import 'package:notification/widgets/requests.dart';
import 'package:provider/provider.dart';

class FollowPage extends StatefulWidget {
  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {
  var requests = [];
  var mayKnow = [];
  void getRequest() {
    requests = Provider.of<RequestProvider>(context, listen: false).requests;
    mayKnow = Provider.of<MayKnowProvider>(context, listen: false).mayKnow;
  }

  void initState() {
    super.initState();
    getRequest();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.arrow_back),
                    Text(
                      'Follow requests',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: width,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/follows2.png'),
                      Text('Invite & Find your friends'),
                      Container(
                          height: 25,
                          width: 55,
                          decoration: BoxDecoration(
                              color: red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Center(
                              child: Text(
                            'Import',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                for (int i = 0; i < requests.length; i++)
                  RequestWidget(requests[i]['name'], requests[i]['image'],
                      requests[i]['address'], () {
                    Provider.of<RequestProvider>(context, listen: false)
                        .confirm(requests[i]['address']);
                    getRequest();
                    setState(() {});
                  }, () {
                    Provider.of<RequestProvider>(context, listen: false)
                        .delete(requests[i]['address']);
                    getRequest();
                    setState(() {});
                  }),
                Text('You May know',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 20,
                ),
                for (int i = 0; i < mayKnow.length; i++)
                  MayKnowWidget(mayKnow[i]['name'], mayKnow[i]['image'],
                      mayKnow[i]['address'], () async {
                    Provider.of<MayKnowProvider>(context, listen: false)
                        .follow(mayKnow[i]['address'])
                        .then((value) {
                      getRequest();
                      setState(() {});
                    });
                  }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
