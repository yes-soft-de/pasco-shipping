import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_upload/manager/upload_manager/upload_manager.dart';
import 'package:pasco_shipping/module_upload/response/imgbb/imgbb_response.dart';

@injectable
class ImageUploadService {
  final UploadManager _manager;

  ImageUploadService(this._manager);

  Future<String?> uploadImage(String filePath) async {
    ImgBBResponse? response = await _manager.upload(filePath);
    if (response == null) {
      print("no response");
      return null;
    } else {
      print("repon in service");
      print(response.url);
      return response.url;
    }
  }
}
