import 'package:flutter/material.dart';

import 'on_board_model.dart';

class TabIndicator extends StatefulWidget {
  const TabIndicator({super.key, required this.selectedIndex});
  final int selectedIndex;
  @override
  State<TabIndicator> createState() => _TabIndicatorState();
}

class _TabIndicatorState extends State<TabIndicator>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  // ! Alt widget üst'ü dinleyip değiştirmesi için...
  void didUpdateWidget(covariant TabIndicator oldWidget) {
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _tabController.animateTo(widget.selectedIndex);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _tabController =
        TabController(length: OnBoardModels.onBoardItems.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabPageSelector(controller: _tabController);
  }
}
