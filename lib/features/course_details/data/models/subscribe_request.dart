import 'dart:io';

import 'package:dio/dio.dart';

class SubscribeRequest {
  final String serialNumber;
  final File imageFile;

  SubscribeRequest({
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
