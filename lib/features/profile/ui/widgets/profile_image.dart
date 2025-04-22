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
  File? _localImageFile;
  String? _uploadedImageUrl;
  Future<void> _pickCropAndUploadImage(ImageSource source) async {
    final permissionStatus = source == ImageSource.camera
        ? await Permission.camera.request()
        : await Permission.photos.request();
    if (!permissionStatus.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Permission required to access camera/photos"),
      ));
      return;
    }

    final picked = await _picker.pickImage(source: source);
    if (picked == null) return;

    final cropped = await ImageCropper().cropImage(
      sourcePath: picked.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          lockAspectRatio: true,
        ),
        IOSUiSettings(title: 'Crop Image'),
      ],
    );
    if (cropped == null) return;

    setState(() => _localImageFile = File(cropped.path));
    context.read<UpdateUserImageCubit>().uploadImage(File(cropped.path));
  }
  void _showImageSourceOptions() {
    if (!mounted) return;
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
  Future<void> _handleImageUpdate(String newUrl) async {
    await NetworkImage(newUrl).evict();
    setState(() {
      _localImageFile = null;
      _uploadedImageUrl = newUrl;
    });

    final userCubit = context.read<UserCubit>();
    final old = userCubit.state.user;
    if (old != null) {
      final updated = old.copyWith(profileImg: newUrl);
      userCubit.setUser(updated);
      await saveUserDataLocally(updated);
    }
  }
  @override
  void initState() {
    super.initState();
    context.read<UpdateUserImageCubit>().stream.listen((state) {
      state.whenOrNull(success: (data) {
        _handleImageUpdate(data.data.image);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserCubit>().state.user;
    final isLoading = context.watch<UpdateUserImageCubit>().state is Loading;

    ImageProvider provider;
    if (_localImageFile != null) {
      provider = FileImage(_localImageFile!);
    } else if (_uploadedImageUrl != null) {
      provider = NetworkImage(_uploadedImageUrl!);
    } else if (user?.profileImg != null && user!.profileImg!.isNotEmpty) {
      provider = NetworkImage(user.profileImg!);
    } else {
      provider = const AssetImage(AppImages.boyProfileImage);
    }

    return SizedBox(
      width: 160.w,
      height: 160.h,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: 160.w,
            height: 160.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
              border: Border.all(color: Colors.white, width: 4),
              image: DecorationImage(image: provider, fit: BoxFit.cover),
            ),
          ),
          if (isLoading)
            Container(
              width: 160.w,
              height: 160.h,
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
            bottom: 8,
            right: 8,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: _showImageSourceOptions,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    AppImages.changeProfileIcon,
                    width: 36.w,
                    height: 36.h,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
