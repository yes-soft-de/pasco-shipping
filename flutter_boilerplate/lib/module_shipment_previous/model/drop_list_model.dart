import 'package:flutter/material.dart';

class DropListModel {
  DropListModel(this.listOptionItems);

  final List<Entry> listOptionItems;
}

class OptionItem {
  final String id;
  final String title;

  OptionItem({required this.id, required this.title});
}
class Entry {
  final String title;
  final int id;
  final List<Entry> children; // Since this is an expansion list ...children can be another list of entries
  Entry(this.title, this.id, [this.children = const <Entry>[]]);
}

// This is the entire multi-level list displayed by this app
final List<Entry> dataFrom = <Entry>[
  Entry(
    'UAE', 1,
    <Entry>[
      Entry('Dubai' ,1),
      Entry('Abu Dhabi' ,1),
      Entry('Ajman' ,1),
    ],
  ),
  Entry(
    'Turkey', 1,
    <Entry>[
      Entry('Istanbul' ,1),
      Entry('İzmir' ,1),
      Entry('Ankara' ,1),
    ],
  ),
  ];
final List<Entry> dataTo = <Entry>[
  Entry(
    'LIBYA', 1,
    <Entry>[
      Entry('Tripoli' ,1),
      Entry('Benghazi' ,1),
      Entry('Sirte' ,1),
    ],
  ),
  Entry(
    'British Territory', 1,
    <Entry>[
      Entry('Gibraltar' ,1),
    ],
  ),
];
final List<Entry> dataUnit = <Entry>[
  Entry(
    'Carton', 1
  ),
  Entry(
    'Guni', 1,
  ),
  Entry(
    'Cork', 1,
  ),
];
final List<Entry> dataTime = <Entry>[
  Entry(
      'When received', 1
  ),
  Entry(
    'When delivered', 1,
  ),
];
final List<Entry> dataMark = <Entry>[
  Entry(
      'RONI SY312', 1
  ),
  Entry(
    'JONI SY252', 1,
  ),
  Entry(
    'TONI SY252', 1,
  ),
];
  // Second Row
  // Entry('Chapter B',1, <Entry>[
  //   Entry('Section B1',1),
  //   Entry('Section B2',1),
  // ]),
  // Entry(
  //   'Chapter C',1,
  //   <Entry>[
  //     Entry('Section C1',1,),
  //     Entry('Section C2',1),
  //     Entry(
  //       'Section C3',1,
  //       <Entry>[
  //         Entry('Item C3.0',1,),
  //         Entry('Item C3.1',1,),
  //         Entry('Item C3.2',1,),
  //         Entry('Item C3.3',1),
  //       ],
  //     )
  //   ],
  // ),
// class Entry {
//   final String title;
//   final List<Entry>
//   children; // Since this is an expansion list ...children can be another list of entries
//   Entry(this.title, [this.children = const <Entry>[]]);
// }

// // This is the entire multi-level list displayed by this app
// final List<Entry> dataEntry = <Entry>[
//   Entry(
//     'Chapter A',
//     <Entry>[
//       Entry(
//         'Section A0',
//         <Entry>[
//           Entry('Item A0.1'),
//           Entry('Item A0.2'),
//           Entry('Item A0.3'),
//         ],
//       ),
//       Entry('Section A1'),
//       Entry('Section A2'),
//     ],
//   ),
//   // Second Row
//   Entry('Chapter B', <Entry>[
//     Entry('Section B0'),
//     Entry('Section B1'),
//   ]),
//   Entry(
//     'Chapter C',
//     <Entry>[
//       Entry('Section C0'),
//       Entry('Section C1'),
//       Entry(
//         'Section C2',
//         <Entry>[
//           Entry('Item C2.0'),
//           Entry('Item C2.1'),
//           Entry('Item C2.2'),
//           Entry('Item C2.3'),
//         ],
//       )
//     ],
//   ),
// ];