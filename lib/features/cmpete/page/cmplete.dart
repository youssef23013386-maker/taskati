import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/functions/extintion.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/styles/colors.dart';
import 'package:taskati/core/styles/text_styles.dart';
import 'package:taskati/core/widgets/custom_svg_picture.dart';
import 'package:taskati/core/widgets/custom_text_form_field.dart';
import 'package:taskati/core/widgets/dialod.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/core/widgets/tab_buttoon.dart';
import 'package:taskati/features/home/page/home_screen.dart';

class complete_screan extends StatefulWidget {
  const complete_screan({super.key});

  @override
  State<complete_screan> createState() => _complete_screanState();
}

class _complete_screanState extends State<complete_screan> {
  String? path;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Complete Profile")),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            40.h,
            Row(
              children: [
                Text(
                  'Profile Image',
                  style: TextStyles.caption1.copyWith(
                    color: AppColors.sacndaryColor,
                  ),
                ),
              ],
            ),
            _ProfileImage(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabButton(
                  text: 'From Camera',
                  onPressed: () {
                    ImagePicker().pickImage(source: ImageSource.camera).then((
                      image,
                    ) {
                      if (image != null) {
                        setState(() {
                          path = image.path;
                        });
                      }
                    });
                  },
                ),
                Gap(20),
                TabButton(
                  text: 'From Gallery',
                  onPressed: () {
                    ImagePicker().pickImage(source: ImageSource.gallery).then((
                      image,
                    ) {
                      if (image != null) {
                        setState(() {
                          path = image.path;
                        });
                      }
                    });
                  },
                ),
              ],
            ),
            Gap(40),
            Row(
              children: [
                Text(
                  'Your Name',
                  style: TextStyles.caption1.copyWith(
                    color: AppColors.sacndaryColor,
                  ),
                ),
              ],
            ),
            Gap(8),
            CustomTextFormField(controller: controller),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(22, 5, 22, 20),
        child: MainButton(
          text: 'Let’s Start !',
          onPressed: () {
            if (path != null && controller.text.isNotEmpty) {
              pushReplacement(context, HomeScreen());
            } else if (path == null && controller.text.isNotEmpty) {
              ShowErorr(context, 'select profile image');
            } else if (path != null && controller.text.isEmpty) {
              ShowErorr(context, 'pleas write your name');
            } else if (path == null && controller.text.isEmpty) {
              ShowErorr(context, 'fill the information');
            }
          },
        ),
      ),
    );
  }

  Stack _ProfileImage() {
    return Stack(
      children: [
        ClipOval(
          child: path != null
              ? Image.file(
                  File(path!),
                  width: 170,
                  height: 170,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  AppImages.user,
                  width: 170,
                  height: 170,
                  fit: BoxFit.cover,
                ),
        ),
        if (path != null)
          Positioned(
            right: 5,
            bottom: 5,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  path = null;
                });
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.backgroundColor,
                child: CustomSvgPicture(path: AppImages.deleteSvg),
              ),
            ),
          ),
      ],
    );
  }
}
