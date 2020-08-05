import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String navigationName;
  MenuItem(this.title, this.navigationName);
}

class TopMenuWidget extends StatelessWidget {
  final List<MenuItem> tabs = [
    MenuItem("角色", '/character'),
    MenuItem("故事", '/story'),
    MenuItem("关于", '/about')
  ];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    if (mediaQuery.size.width <= 480) {
      return IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          });
    }
    final current = ModalRoute.of(context)?.settings?.name;
    return Row(
      children: tabs
          .map(
            (e) => Container(
              decoration: current.startsWith(e.navigationName)
                  ? BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1, color: Theme.of(context).accentColor),
                      ),
                    )
                  : null,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(e.navigationName);
                },
                child: Tab(
                  child: Text(
                    e.title,
                    style: TextStyle(
                      color: current.startsWith(e.navigationName)
                          ? Theme.of(context).accentColor
                          : null,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
