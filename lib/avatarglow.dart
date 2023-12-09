// import 'package:flutter/material.dart';
// import 'package:avatar_glow/avatar_glow.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Avatar Glow"),
//       ),
//       body: Center(
//         child: AvatarGlow(
//           endRadius: 120.0,
//           glowColor: Colors.red,
//           child: Material(
//             // Replace this child with your own
//             elevation: 8.0,
//             shape: CircleBorder(),
//             child: CircleAvatar(
//               backgroundColor: Colors.grey[100],
//               backgroundImage: NetworkImage('https://picsum.photos/200/300'),
//               radius: 50.0,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
