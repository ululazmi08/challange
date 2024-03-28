import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pegawai/controller/user_controller.dart';
import 'package:pegawai/utilities/colors.dart';
import 'package:pegawai/utilities/component.dart';
import 'package:pegawai/utilities/typography.dart';

class DialogAdduser extends StatelessWidget {
  DialogAdduser({Key? key}) : super(key: key);

  UserController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kColorWhite,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add User',
                    style: TStyle.w500.copyWith(fontSize: 16),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close,
                      color: kColorBlack,
                    ),
                  )
                ],
              ),
              Text('Name'),
              TextFormField(
                controller: controller.nameController.value,
                decoration: kDecorationForm.copyWith(hintText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              Text('Address'),
              TextFormField(
                controller: controller.addressController.value,
                decoration: kDecorationForm.copyWith(hintText: 'Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Address tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              Text('Email'),
              TextFormField(
                controller: controller.emailController.value,
                decoration:
                kDecorationForm.copyWith(hintText: 'email@email.com'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  if (!value.contains('@')) {
                    return 'Format email tidak sesuai benar';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              Text('Phone Number'),
              TextFormField(
                controller: controller.phoneNumberController.value,
                decoration:
                kDecorationForm.copyWith(hintText: '081234567890'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(13)
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone number tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              Text('City'),
              TextFormField(
                controller: controller.cityController.value,
                decoration: kDecorationForm.copyWith(hintText: 'City'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'City tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        controller.addUser();
                      },
                      color: kColorBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Text(
                        'Submit',
                        style: TStyle.w600
                            .copyWith(fontSize: 15, color: kColorWhite),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}
