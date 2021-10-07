// import 'package:flutter/material.dart';
// class SlideTile extends StatefulWidget {

// final String image;
// final bool activePage;

// SlideTile ({ Key key, this.image, this.activePage }) : super(key: key);

//   @override
//   _SlideTileState createState() => _SlideTileState();
// }

// class _SlideTileState extends State<SlideTile> {
//   @override
//   Widget build(BuildContext context) {

//     final double top = this.activePage ? 50 : 150;


//     return AnimatedContainer(
//       duration: Duration(microseconds: 500),
//       margin: EdgeInsets.only(top: 100, bottom: 75, right: 30  ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),  
//         image: DecorationImage(
//           image: AssetImage(this.widget.image),
//           fit: BoxFit.cover,
//         ), 
//       ),
//     );
//   }
// }
