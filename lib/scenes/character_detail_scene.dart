import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:projectasahi/data/characters.dart';
import 'package:projectasahi/utils/standard_padding.dart';
import 'package:projectasahi/widgets/fade_in.dart';
import 'package:projectasahi/widgets/measure_size.dart';
import 'package:projectasahi/widgets/platform_aware_asset_image.dart';
import 'package:projectasahi/widgets/v_tab.dart';

class CharacterDetailScene extends StatefulWidget {
  final String id;

  const CharacterDetailScene({Key key, this.id}) : super(key: key);
  @override
  CharacterDetailSceneState createState() => CharacterDetailSceneState();
}

class CharacterDetailSceneState extends State<CharacterDetailScene>
    with TickerProviderStateMixin {
  TabController _tabController;
  final PageController _pageController = PageController();
  var isPageCanChanged = true;

  Size visualSize = Size.zero;
  Size bgVisualSize = Size.zero;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      onPageChange(_tabController.index, p: _pageController);
    });
  }

  onPageChange(int index, {PageController p, TabController t}) async {
    if (p != null) {
      isPageCanChanged = false;
      await _pageController.animateToPage(index,
          duration: Duration(milliseconds: 333), curve: Curves.easeInOutQuart);
      isPageCanChanged = true;
    } else {
      _tabController.animateTo(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = characters.firstWhere((element) => element.id == widget.id,
        orElse: () => null);
    if (data == null) {
      return Center(child: Text('404'));
    }
    final standardPadding = calcStandardPadding(context);
    final query = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        color: data.color.withOpacity(0.54),
        child: Stack(
          children: [
            Positioned(
              left: bgVisualSize.width == 0
                  ? query.size.width / 2 * data.avatarOffsetX
                  : bgVisualSize.width * data.avatarOffsetX,
              top: 0,
              bottom: -query.size.height * 0.7,
              child: FadeIn(
                delay: 1,
                translateX: 50,
                child: Opacity(
                  opacity: 0.15,
                  child: MeasureSize(
                    onChange: (size) {
                      setState(() {
                        bgVisualSize = size;
                      });
                    },
                    child: PlatformAwareAssetImage(
                      asset: data.mainVisual,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: query.size.width * 0.25,
              right: standardPadding * 2,
              top: standardPadding * 3,
              bottom: standardPadding * 3,
              child: FadeIn(
                translateX: 100,
                delay: 2,
                child: Card(
                  child: Row(
                    children: [
                      SizedBox(
                          width: visualSize.width == 0
                              ? query.size.width * data.rightPadding
                              : 0.5 * visualSize.width +
                                  data.rightPadding * visualSize.width),
                      Expanded(
                        child: PageView(
                          onPageChanged: (index) {
                            if (isPageCanChanged) {
                              onPageChange(index);
                            }
                          },
                          controller: _pageController,
                          children: [
                            _CharacterInfo(
                              data: data,
                            ),
                            Container(),
                            Container(),
                          ],
                        ),
                      ),
                      FadeIn(
                        delay: 3,
                        translateX: 100,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(-2, 0),
                              ),
                            ],
                          ),
                          constraints:
                              BoxConstraints(maxWidth: query.size.width * 0.1),
                          child: VTabBar(
                            controller: _tabController,
                            indicatorColor: data.color,
                            labelColor: data.color,
                            unselectedLabelColor:
                                Theme.of(context).textTheme.caption.color,
                            tabs: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.description,
                                    size: standardPadding * 1.5,
                                  ),
                                  SizedBox(height: 8),
                                  Text("简介"),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.group,
                                    size: standardPadding * 1.5,
                                  ),
                                  SizedBox(height: 8),
                                  Text("人物关系"),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image,
                                    size: standardPadding * 1.5,
                                  ),
                                  SizedBox(height: 8),
                                  Text("相册"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: query.size.width * 0.15,
              top: standardPadding * 3,
              bottom: standardPadding * 3,
              child: Hero(
                tag: 'avatar_main_visual_' + widget.id,
                child: MeasureSize(
                  onChange: (size) {
                    setState(() {
                      visualSize = size;
                    });
                  },
                  child: PlatformAwareAssetImage(
                    asset: data.mainVisual,
                  ),
                ),
              ),
            ),
            Positioned(
              left: standardPadding,
              top: standardPadding / 2,
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                foregroundColor: Theme.of(context).textTheme.bodyText1.color,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CharacterInfo extends StatelessWidget {
  const _CharacterInfo({
    Key key,
    @required this.data,
  }) : super(key: key);

  final CharacterData data;

  @override
  Widget build(BuildContext context) {
    final standardPadding = calcStandardPadding(context);
    return Scrollbar(
      child: ListView(
        padding: EdgeInsets.only(right: standardPadding),
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: standardPadding),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                data.name,
                style: Theme.of(context).textTheme.headline2.copyWith(
                      color: Theme.of(context).textTheme.bodyText1.color,
                    ),
              ),
              SizedBox(width: 16),
              Text(data.nameEn, style: Theme.of(context).textTheme.headline4),
            ],
          ),
          SizedBox(height: 16),
          Table(
            columnWidths: {
              0: FixedColumnWidth(50.0),
              1: FixedColumnWidth(100.0),
              2: IntrinsicColumnWidth(),
            },
            children: data.extraData.entries
                .map(
                  (e) => TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 4),
                        child: Text(
                          tr(e.key),
                          style: TextStyle(color: data.color),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32, top: 4, bottom: 4),
                        child: Text(
                          tr(e.value),
                        ),
                      ),
                      Container(),
                    ],
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 16),
          Text(tr(data.summary)),
          SizedBox(height: standardPadding),
        ],
      ),
    );
  }
}
