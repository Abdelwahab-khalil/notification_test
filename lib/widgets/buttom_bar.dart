import 'package:flutter/material.dart';
import 'package:notification/constantes.dart';
import 'package:notification/pages/home.dart';
import 'package:notification/pages/notifications.dart';
import 'package:image_picker/image_picker.dart';

class BarMenu extends StatefulWidget {
  @override
  _BarMenuState createState() => _BarMenuState();
}

class _BarMenuState extends State<BarMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()));
              },
              child: Icon(
                Icons.home_outlined,
                size: 30,
                color: Colors.grey[700],
              )),
          Icon(
            Icons.search_outlined,
            size: 30,
            color: Colors.grey[700],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () async {
                  await ImagePicker().getImage(
                    source: ImageSource.camera,
                    maxWidth: 1800,
                    maxHeight: 1800,
                  );
                },
                child: Image.asset('assets/camera.png')),
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => NotificationPage()));
              },
              child: Icon(
                Icons.notifications_outlined,
                size: 30,
                color: blue,
              )),
          Container(height: 17, child: Image.asset('assets/pic8.png')),
        ],
      ),
    );
  }
}
