import 'package:flutter/material.dart';
import 'package:notification/constantes.dart';

class RequestWidget extends StatefulWidget {
  final name;
  final image;
  final address;
  final confirm;
  final delete;
  RequestWidget(this.name, this.image, this.address, this.confirm,this.delete);
  @override
  _RequestWidgetState createState() => _RequestWidgetState();
}

class _RequestWidgetState extends State<RequestWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: 80,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset(widget.image),
                Container(
                  width: width * 0.35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.address,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: widget.confirm,
                  child: Container(
                    width: 65,
                    height: 30,
                    decoration: BoxDecoration(
                        color: blue, borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                InkWell(
                  onTap: widget.delete,
                  child: Text(
                    'Delete',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w800),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 15)
      ],
    );
  }
}
