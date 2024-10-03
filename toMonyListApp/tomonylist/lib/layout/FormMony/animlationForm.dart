// import 'package:flutter/material.dart';

// Widget Annimation()=>Card(
//       color: Colors.white,
//       elevation: 2.0,
//       child: OpenContainer(
//         transitionType: ContainerTransitionType.fadeThrough,
//         closedColor: Theme.of(context).cardColor,
//         closedElevation: 0.0,
//         openElevation: 4.0,
//         transitionDuration: Duration(milliseconds: 1500),
//         openBuilder: (BuildContext context, VoidCallback _) => THENEXTSCREEN(),
//         closedBuilder: (BuildContext _, VoidCallback openContainer) {
//           return ListTile(
//             leading: Icon(Icons.album),
//             title: Text("ITEM NAME"),
//           );
//         },
//       ),
//     );