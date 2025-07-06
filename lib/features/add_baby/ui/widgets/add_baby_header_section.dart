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
import '../../logic/add_baby_cubit/add_baby_cubit.dart';

class AddBabyHeaderSection extends StatefulWidget {
  final String? babyName;
  final String? gender;
  final VoidCallback? onEditTap;

  const AddBabyHeaderSection({
    super.key,
    this.babyName,
    this.gender,
    this.onEditTap,
  });

  @override
  State<AddBabyHeaderSection> createState() => _AddBabyHeaderSectionState();
}

class _AddBabyHeaderSectionState extends State<AddBabyHeaderSection> {
  final ImagePicker _picker = ImagePicker();
  File? _localImage;

  Future<void> _pickCropImage(ImageSource source) async {
    final permission = source == ImageSource.camera
        ? await Permission.camera.request()
        : await Permission.photos.request();

    if (!permission.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permission denied')),
      );
      return;
    }

    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile == null) return;

    final cropped = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
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

    if (cropped != null) {
      final imageFile = File(cropped.path);
      setState(() => _localImage = imageFile);
      context.read<AddBabyCubit>().selectImage(imageFile);
    }
  }

  void _showImageOptions() {
    showModalBottomSheet(
      context: context,
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take a photo'),
            onTap: () {
              Navigator.pop(context);
              _pickCropImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Choose from gallery'),
            onTap: () {
              Navigator.pop(context);
              _pickCropImage(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _handleImageUpdate(String newUrl) async {
    await NetworkImage(newUrl).evict();
    context.read<UserCubit>().updateBabyImage(newUrl);
  }

  @override
  void initState() {
    super.initState();
    context.read<AddBabyCubit>().stream.listen((state) {
      state.whenOrNull(addBabysuccess: (data) {
        final babyImage = data.babyData?.babyImage;
        if (babyImage == null || babyImage.isEmpty) {
          context.read<UserCubit>().updateBabyImage(null);
        } else {
          _handleImageUpdate(babyImage);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedImage = context.watch<AddBabyCubit>().selectedImage;
    final imageToShow = _localImage ?? selectedImage;

    String genderImage;
    Color iconColor;
    LinearGradient? iconGradient;

    if (widget.gender == 'Male') {
      genderImage = AppImages.boyProfileImage;
      iconColor = ColorsManager.secondryBlueColor;
    } else if (widget.gender == 'Female') {
      genderImage = AppImages.girlProfileImage;
      iconColor = ColorsManager.primaryPinkColor;
    } else {
      genderImage = AppImages.boyAndGirlImage;
      iconColor = Colors.white;
      iconGradient = const LinearGradient(
        colors: [
          ColorsManager.primaryPinkColor,
          ColorsManager.secondryBlueColor,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
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
                child: imageToShow != null
                    ? Image.file(imageToShow, fit: BoxFit.cover)
                    : Image.asset(genderImage, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 6,
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: _showImageOptions,
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
            ),
            if (imageToShow != null)
              Positioned(
                top: 6,
                right: 6,
                child: GestureDetector(
                  onTap: () {
                    context.read<AddBabyCubit>().clearSelectedImage();
                    setState(() => _localImage = null);
                  },
                  child: Container(
                    width: 24.w,
                    height: 24.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Icon(Icons.close, size: 14.sp, color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
