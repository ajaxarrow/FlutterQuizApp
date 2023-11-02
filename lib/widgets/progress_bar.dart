import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatelessWidget {
  const AnimatedProgressBar({
    required this.value,
    this.height = 20,
    super.key
  });

  final double value;
  final double height;

  _floor(double value, [min = 0.0]){
    return value.sign <= min ? min : value;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints box ){
          return Container(
            padding: const EdgeInsets.all(6),
            width: box.maxWidth,
            child: Stack(
              children: [
                Container(
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.all(Radius.circular(height)
                    )
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOutCubic,
                  height: height,
                  width: box.maxWidth * _floor(value),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(height)
                    ),
                  )
                )
              ],
            ),
          );
        }
    );
  }
}


