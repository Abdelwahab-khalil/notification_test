import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
  final text;
  final image;
  final widget;
  final color;
  NotificationWidget(this.text, this.image, this.widget, this.color);
  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 80,
              width: width * 0.85,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(40.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset(widget.image),
                  Container(
                    width: width * 0.45,
                    child: Text(
                      widget.text,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                    ),
                  ),
                  widget.widget
                ],
              ),
            ),
            CircleAvatar(
              backgroundColor: widget.color,
              radius: 8,
            ),
          ],
        ),
        SizedBox(height: 15)
      ],
    );
  }
}
