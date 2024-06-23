import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screens_controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (controller) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: false,
              snap: true,
              backgroundColor: const Color(0xff313d64),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  controller.title,
                  style: TextStyle(
                    fontFamily: 'Orbitron', // Example of a gaming font
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                centerTitle: true,
              ),
              elevation: 10,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'mainTitle'.tr,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'subTitle'.tr,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      _buildCustomCollapsible(controller, 0,
                        'collapseQ1'.tr,
                        'collapseQ1Ans'.tr,),
                      _buildCustomCollapsible(controller, 1,
                        'collapseQ2'.tr,
                        'collapseQ2Ans'.tr,),
                      _buildCustomCollapsible(controller, 2,
                        'collapseQ3'.tr,
                        'collapseQ3Ans'.tr,),
                      _buildCustomCollapsible(controller, 3,
                        'collapseQ4'.tr,
                        'collapseQ4Ans'.tr,),
                      _buildCustomCollapsible(controller, 4,
                        'collapseQ5'.tr,
                        'collapseQ5Ans'.tr,),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildCustomCollapsible(HomeScreenController controller, int index, String question, String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(3), topLeft: Radius.circular(3)),
              color: Color(0xff426761),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    question,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    controller.isExpanded(index) ? Icons.remove : Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.toggleExpanded(index);
                  },
                ),
              ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: controller.isExpanded(index) ? null : 0,
            child: controller.isExpanded(index)
                ? Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: Text(answer),
            )
                : Container(),
          ),
        ],
      ),
    );
  }
}
