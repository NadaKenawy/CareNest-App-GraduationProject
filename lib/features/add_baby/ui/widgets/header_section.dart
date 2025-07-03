import 'dart:io';
import 'package:care_nest/core/theme/colors_manager.dart';
import 'package:care_nest/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/logic/user_cubit/user_cubit.dart';
import '../../../../features/add_baby/logic/update_baby_image_cubit/update_baby_image_cubit.dart';
import '../../../../features/add_baby/logic/update_baby_image_cubit/update_baby_image_state.dart';

class HeaderSection extends StatefulWidget {
  final String? babyName;
  final String? gender;
  final VoidCallback? onEditTap;
  final String? babyId;

  const HeaderSection({
    super.key,
    this.babyName,
    this.gender,
    this.onEditTap,
    this.babyId,
  });

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  final ImagePicker _picker = ImagePicker();
  File? _localImageFile;

  Future<void> _pickCropAndUploadImage(ImageSource source) async {
    final permissionStatus = source == ImageSource.camera
        ? await Permission.camera.request()
        : await Permission.photos.request();

    if (!permissionStatus.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Permission required to access camera/photos")),
      );
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
    context
        .read<UpdateBabyImageCubit>()
        .uploadImage(File(cropped.path), widget.babyId!);
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
    final userCubit = context.read<UserCubit>();
    final old = userCubit.state.user;
    if (old != null) {
      final updated = old.copyWith(babyImage: newUrl);
      userCubit.setUser(updated);
      await saveUserDataLocally(updated);
    }

    setState(() => _localImageFile = null);
  }

  @override
  void initState() {
    super.initState();
    context.read<UpdateBabyImageCubit>().stream.listen((state) {
      state.whenOrNull(success: (data) {
        _handleImageUpdate(data.babyData!.babyImage!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<UpdateBabyImageCubit>().state is Loading;
    final user = context.watch<UserCubit>().state.user;

    String defaultImage;
    Color iconColor;
    LinearGradient? iconGradient;

    if (widget.gender == 'Male') {
      defaultImage = AppImages.boyProfileImage;
      iconColor = ColorsManager.secondryBlueColor;
    } else if (widget.gender == 'Female') {
      defaultImage = AppImages.girlProfileImage;
      iconColor = ColorsManager.primaryPinkColor;
    } else {
      defaultImage = AppImages.boyAndGirlImage;
      iconColor = Colors.white;
      iconGradient = const LinearGradient(
        colors: [
          ColorsManager.primaryPinkColor,
          ColorsManager.secondryBlueColor
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    }

    ImageProvider imageProvider;
    if (_localImageFile != null) {
      imageProvider = FileImage(_localImageFile!);
    } else if (user?.babyImage != null && user!.babyImage!.isNotEmpty) {
      imageProvider = NetworkImage(user.babyImage!);
    } else {
      imageProvider = AssetImage(defaultImage);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 140.w,
              height: 140.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[300]!, width: 4),
              ),
              child: ClipOval(
                child: Image(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            if (isLoading)
              Container(
                width: 140.w,
                height: 140.w,
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
              bottom: 6,
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: _showImageSourceOptions,
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: iconGradient != null
                        ? ShaderMask(
                            shaderCallback: (bounds) =>
                                iconGradient!.createShader(bounds),
                            child: Icon(Icons.edit,
                                size: 16.sp, color: Colors.white),
                          )
                        : Icon(Icons.edit, size: 16.sp, color: iconColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
