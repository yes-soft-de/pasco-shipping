import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_response.dart';
import 'package:pasco_shipping/module_airwaybill/widget/airwaybill_card.dart';
import 'package:pasco_shipping/module_shipment_track/ui/widget/search_card.dart';
import 'package:pasco_shipping/utils/helpers/pdf_paragraph_api.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class AirwaybillSuccessfully extends StatelessWidget {
  final List<AirwaybillModel> items;
  final Function onDelete;
  final Function onEdit;
  final Function onDetails;
  final Function onSearch;
  final Function addAirwaybill;
  final bool isExternal;

  const AirwaybillSuccessfully({
    required this.items,
    required this.onDelete,
    required this.onEdit,
    required this.onDetails,
    required this.onSearch,
    required this.addAirwaybill,
    required this.isExternal
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchCard(onSearch: (number){
          onSearch(number);
        },title:S.of(context).enterAirwaybillNumber,),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue[800],
          ),
          onPressed: () async {
            await Printing.layoutPdf(
              // [onLayout] will be called multiple times
              // when the user changes the printer or printer settings
              onLayout: (PdfPageFormat format) {
                // Any valid Pdf document can be returned here as a list of int
                return PdfParagraphApi.generateAirwaybillReport(items);
              },
            );
          },
          icon: Icon(Icons.document_scanner_sharp),
          label: Text(
            S.of(context).reports,
            style: AppTextStyle.mediumWhite,
          ),
        ),
        SizedBox(height: 10,),
       isExternal?Container(): ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue[800],
          ),
          onPressed: () {
            addAirwaybill();
          },
          icon: Icon(Icons.add_circle),
          label: Text(
            S.of(context).requestAirwaybill,
            style: AppTextStyle.mediumWhite,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return AirwaybillCard(
                model: items[index],
                onEdit: (model) {
                  onEdit(model);
                },
                onDelete: (id) {
                  onDelete(id);
                },
                onDetails: (id ,isFull) {
                  onDetails(id , isFull);
                },
              );
            },
            itemCount: items.length,
            shrinkWrap: true,
          ),
        ),
      ],
    );
  }
}
