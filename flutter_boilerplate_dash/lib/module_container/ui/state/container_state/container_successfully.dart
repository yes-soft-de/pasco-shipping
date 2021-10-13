import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_container/widget/container_card.dart';
import 'package:pasco_shipping/module_shipment_track/ui/widget/search_card.dart';
import 'package:pasco_shipping/utils/helpers/pdf_paragraph_api.dart';
import 'package:pasco_shipping/utils/styles/AppTextStyle.dart';

class ContainerSuccessfully extends StatelessWidget {
  final List<ContainerModel> items;
  final Function onDelete;
  final Function onEdit;
  final Function onDetails;
  final Function onSearch;
  final Function addContainer;
  final bool isExternal;

  const ContainerSuccessfully({
    required this.items,
    required this.onDelete,
    required this.onEdit,
    required this.onDetails,
    required this.onSearch,
    required this.addContainer,
    required this.isExternal
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchCard(onSearch: (number){
          onSearch(number);
        },title:S.of(context).enterContainerNumber,),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue[800],
          ),
          onPressed: () async {
            final pdfFile = await PdfParagraphApi.generateContainerReport(items);

            PdfParagraphApi.openFile(pdfFile);
          },
          icon: Icon(Icons.document_scanner_sharp),
          label: Text(
            S.of(context).reports,
            style: AppTextStyle.mediumWhite,
          ),
        ),
     isExternal?Container():   ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue[800],
          ),
          onPressed: () {
            addContainer();
          },
          icon: Icon(Icons.add_circle),
          label: Text(
            S.of(context).requestContainer,
            style: AppTextStyle.mediumWhite,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ContainerCard(
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
