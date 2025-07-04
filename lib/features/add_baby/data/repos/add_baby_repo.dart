import 'dart:io';
import 'package:care_nest/core/networking/server_result.dart';
import 'package:care_nest/features/add_baby/data/models/add_baby/add_baby_request_body.dart';
import 'package:care_nest/features/add_baby/data/models/add_baby/add_baby_response.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/server_error_handler.dart';
import 'package:dio/dio.dart';

class AddBabyRepo {
  final ApiService _apiService;

  AddBabyRepo(this._apiService);

  Future<ServerResult<AddBabyResponse>> addBaby(
      AddBabyRequestBody addBabyRequestBody, String token) async {
    try {
     
      final formData = FormData.fromMap({
        'name': addBabyRequestBody.name,
        'weightEntry': addBabyRequestBody.weightEntry.toString(),
        'heightEntry': addBabyRequestBody.heightEntry.toString(),
        'dateOfBirthOfBaby': addBabyRequestBody.dateOfBirthOfBaby,
        'gender': addBabyRequestBody.gender,
      });

      
      if (addBabyRequestBody.image != null) {
        print('Processing image: ${addBabyRequestBody.image!.path}'); // Debug print
        
        // Check if file exists
        if (!await addBabyRequestBody.image!.exists()) {
          throw Exception('Image file does not exist');
        }
        
        // Get file extension to determine content type
        String fileName = addBabyRequestBody.image!.path.split('/').last;
        String extension = fileName.split('.').last.toLowerCase();
        
        // Validate file extension
        List<String> allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
        if (!allowedExtensions.contains(extension)) {
          throw Exception('Invalid image format. Allowed formats: ${allowedExtensions.join(', ')}');
        }
        
        // Determine content type based on file extension
        String contentType;
        switch (extension) {
          case 'jpg':
          case 'jpeg':
            contentType = 'image/jpeg';
            break;
          case 'png':
            contentType = 'image/png';
            break;
          case 'gif':
            contentType = 'image/gif';
            break;
          case 'webp':
            contentType = 'image/webp';
            break;
          default:
            contentType = 'image/jpeg'; // default
        }
        
        // Check file size (max 5MB)
        int fileSize = await addBabyRequestBody.image!.length();
        if (fileSize > 5 * 1024 * 1024) { // 5MB
          throw Exception('Image file is too large. Maximum size is 5MB');
        }
        
        print('Adding image to FormData: $fileName, contentType: $contentType'); // Debug print
        
        formData.files.add(MapEntry(
          'image',
          await MultipartFile.fromFile(
            addBabyRequestBody.image!.path,
            filename: fileName,
            contentType: DioMediaType.parse(contentType),
          ),
        ));
      }

      final response = await _apiService.addNewBaby(
        formData,
        token,
      );
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
