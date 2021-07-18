import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_home/repository/home_repository.dart';
import 'package:pasco_shipping/module_home/response/home_response.dart';

@injectable
class HomeManager{
  final HomeRepository _repository;
  HomeManager(this._repository);

  Future<StatisticModel?> getStatistics() => _repository.getStatistics();
}