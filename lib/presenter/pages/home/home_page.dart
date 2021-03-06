import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviee/infra/dependencies/injection_container.dart';
import 'package:moviee/presenter/components/components.dart';
import 'package:moviee/presenter/helpers/helpers.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'components/widgets.dart';

class HomePage extends StatelessWidget {
  static const route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = serviceLocator.get<HomeController>();
    return GetBuilder<HomeController>(
      init: homeController,
      builder: (controller) {
        return Obx(
          () {
            switch (controller.viewState) {
              case ViewState.loading:
                return LoadingPage(controller: controller);
              case ViewState.error:
                return LoadingPage(controller: controller);
              case ViewState.done:
                return buildPage(context, controller);
              default:
                return LoadingPage(controller: controller);
            }
          },
        );
      },
    );
  }
}

Widget buildPage(BuildContext context, HomeController controller) {
  return ScreenTypeLayout(
    mobile: Container(color: Colors.red),
    tablet: Container(color: Colors.blue),
    desktop: HomeDesktopScreen(controller),
  );
}
