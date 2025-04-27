import 'package:dio/dio.dart';

class CreateMessageRequestBody {
  final String? message;
  final List<MultipartFile>? images;
  final MultipartFile? audio;

  CreateMessageRequestBody({
    this.message,
    this.images,
    this.audio,
  });

  FormData toFormData() {
    final formData = FormData();

    if (message != null && message!.isNotEmpty) {
      formData.fields.add(MapEntry('message', message!));
    }

    if (images != null && images!.isNotEmpty) {
      for (var image in images!) {
        formData.files.add(MapEntry('images', image));
      }
    }

    if (audio != null) {
      formData.files.add(MapEntry('audio', audio!));
    }

    return formData;
  }
}
