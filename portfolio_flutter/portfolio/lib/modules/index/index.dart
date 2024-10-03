// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:portfolio/modules/About/About.dart';
import 'package:portfolio/modules/Contact/Contact.dart';
import 'package:portfolio/modules/Resume/resume.dart';
import 'package:portfolio/modules/Works/works.dart';
import 'package:portfolio/shared/componet/HeaderMobile.dart';
import 'package:portfolio/shared/componet/drawer_mobile.dart';
import 'package:portfolio/shared/componet/headerDesktop.dart';
import 'package:portfolio/shared/componet/main_desktop.dart';
import 'package:portfolio/shared/componet/main_mobile.dart';
import 'package:portfolio/shared/constants/responsive.dart';

class Index extends StatelessWidget {
  Index({super.key});

  final scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWith = screenSize.width;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldkey,
        backgroundColor: Colors.blueAccent,
        endDrawer: constraints.maxWidth >= kMinDesktopwidth
            ? null
            : const DrawerMobile(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            constraints.maxWidth >= kMinDesktopwidth
                ? const HeaderDesktop()
                : HeaderMobile(
                    onMenuTap: () {
                      scaffoldkey.currentState?.openEndDrawer();
                    },
                    onTap: () {},
                  ),

            constraints.maxWidth >= kMinDesktopwidth
                ? const MainDesktop()
                : const MainMobile(),
            // const About(),
            // const Resume(),
            // const Work(),
            // const Contact(),
          ],
        ),
      );
    });
  }
}
