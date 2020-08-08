import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String navigationName;
  MenuItem(this.title, this.navigationName);
}

final List<MenuItem> tabs = [
  MenuItem("角色", '/character'),
  MenuItem("关于", '/about')
];

class TopMenuWidget extends StatelessWidget {
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

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: tabs
            .map(
              (e) => ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(e.navigationName);
                },
                title: Text(e.title),
              ),
            )
            .toList(),
      ),
    );
  }
}
