import 'dart:io';
import 'package:bnbit_app/app/app.locator.dart';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:bnbit_app/enums/media_source_type_enum.dart';
import 'package:bnbit_app/enums/permission_type.dart';
import 'package:bnbit_app/services/permissions_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class MediaService {
  final log = getLogger('MediaService');
  final _permissionService = locator<PermissionsService>();

  Future<File?> pickMedia(
      {required MediaSourceType mediaSourceType,
      bool cropImage = false,
      bool isProfilePic = false}) async {
    File? pickedFile;
    switch (mediaSourceType) {
      case MediaSourceType.file:
        if (await _permissionService.checkPermission(PermissionType.media)) {
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.image,
            allowCompression: true,
          );
          pickedFile = result != null
              ? File(result.files.single.path!)
              : throw Exception(
                  'We could not pick the selectedfile. Try again!');
        }

        break;
      case MediaSourceType.camera_image:
        if (await _permissionService.checkPermission(PermissionType.camera)) {
          final result =
              await ImagePicker().pickImage(source: ImageSource.camera);
          pickedFile = await getSelectedFile(result);
        }

        break;
      case MediaSourceType.camera_video:
        final result =
            await ImagePicker().pickVideo(source: ImageSource.camera);
        pickedFile = await getSelectedFile(result);

        break;
      default:
        pickedFile = File('');
    }

    return pickedFile;
  }

  Future<File> getSelectedFile(var result) async {
    return result != null
        ? File(result.path)
        : throw Exception('Some thing went wrong');
  }

  // Future<List> onDownloadImage(String imagePath) async {
  //   return _getApis.downloadImage(imagePath);
  // }
}
