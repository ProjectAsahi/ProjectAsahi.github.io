import 'package:flutter/widgets.dart';

class RowOrColumn extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline textBaseline;

  const RowOrColumn({
    Key key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.children,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    if (mediaQuery.size.aspectRatio > 1) {
      return Row(
        children: children,
        mainAxisAlignment: this.mainAxisAlignment,
        mainAxisSize: this.mainAxisSize,
        crossAxisAlignment: this.crossAxisAlignment,
        textDirection: this.textDirection,
        verticalDirection: this.verticalDirection,
        textBaseline: this.textBaseline,
      );
    } else {
      return Column(
        children: children,
        mainAxisAlignment: this.mainAxisAlignment,
        mainAxisSize: this.mainAxisSize,
        crossAxisAlignment: this.crossAxisAlignment,
        textDirection: this.textDirection,
        verticalDirection: this.verticalDirection,
        textBaseline: this.textBaseline,
      );
    }
  }
}
