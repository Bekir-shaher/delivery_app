// import 'dart:ffi';

// import 'package:delivery_app/futuers/user/presention/screens/loginScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/material/radio_list_tile.dart';

// class LangugeDialog extends StatefulWidget {
//   const LangugeDialog({super.key});

//   @override
//   State<LangugeDialog> createState() => _LangugeDialogState();
// }

// class _LangugeDialogState extends State<LangugeDialog> {
//   String selectedLan = "en";
//   String languageNo = "2";
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//       title: Text(
//         "Chose language",
//         style: TextStyle(
//           fontSize: 16,
//           color: Color(0xff004F62),
//           fontWeight: FontWeight.w700,
//         ),
//       ),
//       backgroundColor: Color(0xffF4F4F4),
//       content: Row(
//         children: [
//           Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedLan = "ar";
//                   languageNo = "1";
//                 });
//               },
//               child: Container(
//                 width: 150,
//                 height: 44,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: selectedLan == "ar"
//                       ? Color(0xffCBFFCB)
//                       : Color(0xffFFFFFF),
//                   border: Border.all(color: Color(0xff0A3F8F)),
//                 ),

//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 0,
//                       child: Container(
//                         margin: EdgeInsets.only(left: 20),
//                         child: CircleAvatar(
//                           maxRadius: 12,
//                           backgroundImage: AssetImage(
//                             'images/langugeDilaogAssetes/Arabic Flag.png',
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 19),
//                     Expanded(
//                       flex: 0,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "العربية",
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Color(0xff000000),
//                               fontWeight: FontWeight.w900,
//                             ),
//                           ),
//                           Text(
//                             "Arabic",
//                             style: TextStyle(
//                               fontSize: 10,
//                               color: Color(0xff000000),
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           SizedBox(width: 10),
//           Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedLan = "en";
//                   languageNo = "2";
//                 });
//               },
//               child: Container(
//                 width: 150,
//                 height: 44,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: selectedLan == "en"
//                       ? Color(0xffCBFFCB)
//                       : Color(0xffFFFFFF),
//                   border: Border.all(
//                     color: Color(0xff0A3F8F),
//                     width: 1.0,
//                   ), //الحجم غير مناسب
//                 ),

//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 0,
//                       child: Container(
//                         margin: EdgeInsets.only(left: 20),
//                         child: CircleAvatar(
//                           maxRadius: 12,
//                           backgroundImage: AssetImage(
//                             'images/langugeDilaogAssetes/English Flag.png',
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 19),
//                     Expanded(
//                       flex: 0,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "English",
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Color(0xff000000),
//                               fontWeight: FontWeight.w900,
//                             ),
//                           ),
//                           Text(
//                             "English",
//                             style: TextStyle(
//                               fontSize: 10,
//                               color: Color(0xff000000),
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),

//       actions: [
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color(0xff004F62),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadiusGeometry.circular(12),
//               ),
//             ),
//             onPressed: () {
//               print("Selected language = $selectedLan");
//               //اعدادات الللغة]
//               Navigator.pop(context, languageNo);
//             },
//             child: Text(
//               "Apply",
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Color(0xffFFFFFF),
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:delivery_app/core/lang/cubit/lang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({super.key});

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  String selectedLan = "en"; // للـ UI فقط
  String languageNo = "2"; // القيمة الراجعة للـ API

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      backgroundColor: const Color(0xffF4F4F4),
      title: const Text(
        "Choose language",
        style: TextStyle(
          fontSize: 16,
          color: Color(0xff004F62),
          fontWeight: FontWeight.w700,
        ),
      ),
      content: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedLan = "ar";
                  languageNo = "1";
                });
              },
              child: _LangTile(
                active: selectedLan == "ar",
                flag: 'images/langugeDilaogAssetes/Arabic Flag.png',
                top: "العربية",
                bottom: "Arabic",
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedLan = "en";
                  languageNo = "2";
                });
              },
              child: _LangTile(
                active: selectedLan == "en",
                flag: 'images/langugeDilaogAssetes/English Flag.png',
                top: "English",
                bottom: "English",
              ),
            ),
          ),
        ],
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff004F62),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () async {
              await context.read<LangCubit>().setLang('ar'); //
              final langNo = context.read<LangCubit>().state.languageNo;

              Navigator.pop(context, langNo.toString());
            },
            child: const Text(
              "Apply",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class _LangTile extends StatelessWidget {
  final bool active;
  final String flag;
  final String top;
  final String bottom;
  const _LangTile({
    required this.active,
    required this.flag,
    required this.top,
    required this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: active ? const Color(0xffCBFFCB) : const Color(0xffFFFFFF),
        border: Border.all(color: const Color(0xff0A3F8F), width: 1),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          CircleAvatar(maxRadius: 12, backgroundImage: AssetImage(flag)),
          const SizedBox(width: 19),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                top,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                bottom,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
