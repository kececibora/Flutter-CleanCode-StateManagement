import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:state_management/feature/onboard/on_board_model.dart';
import 'package:state_management/feature/onboard/tab_indicator.dart';
import 'package:state_management/product/widgets/onboard_card.dart';
import '../../product/padding/page_padding.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final String _skipTile = "Skip";
  int selectedIndex = 0;

  final String _start = 'Start';
  final String _end = 'Next';

  bool get _isLastPage =>
      OnBoardModels.onBoardItems.length - 1 == selectedIndex;
  bool get _isFirstPage => selectedIndex == 0;

  void _incrementAndChange([int? value]) {
    if (_isLastPage && value == null) {
      return;
    }
    _incrementSelectedPage(value);
    // _changeIndicator(selectedIndex);
  }

  void _incrementSelectedPage([int? value]) {
    inspect(this);
    setState(() {
      selectedIndex = value ?? selectedIndex++;
    });
  }

  // void _changeIndicator(int value) {
  // _tabController.animateTo(value);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: const PagePadding.all(),
        child: Column(
          children: [
// !Pageview ne kadar yer kapladığını bilmediği için expand ederek kullanmak gerekiyor.
            Expanded(child: _pageViewItems()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
// ! Alttaki noktalar burası. Burayı ayarlamak için az çok sayfanın kaç sayfa olduğunu bişmek gerekiyor. Bu nedenle bir modal oluşturup buraya nesneleri atıyorum.
                TabIndicator(selectedIndex: selectedIndex),
                _nextButton()
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
//! Appbarın yukarısını da boyamak için .
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [TextButton(onPressed: () {}, child: Text(_skipTile))],
        leading: _isFirstPage
            ? null
            : IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_left_outlined,
                  color: Colors.grey,
                )));
  }

  Widget _pageViewItems() {
    return PageView.builder(
      onPageChanged: (value) {
        _incrementAndChange(value);
      },
      itemCount: OnBoardModels.onBoardItems.length,
      itemBuilder: (context, index) {
        return OnBoardCard(model: OnBoardModels.onBoardItems[index]);
      },
    );
  }

  FloatingActionButton _nextButton() {
    return FloatingActionButton(
      child: Text(_isLastPage ? _start : _end),
      onPressed: () {
        _incrementAndChange();
      },
    );
  }
}
