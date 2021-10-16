import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';
import 'package:pasco_shipping/module_travel/widget/travel_card.dart';
import 'package:pasco_shipping/utils/helpers/pdf_paragraph_api.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class TravelSuccessfully extends StatelessWidget {
  final List<TravelModel> items;
  final Function onDelete;
  final Function onEdit;
  final Function onDetails;

  const TravelSuccessfully({
    required this.items,
    required this.onDelete,
    required this.onEdit,
    required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                return PdfParagraphApi.generateTravelReport(items);
              },
            );
          },
          icon: Icon(Icons.document_scanner_sharp),
          label: Text(
            S.of(context).reports,
            style: AppTextStyle.mediumWhite,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TravelsCard(
                model: items[index],
                onEdit: (model) {
                  onEdit(model);
                },
                onDelete: (id) {
                  onDelete(id);
                },
                onDetails: (id) {
                  onDetails(id);
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
