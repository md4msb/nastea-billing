// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:nastea_billing/core/extensions/extensions.dart';
// import '../widgets/shop_detail_form.dart';
// import '../widgets/item_selector.dart';

// class BillCreationScreen extends StatelessWidget {
//   const BillCreationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       backgroundColor: Color(0xFFF9F9F9),
//       appBar: _buildAppBar(),
//       body: ListView(
//         children: [
//           _billCardDesign(child: ShopDetailsForm()),
//           Gap(15),
//           _billCardDesign(child: ItemSelector()),
//         ],
//       ),

//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
//         child: SizedBox(
//           height: 50,
//           child: Opacity(
//             opacity: 1,
//             child: ElevatedButton(
//               onPressed: () {
//                 // Handle button press
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF46A56C),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Text(
//                 'Review',
//                 style: NasteaTextStyles.body(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   AppBar _buildAppBar() {
//     return AppBar(
//       backgroundColor: Color(0xFFF9F9F9),
//       title: Text(
//         'Bill Creation',
//         style: NasteaTextStyles.body(
//           color: Colors.black,
//           fontSize: 18,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       centerTitle: true,
//     );
//   }

//   // A reusable widget for the bill card design
//   Widget _billCardDesign({required Widget child}) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: Color(0xFFD8DADC), width: 1),
//       ),
//       child: child,
//     );
//   }
// }

