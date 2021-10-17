import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Checkpoints extends StatelessWidget {
  final int checkedTill;
  final List<String> checkpoints;
  final Color checkpointFilledColor;

  Checkpoints({this.checkedTill = 1, this.checkpoints, this.checkpointFilledColor,});

  final double circleDia = 32;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (c, s) {
      // one extra 32 for left and right padding to the checkpoint row

      final double cWidth = ((s.maxWidth - (32.0 * (checkpoints.length + 1))) /
          (checkpoints.length - 1));

    return Container(
    height: 56,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: checkpoints.map(
                (e) {
                  int index = checkpoints.indexOf(e);
                  print (index);
                  return Container(
                    height: circleDia,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: circleDia,
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 18,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index <= checkedTill
                              ? checkpointFilledColor
                                : checkpointFilledColor.withOpacity(0.2),
                          ),
                        ),
                        index != (checkpoints.length - 1)
                        ? Container (
                          color: index < checkedTill
                          ? checkpointFilledColor
                              : checkpointFilledColor.withOpacity(0.2),
                          height: 4,
                          width: cWidth,
                        )
                            : Container()
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: checkpoints.map(
                      (e) {
                        return Text(
                          e,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        );
                      },
              ).toList(),
            ),
          )
        ],
      ),
    );
    }
    );
  }
}