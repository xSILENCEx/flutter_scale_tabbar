import 'package:flutter/material.dart';

import 'scale_tabbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scale Tabbar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Widget> _tabs = [
      Tab(child: Text('测试')),
      Tab(child: Text('测试')),
      Tab(child: Text('测试')),
    ];

    const List<Widget> _tabViews = [
      Center(child: Text('TabBarView1')),
      Center(child: Text('TabBarView2')),
      Center(child: Text('TabBarView3')),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Scale Tabbar')),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('ScaleTabBar'),
            ),

            ///ScaleTabBar
            Builder(builder: (context) {
              return ScaleTabBar(
                tabs: _tabs,

                ///TODO 添加双击事件会导致[onTap]响应延时,不推荐使用
                onDoubleTap: (index) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Double tap : $index')),
                  );
                },

                labelColor: Colors.black,
                labelStyle: const TextStyle(fontSize: 30),
                unselectedLabelStyle: const TextStyle(fontSize: 15),

                //波纹属性
                splashColor: Colors.blue,
                highlightColor: Colors.redAccent,
                borderRadius: BorderRadius.circular(10),
              );
            }),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('TabBar'),
            ),

            ///TabBar
            TabBar(
              tabs: _tabs,
              labelColor: Colors.black,
              labelStyle: const TextStyle(fontSize: 30),
              unselectedLabelStyle: const TextStyle(fontSize: 15),
            ),

            Expanded(child: TabBarView(children: _tabViews)),
          ],
        ),
      ),
    );
  }
}
