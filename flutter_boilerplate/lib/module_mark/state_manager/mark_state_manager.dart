
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_mark/service/mark_service.dart';
import 'package:pasco_shipping/module_mark/ui/state/mark_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class MarkStateManager{
  final MarkService _markService;
  final PublishSubject<MarkState> _stateSubject = PublishSubject();
  Stream<MarkState> get stateStream => _stateSubject.stream;

  MarkStateManager(this._markService);

  void getMyMarks(){
    _stateSubject.add(LoadingMarkState());
    _markService.getMyMarks().then((marks) {
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchMarkState(marks));
      }else {
        _stateSubject.add(ErrorMarkState('error'));
      }
    });

  }

  void deleteMark(String id){
    _stateSubject.add(LoadingMarkState());
    _markService.deleteMark(id).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _markService.getMyMarks().then((marks) {
            if(marks != null) {
              _stateSubject.add(SuccessfullyModifyMarkState(value ,marks));
            }else {
              _stateSubject.add(ErrorMarkState('error'));
            }
          });
        }
      }else {
        _stateSubject.add(ErrorMarkState('error'));
      }
    });
  }
}