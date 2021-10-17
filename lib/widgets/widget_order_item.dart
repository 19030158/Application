import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetOrderItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Divider(color: Colors.grey,),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconText(Icon(Icons.edit, color: Colors.redAccent),
                Text(
                  "Order ID",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Text("")
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconText(Icon(Icons.edit, color: Colors.redAccent),
                Text(
                  "Order Date",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Text("")
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            flatButton(
              Row(
                children: [
                  Text("Order Details"),
                  Icon(Icons.chevron_right),
                ],
              ),
              Colors.green,
                () {},
            )
          ],
          )
        ],
      ),
    );
  }

  Widget iconText(Icon iconWidget, Text textWidget) {
    return Row(children: [iconWidget, SizedBox(width: 5,), textWidget],
    );
  }

  Widget flatButton(Widget iconText, Color color, Function onPressed) {
    return FlatButton(
      child: iconText,
      onPressed: onPressed,
      padding: EdgeInsets.all(5),
      color: color,
      shape:StadiumBorder(),
    );
  }
}
