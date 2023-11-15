import 'package:flutter/material.dart';

import '../constants/font_size.dart';
import '../helper/space_helper.dart';

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({
    Key? key,
    required this.body,
    this.appBar,
    this.usePadding = true,
    this.useSingleScroll = true,
    this.bg,
    this.scaffoldKey,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.scrollController,
  }) : super(key: key);

  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget body;
  final AppBar? appBar;
  final bool usePadding;
  final bool useSingleScroll;
  final Color? bg;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets edgeInsets = EdgeInsets.symmetric(
      horizontal: usePadding ? sp(kGlobalPadding) : 0,
    );

    return Scaffold(
      drawerEnableOpenDragGesture: true,
      key: scaffoldKey,
      appBar: appBar,
      backgroundColor: bg ?? Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        
        child: SizedBox(
          height: sh(100),
          child: () {
            if (useSingleScroll) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: scrollController,
                child: Padding(padding: edgeInsets, child: body),
              );
            } else {
              return Padding(padding: edgeInsets, child: body);
            }
          }(),
        ),
      ),
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
