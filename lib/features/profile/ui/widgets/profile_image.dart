import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/logic/user_cubit/user_cubit.dart';
import '../../logic/update_user_image_cubit/update_user_image_cubit.dart';
import '../../logic/update_user_image_cubit/update_user_image_state.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  Future<void> _pickCropAndUploadImage(ImageSource source) async {
    final permissionStatus = source == ImageSource.camera
        ? await Permission.camera.request()
        : await Permission.photos.request();

    if (!permissionStatus.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Permission required to access ${source == ImageSource.camera ? 'camera' : 'photos'}"),
        ),
      );
      return;
    }

    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile == null) return;

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Image Cropper',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: 'Image Cropper'),
      ],
    );

    if (croppedFile == null) return;

    setState(() {
      _imageFile = File(croppedFile.path);
    });

    context.read<UpdateUserImageCubit>().uploadImage(_imageFile!);
  }

  void _showImageSourceOptions() {
    showModalBottomSheet(
      context: context,
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("Take a photo"),
            onTap: () {
              Navigator.pop(context);
              _pickCropAndUploadImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text("Choose from gallery"),
            onTap: () {
              Navigator.pop(context);
              _pickCropAndUploadImage(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _handleImageUpdate(String newImageUrl) async {
    final userCubit = context.read<UserCubit>();
    final updatedUser = userCubit.state.user?.copyWith(profileImg: newImageUrl);
    if (updatedUser != null) {
      userCubit.setUser(updatedUser);
      await saveUserDataLocally(updatedUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserCubit>().state.user;

    return BlocListener<UpdateUserImageCubit, UpdateUserImageState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (data) async {
           
            await _handleImageUpdate(data.data.image);
          },
        );
      },
      child: BlocBuilder<UpdateUserImageCubit, UpdateUserImageState>(
        builder: (context, state) {
          final isLoading = state is Loading;

          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 130.w,
                height: 130.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                  image: DecorationImage(
                    image:
                        user?.profileImg != null && user!.profileImg!.isNotEmpty
                            ? NetworkImage(user.profileImg!) as ImageProvider
                            : const AssetImage(AppImages.boyProfileImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (isLoading)
                Container(
                  width: 130.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.4),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  ),
                ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: _showImageSourceOptions,
                  child: Image.asset(
                    AppImages.changeProfileIcon,
                    width: 36.w,
                    height: 36.h,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
