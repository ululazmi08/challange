import 'package:get/get.dart';
import 'package:pegawai/model/user_model.dart';
import 'package:pegawai/services/user_service.dart';

class UserController extends GetxController {
   var listUser = <UserModel>[].obs;
   var originalListUser = <UserModel>[].obs;
   var loadingListUser = false.obs;
   var boolAtoZ = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getListUser();
  }

  void getListUser()async{
    loadingListUser.value = true;
    try{
      var data = await UserService.listUser();
      if(data != null) {
        var dataUser = data as List;
        List<UserModel> list = dataUser.map((item) => UserModel.fromJson(item)).toList();
        listUser.value = list;
        originalListUser.value = list;
        loadingListUser.value = false;
        print('Successed getListUser');
      }
    }catch(e){
      loadingListUser.value = true;
      print('Error getList User : $e');
    }
  }

   void sortUsersByName() {
     boolAtoZ.value = !boolAtoZ.value;
     if (boolAtoZ.value) {
       listUser.sort((a, b) => a.name.compareTo(b.name));
       // listUser.assignAll(originalListUser);
     }
     // else {
     //   listUser.assignAll(originalListUser);
     // }
   }

}