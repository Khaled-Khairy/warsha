import 'package:warsha/core/helpers/common_imports.dart';

class BuyNowRequest {
  final String serialNumber;
  final File imageFile;

  BuyNowRequest({
    required this.serialNumber,
    required this.imageFile,
  });

  Future<FormData> toFormData() async {
    return FormData.fromMap(
      {
        'serial_number': serialNumber,
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.uri.pathSegments.last,
        ),
      },
    );
  }
}
