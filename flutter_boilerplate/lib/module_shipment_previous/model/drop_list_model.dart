import 'package:flutter/material.dart';

class DropListModel {
  DropListModel(this.listOptionItems);

  List<Entry> listOptionItems;
}

// class OptionItem {
//   final String id;
//   final String title;
//
//   OptionItem({required this.id, required this.title});
// }
class Entry {
   int id;
   String title;
  late List<Entry> _children;

  Entry(this.title, this.id, this._children);

  set children(List<Entry> value) =>
    _children = value;

  List<Entry> get children => _children;
}

// This is the entire multi-level list displayed by this app
final List<Entry> dataFrom = <Entry>[
  Entry(
    'UAE', 1,
    <Entry>[
      Entry('Dubai' ,1,[]),
      Entry('Abu Dhabi' ,1 ,[]),
      Entry('Ajman' ,1, []),
    ],
  ),
  Entry(
    'Turkey', 1,
    <Entry>[
      Entry('Istanbul' ,1,[]),
      Entry('İzmir' ,1,[]),
      Entry('Ankara' ,1,[]),
    ],
  ),
  ];
final List<Entry> dataTo = <Entry>[
  Entry(
    'LIBYA', 1,
    <Entry>[
      Entry('Tripoli' ,1,[]),
      Entry('Benghazi' ,1,[]),
      Entry('Sirte' ,1,[]),
    ],
  ),
  Entry(
    'British Territory', 1,
    <Entry>[
      Entry('Gibraltar' ,1,[]),
    ],
  ),
];
final List<Entry> dataUnit = <Entry>[
  Entry(
    'Carton', 1,[]
  ),
  Entry(
    'Guni', 1,[]
  ),
  Entry(
    'Cork', 1,[]
  ),
];
final List<Entry> dataTime = <Entry>[
  Entry(
      'Prepaid', 1,[]
  ),
  Entry(
    'Collect ', 1,[]
  ),
];
final List<Entry> holderTypeEx = <Entry>[
  Entry(
      'FCL', 1,[]
  ),
];
final List<Entry> holderTypeLocal = <Entry>[
  Entry(
      'FCL', 1,[]
  ),
  Entry(
      'LCL', 1,[]
  ),
];
final List<Entry> dataMark = <Entry>[
  Entry(
      'RONI SY312', 1,[]
  ),
  Entry(
    'JONI SY252', 1,[]
  ),
  Entry(
    'TONI SY252', 1,[]
  ),
];