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
    'Collect', 1,[]
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
final List<Entry> holderTypeEx = <Entry>[
  Entry(
      'FCL', 1,[]
  ),
];

final List<Entry> location = <Entry>[
  Entry(
      'Premera Local', 1,[]
  ),
  Entry(
      'Jebel Ali', 1,[]
  ),
  Entry(
      'Premeral Local & Jebel Ali', 1,[]
  ),
];