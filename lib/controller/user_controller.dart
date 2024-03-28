import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegawai/model/city_model.dart';
import 'package:pegawai/model/user_model.dart';
import 'package:pegawai/services/user_service.dart';

class UserController extends GetxController {
   var listUser = <UserModel>[].obs;
   var listCity = <CityModel>[].obs;
   var sortListUser = <UserModel>[].obs;
   var loadingListUser = false.obs;
   var boolAtoZ = false.obs;
   var showSort = false.obs;
   var showSearch = false.obs;
   var selectedCities = <String>[].obs; // Kota yang dipilih

   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

   var nameController = TextEditingController().obs;
   var emailController = TextEditingController().obs;
   var phoneNumberController = TextEditingController().obs;
   var cityController = TextEditingController().obs;
   var addressController = TextEditingController().obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getListUser();
    getCity();
  }

  void getListUser()async{
    loadingListUser.value = true;
    try{
      var data = await UserService.listUser();
      if(data != null) {
        var dataUser = data as List;
        List<UserModel> list = dataUser.map((item) => UserModel.fromJson(item)).toList();
        listUser.value = list;
        sortListUser.assignAll(list); // Menyalin data ke list pengurutan
        loadingListUser.value = false;
        print('Successed getListUser');
      }
    }catch(e){
      loadingListUser.value = true;
      print('Error getList User : $e');
    }
  }

   void getCity()async{
     loadingListUser.value = true;
     try{
       var data = await UserService.listCity();
       if(data != null) {
         var dataCity = data as List;
         List<CityModel> list = dataCity.map((item) => CityModel.fromJson(item)).toList();
         listCity.value = list;
         loadingListUser.value = false;
         print('Successed getCity');
       }
     }catch(e){
       loadingListUser.value = true;
       print('Error getCity : $e');
     }
   }

  void addUser()async{
    if(formKey.currentState!.validate()) {
      Get.dialog(Center(
        child: CircularProgressIndicator(),
      ));
      try{
        var data = await UserService.addUser(nameController.value.text, addressController.value.text, emailController.value.text, phoneNumberController.value.text, cityController.value.text);
        if(data != null) {
          Get.back();
          Get.back();
          getListUser();
          Get.dialog(Dialog(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Add User Berhasil'),
            ],
          ),));

          print('Successed Added User');
        }
      }catch(e){
        Get.back();
        Get.dialog(Dialog(child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Error Add User : $e'),
          ],
        ),));
        print('Error Add User : $e');
      }
    }
  }

   // void sortUsersByName() {
   //   boolAtoZ.value = !boolAtoZ.value;
   //   if (boolAtoZ.value) {
   //     listUser.sort((a, b) => a.name.compareTo(b.name));
   //     // listUser.assignAll(originalListUser);
   //   }
   //   // else {
   //   //   listUser.assignAll(originalListUser);
   //   // }
   // }

   void sortList() {
     sortListUser.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
     boolAtoZ.value = true; // Menandai bahwa list telah diurutkan
   }

   void cancelSort() {
     sortListUser.assignAll(listUser); // Mengembalikan data pengurutan ke data asli
     boolAtoZ.value = false; // Menandai bahwa list telah dibatalkan pengurutannya
   }

   void search(String query) {
     if (query.isEmpty) {
       // Jika query kosong, tampilkan seluruh list
       sortListUser.assignAll(listUser);
     } else {
       // Jika query tidak kosong, filter list berdasarkan query
       var result = listUser.where((user) => user.name.toLowerCase().contains(query.toLowerCase())).toList();
       sortListUser.assignAll(result);
     }
   }

   void filterByCity() {
     if (selectedCities.isEmpty) {
       // Jika tidak ada kota yang dipilih, tampilkan semua pengguna
       sortListUser.assignAll(listUser);
     } else {
       // Jika ada kota yang dipilih, filter pengguna berdasarkan kota yang dipilih
       var result = listUser.where((user) => selectedCities.toString().toLowerCase().contains(user.city)).toList();
       sortListUser.assignAll(result);
     }
   }

}