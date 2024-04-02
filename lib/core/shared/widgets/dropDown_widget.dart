// import 'package:flutter/material.dart';
//
// /// Flutter code sample for [DropdownButton].
//
// // void main() => runApp(const DropdownButtonApp());
//
// // class DropdownButtonApp extends StatelessWidget {
// //   const DropdownButtonApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(title: const Text('DropdownButton Sample')),
// //         body: const Center(
// //           child: DropdownButtonExample(),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// class DropdownButtonExample extends StatefulWidget {
//   DropdownButtonExample({super.key});
//   late List<String> list = <String>['Male', 'Female'];
//
//   @override
//   State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
// }
//
// class _DropdownButtonExampleState extends State<DropdownButtonExample> {
//   String dropdownValue = widget.list.first;
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: list.first,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: list.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }
