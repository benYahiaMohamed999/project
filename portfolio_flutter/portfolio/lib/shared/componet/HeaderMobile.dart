// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:portfolio/shared/componet/Componets.dart';
import 'package:portfolio/shared/componet/site_Logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
    this.onTap,
    this.onMenuTap,
  });
  final VoidCallback? onTap;
  final VoidCallback? onMenuTap;

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
              SiteLogo(onTap: onTap),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 30, top: 10),
                child: IconButton(
                  onPressed: onMenuTap,
                  icon: const Icon(
                    Icons.menu,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
