import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: TabsNonScrollableDemo(),
      ),
    );
  }
}

class TabsNonScrollableDemo extends StatefulWidget {
  const TabsNonScrollableDemo({Key? key}) : super(key: key);

  @override
  TabsNonScrollableDemoState createState() => TabsNonScrollableDemoState();
}

class TabsNonScrollableDemoState extends State<TabsNonScrollableDemo>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int counter = 0;
  bool isImage1 = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = ['Increment', 'Toggle Image'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Tabs Demo'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: [
            for (final tab in tabs) Tab(text: tab),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCounterTab(),
          _buildImageToggleTab(),
        ],
      ),
    );
  }

  Widget _buildCounterTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Counter Value: $counter'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: const Text('Increment'),
        ),
      ],
    );
  }

  Widget _buildImageToggleTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          isImage1 ? 'assets/image1.png' : 'assets/image2.png',
          width: 150,
          height: 150,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isImage1 = !isImage1;
            });
          },
          child: const Text('Toggle Image'),
        ),
      ],
    );
  }
}
