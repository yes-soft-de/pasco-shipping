
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_receiver/request/receiver_filter_request.dart';
import 'package:pasco_shipping/module_receiver/request/receiver_request.dart';
import 'package:pasco_shipping/module_receiver/response/reciver_response.dart';

@injectable
class ReceiverRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  ReceiverRepository(this._apiClient, this._authService);

  Future<List<ReceiverModel>?> getUserReceiver(ReceiverFilterRequest request) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.USER_RECEIVER ,request.toJson(),
          headers: {'Authorization': 'Bearer $token'});
      ReceiverResponse markResponse =  ReceiverResponse.fromJson(response!);
      List<ReceiverModel>? marks = [];
      if(markResponse.data != null) {
        marks =
            ReceiverResponse.fromJson(response).data;
      }
      return marks;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createReceiver(ReceiverRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.CREATE_RECEIVER, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ReceiverResponse.fromJson(response!).statusCode;
    String? msg = ReceiverResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  // Future<ConfirmResponse?> deleteMark(String id) async {
  //   // await _authService.refreshToken();
  //   var token = await _authService.getToken();
  //   var response = await _apiClient.delete(Urls.MARK+'/'+id,
  //       headers: {'Authorization': 'Bearer $token'});
  //   String? statusCode = ReceiverResponse.fromJson(response!).statusCode;
  //   String? msg = ReceiverResponse.fromJson(response).msg;
  //   if(statusCode =='401'){
  //     return ConfirmResponse(true, msg!);
  //   }else {
  //     return ConfirmResponse(false, msg!);
  //   }
  // }
}