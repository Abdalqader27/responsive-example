import 'package:flutter/material.dart';
import 'package:responsive_example/constants.dart';
import 'package:responsive_example/main.dart';
import 'package:responsive_example/pages/counter_detail_page.dart';
import 'package:responsive_example/pages/counters_page.dart';

class CounterAppContent extends StatelessWidget {
  const CounterAppContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = getScreenSize(context);
    final orientation = MediaQuery.orientationOf(context);
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(
        screenSize: screenSize,
        orientation: orientation,
      ),
      body: SafeArea(
        child: switch ((screenSize, orientation)) {
          (ScreenSize.large, _) => const Row(
              children: [
                CounterNavigationRail(),
                VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  child: CountersPage(isFullPage: false),
                ),
                Expanded(
                  child: CounterDetailPage(),
                ),
              ],
            ),
          (_, Orientation.landscape) => const Row(
              children: [
                CounterNavigationRail(),
                VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  child: CountersPage(),
                )
              ],
            ),
          (_, _) => const CountersPage(),
        },
      ),
    );
  }

  Widget? _buildBottomNavigationBar({
    required ScreenSize screenSize,
    required Orientation orientation,
  }) {
    return switch ((screenSize, orientation)) {
      (_, Orientation.landscape) => null,
      (ScreenSize.large, _) => null,
      (_, _) => const CounterNavigationBar(),
    };
  }
}
