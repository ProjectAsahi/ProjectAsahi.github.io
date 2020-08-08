import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projectasahi/utils/optionalExpanded.dart';
import 'package:projectasahi/utils/standard_padding.dart';
import 'package:projectasahi/widgets/app_bar.dart';
import 'package:projectasahi/widgets/character_container.dart';
import 'package:projectasahi/widgets/fade_in.dart';
import 'package:projectasahi/widgets/footer.dart';
import 'package:projectasahi/widgets/media_card.dart';
import 'package:projectasahi/widgets/platform_aware_asset_image.dart';
import 'package:projectasahi/widgets/row_or_column.dart';
import 'package:projectasahi/widgets/top_menu.dart';

class HomeScene extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final standardPadding = calcStandardPadding(context);
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      endDrawer: AppDrawer(),
      body: Scrollbar(
        child: CustomScrollView(
          controller: _controller,
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(
                  left: standardPadding * 2,
                  right: standardPadding * 2,
                  top: standardPadding,
                  bottom: standardPadding),
              sliver: SliverToBoxAdapter(
                child: AppBarWidget(),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: standardPadding * 2),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 1280,
                    ),
                    child: RowOrColumn(
                      children: [
                        optionalExpanded(
                          context,
                          _HomeBannerCard(
                            delay: 0.5,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: standardPadding,
                                right: standardPadding,
                                top: standardPadding,
                              ),
                              child: Column(
                                children: [
                                  // Padding(
                                  //   padding: EdgeInsets.only(
                                  //       bottom: standardPadding / 2.0),
                                  //   child: PlatformAwareAssetImage(
                                  //     asset: 'trap.webp',
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: PlatformAwareAssetImage(
                                      alignment: Alignment.bottomCenter,
                                      asset: mediaQuery.size.width > 3840
                                          ? 'cover.webp'
                                          : 'cover_sm.webp',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        optionalExpanded(
                          context,
                          Padding(
                            padding: EdgeInsets.only(left: 32),
                            child: DefaultTextStyle(
                              style: (mediaQuery.size.width > 480
                                      ? Theme.of(context).textTheme.headline1
                                      : Theme.of(context).textTheme.headline2)
                                  .copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .color),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "//",
                                  ),
                                  Text(
                                    "性別の",
                                  ),
                                  Text(
                                    "いたずら",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.chevron_left,
                  size: 48,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(),
              sliver: SliverToBoxAdapter(
                child: FadeIn(
                  delay: 2,
                  translateY: 100,
                  child: ParallaxWidget(
                    width: mediaQuery.size.width,
                    controller: _controller,
                    height: mediaQuery.size.height * 0.7,
                    actualHeight: mediaQuery.size.height,
                    builder: (context, align) {
                      return PlatformAwareAssetImage(
                        fit: BoxFit.cover,
                        alignment: align,
                        asset: mediaQuery.size.width > 1280
                            ? 'vt.webp'
                            : 'vt_sm.webp',
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(),
              sliver: SliverToBoxAdapter(
                child: DefaultTextStyle(
                  style: (mediaQuery.size.width > 480
                          ? Theme.of(context).textTheme.headline2
                          : Theme.of(context).textTheme.headline3)
                      .copyWith(
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "//",
                      ),
                      Text(
                        "What you see",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Is NOT what you think",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                  horizontal: standardPadding, vertical: standardPadding * 2),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 1280),
                    child: CharacterContainer(),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                  left: standardPadding, right: standardPadding),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 1280),
                    child: Column(
                      children: [
                        Text(
                          'Social',
                          style: Theme.of(context).textTheme.headline2.copyWith(
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                              ),
                        ),
                        SizedBox(height: 16),
                        RowOrColumn(
                          children: [
                            MediaCard(
                              icon: 'bilibili.png',
                              title: "高垣朝陽",
                              type: "Bilibili",
                              link: 'https://space.bilibili.com/146407',
                            ),
                            MediaCard(
                              icon:
                                  'https://img.icons8.com/color/100/000000/weibo.png',
                              title: "@高垣朝陽Official",
                              type: "Weibo",
                              link: 'https://weibo.com/AsahiTakagaki',
                            ),
                            MediaCard(
                              icon:
                                  'https://img.icons8.com/fluent/100/000000/discord-new-logo.png',
                              title: "ProjectAsahi",
                              type: "Discord",
                              link: 'https://discord.gg/jT5qSu9',
                            ),
                            MediaCard(
                              icon:
                                  'https://img.icons8.com/color/100/000000/qq.png',
                              title: "ProjectAsahi吹水群",
                              type: "QQ: 376285366",
                              link: 'https://jq.qq.com/?_wv=1027&k=KJ2uzO6J',
                            ),
                          ].map((e) => optionalExpanded(context, e)).toList(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 32, top: 32),
              sliver: SliverToBoxAdapter(
                child: FooterWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeBannerCard extends StatelessWidget {
  final Widget child;
  final double delay;

  const _HomeBannerCard({Key key, this.child, this.delay = 0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: delay,
      translateY: 100,
      child: AspectRatio(
        aspectRatio: 10 / 9,
        child: Card(
          child: child,
        ),
      ),
    );
  }
}

class ParallaxWidget extends StatefulWidget {
  final ScrollController controller;
  final double height;
  final double actualHeight;
  final double offset;
  final double width;
  final Widget Function(BuildContext context, Alignment alignment) builder;

  const ParallaxWidget({
    Key key,
    @required this.controller,
    @required this.height,
    @required this.actualHeight,
    @required this.builder,
    this.offset,
    this.width,
  }) : super(key: key);
  @override
  _ParallaxWidgetState createState() => _ParallaxWidgetState();
}

class _ParallaxWidgetState extends State<ParallaxWidget> {
  Alignment _alignment = Alignment.topCenter;

  @override
  void initState() {
    super.initState();
    _alignment = calcAlign();
    widget.controller.position.addListener(() {
      setState(() {
        _alignment = calcAlign();
      });
    });
  }

  Alignment calcAlign() {
    Alignment alignment;
    if (widget.controller.position.axis == Axis.vertical) {
      double value =
          (widget.controller.offset / widget.actualHeight - 1).clamp(-1.0, 1.0);
      alignment = new Alignment(0.0, value);
    } else {
      double value =
          (widget.controller.offset / widget.actualHeight - 1).clamp(-1.0, 1.0);
      alignment = new Alignment(value, 0.0);
    }
    return alignment;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Align(
        child: SizedBox(
          width: widget.width,
          height: widget.actualHeight,
          child: widget.builder(context, _alignment),
        ),
      ),
    );
  }
}
