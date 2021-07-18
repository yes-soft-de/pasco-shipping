import 'package:flutter/cupertino.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_countries/widget/country_card.dart';

class CountriesSuccessfully extends StatelessWidget {
  final List<CountryModel> items;
  final Function onDelete;
  final Function onEdit;
  const CountriesSuccessfully({required  this.items,required this.onDelete,required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context , index){
      return CountryCard(model: items[index],
      onEdit: (re){
        onEdit(re);
      },
        onDelete: (id){
        onDelete(id);
        }, isEdtiable: false,
      );
    },itemCount: items.length,
      shrinkWrap: true,
    )
    ;
  }
}
