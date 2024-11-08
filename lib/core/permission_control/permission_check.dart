import 'package:permission_handler/permission_handler.dart';

abstract class IPermissionCheck {
  Future<bool> gallery();
  Future<bool> camera();
}

class PermissionCheck extends IPermissionCheck {
  @override
  Future<bool> camera() async {
    final status = await Permission.camera.status;
    return status.isGranted;
  }

  @override
  Future<bool> gallery() async {
    final status = await Permission.photos.status;
    return status.isGranted;
  }
}
