import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/widget/custom_tabbar_widget.dart';
import 'package:pushbike_app/core/widget/general_app_bar_widget.dart';
import 'package:pushbike_app/modules/jadwal/controllers/jadwal.controller.dart';
import 'package:pushbike_app/modules/jadwal/views/components/jadwal_latihan.component.view.dart';
import 'package:pushbike_app/modules/jadwal/views/components/jadwal_ujian.component.view.dart';

class JadwalView extends StatelessWidget {
  const JadwalView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<JadwalController>();

    return Scaffold(
      appBar: const GeneralAppBarWidget(
        title: 'Jadwal',
      ),
      body: Column(
        children: [
          _buildTabBar(controller),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                JadwalLatihanView(controller: controller),
                JadwalUjianView(controller: controller),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(JadwalController controller) {
    return CustomTabbarWidget(
      tabController: controller.tabController!,
      tabs: const [
        Tab(text: 'Jadwal Latihan'),
        Tab(text: 'Jadwal Ujian'),
      ],
    );
  }
}
