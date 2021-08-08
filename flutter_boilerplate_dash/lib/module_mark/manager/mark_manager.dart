import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_mark/repository/mark_repository.dart';
import 'package:pasco_shipping/module_mark/request/mark_request.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';

@injectable
class MarkManager{
  final MarkRepository _repository;
  MarkManager(this._repository);

  Future<ConfirmResponse?> createMark(MarkRequest request) => _repository.createMark(request);
  Future<ConfirmResponse?> deleteMark(String id) => _repository.deleteMark(id);
  Future<List<Mark>?> getUserMark(userID) => _repository.getUserMark(userID);


}