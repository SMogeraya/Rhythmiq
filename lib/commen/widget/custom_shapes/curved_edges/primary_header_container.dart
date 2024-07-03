import 'package:flutter/material.dart';
import 'package:soul_tunes/commen/widget/custom_shapes/container/CircleContainer.dart';
import 'package:soul_tunes/commen/widget/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:soul_tunes/utils/constants/colors.dart';

class SPrimaryHeaderContainer extends StatelessWidget {
  const SPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container //the blue box
          (
              // height: 300,
              color: SColors.primary,
              padding: const EdgeInsets.all(0),
              child: Stack(children: [
                //stacking circles on blue box
                Positioned(
                    top: -150,
                    right: -250,
                    child: CircularContainer(
                        //Circles
                        backgroundColor: SColors.textWhite.withOpacity(0.1))),
                Positioned(
                  top: 100,
                  right: 300,
                  child: CircularContainer(
                      backgroundColor: SColors.textWhite.withOpacity(0.1)),
                ),
                child,
              ])),
    );
  }
}
