import 'package:flutter/material.dart';
import 'package:projectasahi/utils/standard_padding.dart';
import 'package:projectasahi/widgets/app_bar.dart';
import 'package:projectasahi/widgets/character_container.dart';
import 'package:projectasahi/widgets/top_menu.dart';

class CharactersScene extends StatelessWidget {
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
                        "Hello my love",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "I've been searching for someone like you",
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
          ],
        ),
      ),
    );
  }
}
