import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projectasahi/utils/optionalExpanded.dart';
import 'package:projectasahi/widgets/app_bar.dart';
import 'package:projectasahi/widgets/fade_in.dart';
import 'package:projectasahi/widgets/footer.dart';
import 'package:projectasahi/widgets/media_card.dart';
import 'package:projectasahi/widgets/platform_aware_asset_image.dart';
import 'package:projectasahi/widgets/row_or_column.dart';

class HomeScene extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final standardPadding = mediaQuery.size.width > 480 ? 32.0 : 8.0;
    return Scaffold(
      endDrawer: Drawer(),
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
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: standardPadding / 2.0),
                                    child: PlatformAwareAssetImage(
                                      asset: 'trap.webp',
                                    ),
                                  ),
                                  Expanded(
                                    child: PlatformAwareAssetImage(
                                      alignment: Alignment.bottomCenter,
                                      asset: 'cover.webp',
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
                        asset: 'unknown.png',
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
                        "What you seeing",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Is NOT what you thinking",
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
                          'Keep in touch',
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

class CharacterContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return Container(
      height: query.size.height * 0.75,
      child: RowOrPageView(
        children: [
          _CharacterItem(
            visual: 'Asahi/main_visual.webp',
            title: '高垣朝陽',
            color: Colors.teal,
            id: 'Asahi',
          ),
          _CharacterItem(
            visual: 'Tesla/main_visual.webp',
            title: 'Tesla',
            color: Colors.purple,
            id: 'Tesla',
          ),
          _CharacterItem(
            visual: 'Aki/main_visual.webp',
            title: '秋',
            color: Colors.blue,
            id: 'Aki',
          ),
          _CharacterItem(
            visual: 'Yi/main_visual.webp',
            title: '翼',
            color: Colors.pink,
            alignment: Alignment.centerLeft,
            id: 'Yi',
          ),
        ].map((e) => optionalExpanded(context, e)).toList(),
      ),
    );
  }
}

class _CharacterItem extends StatefulWidget {
  final String visual;
  final Alignment alignment;
  final Color color;
  final String title;
  final String id;

  const _CharacterItem({
    Key key,
    this.visual,
    this.alignment = Alignment.center,
    this.color,
    this.title,
    this.id,
  }) : super(key: key);
  @override
  __CharacterItemState createState() => __CharacterItemState();
}

class __CharacterItemState extends State<_CharacterItem> {
  bool isPointerOver = false;
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/character/' + widget.id);
        },
        child: MouseRegion(
          onEnter: (event) {
            setState(() {
              isPointerOver = true;
            });
          },
          onExit: (event) {
            setState(() {
              isPointerOver = false;
            });
          },
          onHover: (event) {},
          cursor: SystemMouseCursors.click,
          child: Stack(
            children: [
              Center(
                child: Hero(
                  tag: 'avatar_main_visual_' + widget.id,
                  child: PlatformAwareAssetImage(
                    height: query.size.height * 0.75,
                    fit: BoxFit.cover,
                    asset: widget.visual,
                    alignment: widget.alignment,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: query.size.height * 0.75 * 0.3,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 333),
                  decoration: BoxDecoration(),
                  curve: Curves.easeOutCubic,
                  transform: Matrix4.identity()
                    ..translate(0.0, (isPointerOver ? 0 : 100).toDouble()),
                  child: AnimatedOpacity(
                    curve: Curves.easeOutCubic,
                    opacity: isPointerOver ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 333),
                    child: Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      color: widget.color,
                      child: Text(
                        widget.title,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
