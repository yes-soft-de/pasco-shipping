import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_home/manager/home_manager.dart';
import 'package:pasco_shipping/module_home/response/home_response.dart';

@injectable
class HomeService{
  final HomeManager _manager;
  HomeService(this._manager);

  Future<StatisticModel?> getStatistic() {
    return _manager.getStatistics();
  }
}