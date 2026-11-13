// import 'package:flutter/material.dart';
// import 'home_page.dart';
// import 'service.dart';
// import 'model.dart';

// class SearchPage extends StatelessWidget {
//   final TextEditingController controller = TextEditingController();

//   SearchPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "Search City",
//             style: TextStyle(color: Colors.white),
//           ),
//           backgroundColor: const Color.fromARGB(255, 225, 167, 30),
//         ),
//         body: Column(
//           children: [
//             TextField(
//               controller: controller,
//               onSubmitted: (value) {
//                 // لما المستخدم يكتب اسم المدينة ويدوس Enter
//                 Navigator.pop(
//                     context, value); // ← نرجع للصفحة الرئيسية ومعانا الاسم
//               },
//               style: const TextStyle(color: Colors.white),
//               decoration: InputDecoration(
//                 hintText: 'Enter City Name',
//                 hintStyle: const TextStyle(color: Colors.grey),
//                 prefixIcon: const Icon(
//                   Icons.search,
//                   color: Colors.grey,
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                   borderSide: const BorderSide(
//                       color: Color.fromARGB(255, 225, 167, 30), width: 2),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                   borderSide: const BorderSide(
//                       color: Color.fromARGB(255, 225, 167, 30), width: 2),
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Search City",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 225, 167, 30),
        ),
        body: Center(
          child: TextField(
            controller: controller,
            onSubmitted: (value) {
              // لما المستخدم يكتب اسم المدينة ويدوس Enter
              Navigator.pop(
                  context, value); // ← نرجع للصفحة الرئيسية ومعانا الاسم
            },
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: 'Enter City Name',
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 225, 167, 30), width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 225, 167, 30), width: 2),
              ),
            ),
          ),
        ));
  }
}
