
import 'package:pasco_shipping/module_home/response/home_response.dart';

class HomeState{}

class HomeInitState extends HomeState{}

class LoadingHomeState extends HomeState{}

class FetchedHomeSuccessfullyState extends HomeState{
  StatisticModel model;

  FetchedHomeSuccessfullyState(this.model);
}
class ErrorState extends HomeState{
  String message;

  ErrorState(this.message);
}