import 'package:flutter/material.dart';
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

class RowOrPageView extends StatefulWidget {
  final List<Widget> children;

  RowOrPageView({Key key, this.children}) : super(key: key);

  @override
  _RowOrPageViewState createState() => _RowOrPageViewState();
}

class _RowOrPageViewState extends State<RowOrPageView> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    if (mediaQuery.size.aspectRatio > 1) {
      return Row(
        children: widget.children,
      );
    } else {
      return Stack(
        children: [
          Positioned.fill(
            child: PageView(
              controller: _controller,
              children: widget.children,
            ),
          ),
          currentPage == widget.children.length - 1
              ? null
              : Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.chevron_right),
                      onPressed: () {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 333),
                          curve: Curves.easeInOutCubic,
                        );
                      },
                    ),
                  ),
                ),
          currentPage == 0
              ? null
              : Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.chevron_left),
                      onPressed: () {
                        _controller.previousPage(
                          duration: Duration(milliseconds: 333),
                          curve: Curves.easeInOutCubic,
                        );
                      },
                    ),
                  ),
                ),
        ].where((element) => element != null).toList(),
      );
    }
  }
}
