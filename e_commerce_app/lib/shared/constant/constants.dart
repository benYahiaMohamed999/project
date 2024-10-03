import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/shared/componets/SearchAppBar.dart';
import 'package:flutter/material.dart';

myAppbar(context) => AppBar(
      actions: [
        IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(
              Icons.search,
            ))
      ],
      leading: const Icon(
        Icons.logo_dev,
      ), //Logo of Application
      title: Text(
        S.of(context).NamedApplicat,
      ),
    );
