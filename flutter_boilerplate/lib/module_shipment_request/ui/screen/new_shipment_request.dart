import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:im_stepper/stepper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/generated/l10n.dart';
import 'package:pasco_shipping/module_mark/mark_routes.dart';
import 'package:pasco_shipping/module_receiver/receiver_routes.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/state_manager/request_shipment_state_manager/request_shipment_state_manager.dart';
import 'package:pasco_shipping/module_shipment_request/ui/screen/first_option.dart';
import 'package:pasco_shipping/module_shipment_request/ui/screen/second_options.dart';
import 'package:pasco_shipping/module_shipment_request/ui/screen/third_options.dart';
import 'package:pasco_shipping/module_theme/service/theme_service/theme_service.dart';
import 'package:pasco_shipping/utils/styles/colors.dart';
import 'package:pasco_shipping/utils/widget/background.dart';
import 'dart:io';

import 'package:rxdart/rxdart.dart';

@injectable
class NewShipment extends StatefulWidget {
  final RequestShipmentStateManger _stateManger;
  const NewShipment(this._stateManger);

  @override
  _NewShipmentState createState() => _NewShipmentState();
}

class _NewShipmentState extends State<NewShipment> {
  // late RequestShipmentStateManger stateManger;
  int activeStep = 0; // Initial step set to 0.
  late ScrollController _controller;
  late PublishSubject<int> _optionsStreamController;
  late ShipmentTempRequest _shipmentRequestModel;

  @override
  void initState() {
    super.initState();
    _optionsStreamController = PublishSubject<int>();
    _controller = ScrollController();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(ModalRoute.of(context)!.settings.arguments == null){
      _shipmentRequestModel =
          ShipmentTempRequest(0,'',
              '', 0,'', '', 0, '',0, '',0, '', '', '', 0, '', '', '','','',0,[],false,'',[]);
    }else{
      final arguments = ModalRoute.of(context)!.settings.arguments as Map;
      _shipmentRequestModel = arguments['shipment'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      goBack: (){
        Navigator.pop(context);
      },
      controller: _controller,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NumberStepper(
              activeStep: activeStep,
              lineColor: AppThemeDataService.AccentColor,
              activeStepColor: AppThemeDataService.AccentColor,
              activeStepBorderColor: greyWhite,
              activeStepBorderWidth: 3,
              enableNextPreviousButtons: false,
              lineDotRadius: 2,
              enableStepTapping: false,
              stepColor: greyBlack,
              lineLength: 75,
              onStepReached: (step) {
                setState(() {
                  activeStep = step;
                });
              },
              numbers: [
                1,
                2,
                3,
              ],
            ),
            StreamBuilder<int>(
              initialData: 0,
              stream: _optionsStreamController,
              builder: (context, snapshot) {
                if (snapshot.data == 0) {
                  return FirstOptions(
                      widget._stateManger, _shipmentRequestModel, () {
                    print("requetsModel" + _shipmentRequestModel.toString());
                    setState(() {
                      activeStep = activeStep + 1;
                      _optionsStreamController.add(activeStep);
                      SchedulerBinding.instance!.addPostFrameCallback((_) {
                        if (_controller.hasClients) {
                          _controller.animateTo(
                            0.0,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 0),
                          );
                        }
                      });
                    });
                  });
                } else if (snapshot.data == 1) {
                  return SecondOption(
                      widget._stateManger, _shipmentRequestModel, () {
                    setState(() {
                      activeStep = activeStep - 1;
                      _optionsStreamController.add(activeStep);

                      SchedulerBinding.instance!.addPostFrameCallback((_) {
                        if (_controller.hasClients) {
                          _controller.animateTo(
                            0.0,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 0),
                          );
                        }
                      });
                    });
                  }, () {
                    setState(() {
                      activeStep = activeStep + 1;
                      _optionsStreamController.add(activeStep);
                      SchedulerBinding.instance!.addPostFrameCallback((_) {
                        if (_controller.hasClients) {
                          _controller.animateTo(
                            0.0,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 0),
                          );
                        }
                      });
                    });
                  }, (){
                        Navigator.pushNamed(context, MarkRoutes.mark).then((value) => {
                          widget._stateManger.getSecondOption(_shipmentRequestModel.transportationType, _shipmentRequestModel.isExternalWarehouse)
                        });
                  });
                } else {
                  return ThirdOption(shipmentRequest:
                      _shipmentRequestModel,
                      goReceiverPage: (){
                        Navigator.pushNamed(context, ReceiverRoutes.Receiver).then((value) => {
                          widget._stateManger.getThirdOption()
                        });
                      },
                      stateManger: widget._stateManger,
                      goBackStep:(){
                    setState(() {
                      activeStep = activeStep - 1;
                      _optionsStreamController.add(activeStep);

                      SchedulerBinding.instance!.addPostFrameCallback((_) {
                        if (_controller.hasClients) {
                          _controller.animateTo(
                            0.0,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 0),
                          );
                        }
                      });
                    });
                  });
                }
              },
            ),
            // Align(
            //   alignment: AlignmentDirectional.bottomEnd,
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         activeStep == 0
            //             ? Container()
            //             : Align(
            //             alignment: AlignmentDirectional.bottomStart,
            //             child: FloatingActionButton.extended(
            //               onPressed: () {
            //                 print("requetsModel" +_shipmentRequestModel.toString());
            //                 setState(() {
            //                   activeStep = activeStep - 1;
            //                   _optionsStreamController
            //                       .add(activeStep);
            //
            //                   SchedulerBinding.instance!.addPostFrameCallback((_) {
            //                     if (_controller.hasClients) {
            //                       _controller.animateTo(
            //                         0.0,
            //                         curve: Curves.easeOut,
            //                         duration: const Duration(milliseconds: 0),
            //                       );
            //                     }
            //                   });
            //
            //                   // WidgetsBinding.instance!
            //                   //     .addPostFrameCallback((_) {
            //                   //   _controller
            //                   //       .animateTo(
            //                   //       0.0,
            //                   //       duration: Duration(microseconds: 1),
            //                   //       curve: Curves.easeOut);
            //                   // });
            //                 }
            //                 );
            //               },
            //               label: Text('Back'),
            //               icon: Icon(
            //                 Icons.arrow_back,
            //               ),
            //             )),
            //         activeStep == 2
            //             ? Container()
            //             : Align(
            //             alignment: AlignmentDirectional.bottomEnd,
            //             child: FloatingActionButton.extended(
            //               onPressed: () {
            //                 print("requetsModel" +_shipmentRequestModel.toString());
            //                 setState(() {
            //                   activeStep = activeStep + 1;
            //                   _optionsStreamController
            //                       .add(activeStep);
            //                   SchedulerBinding.instance!.addPostFrameCallback((_) {
            //                     if (_controller.hasClients) {
            //                       _controller.animateTo(
            //                        0.0,
            //                         curve: Curves.easeOut,
            //                         duration: const Duration(milliseconds: 0),
            //                       );
            //                     }
            //                   });
            //                 });
            //               },
            //               icon: Icon(
            //                 Icons.arrow_forward_outlined,
            //                 // color: bal,
            //               ),
            //               label: Text('Continue'),
            //             )),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      title: S.of(context).requestShipment,
      currentIndex: -1,
      isResultScreen: false,
      isHome: false,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _optionsStreamController.close();
  }
}
