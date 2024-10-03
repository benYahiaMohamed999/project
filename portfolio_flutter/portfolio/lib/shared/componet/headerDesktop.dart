// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:portfolio/shared/componet/Componets.dart';
import 'package:portfolio/shared/componet/site_Logo.dart';
import 'package:portfolio/shared/constants/sharedTest.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: kHederDecoration,
      child: ListView(
        children: [
          Row(
            children: [
              SiteLogo(
                onTap: () {},
              ),
              const Spacer(),
              for (int i = 0; i < navTitle.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 30, top: 17),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      navTitle[i],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
