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
final List<Entry> paymentType = <Entry>[
  Entry(
      'Cash', 0,[]
  ),
  Entry(
      'Check', 0,[]
  ),
];
final List<Entry> shipmentLclFinance = <Entry>[
  Entry(
      'transporting', 0,[]
  ),
  Entry(
      'delayed', 0,[]
  ),
  Entry(
      'shipping', 0,[]
  ),
  Entry(
      'uploading', 0,[]
  ),
  Entry(
      'fork', 0,[]
  ),
  Entry(
      'pocketing', 0,[]
  ),
  Entry(
      'other', 0,[]
  ),
];
final List<Entry> fundName = <Entry>[
  Entry(
      'Libya Fund', 0,[]
  ),
  Entry(
      'Turkey Fund', 0,[]
  ),
];


final List<Entry> containerLclFinance = <Entry>[
  Entry(
      'shipping', 0,[]
  ),
  Entry(
      'uploading', 0,[]
  ),
  Entry(
      'fork', 0,[]
  ),
  Entry(
      'clearance', 0,[]
  ),
  Entry(
      'buyingCost', 0,[]
  ),
  Entry(
      'other', 0,[]
  ),
];
final List<Entry> containerFclFinance = <Entry>[
  Entry(
      'transporting', 0,[]
  ),
  Entry(
      'delayed', 0,[]
  ),
  Entry(
      'shipping', 0,[]
  ),
  Entry(
      'uploading', 0,[]
  ),
  Entry(
      'fork', 0,[]
  ),
  Entry(
      'clearance', 0,[]
  ),
  Entry(
      'buyingCost', 0,[]
  ),
  Entry(
      'SellingCost', 0,[]
  ),
  Entry(
      'other', 0,[]
  ),
];