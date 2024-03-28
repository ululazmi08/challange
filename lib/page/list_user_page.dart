import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pegawai/controller/user_controller.dart';
import 'package:pegawai/page/widget/card_user.dart';
import 'package:pegawai/page/widget/dialog_add_user.dart';
import 'package:pegawai/utilities/colors.dart';
import 'package:pegawai/utilities/component.dart';
import 'package:pegawai/utilities/typography.dart';
import 'package:pegawai/widget/appbar_default.dart';

class ListUserPage extends StatelessWidget {
  ListUserPage({super.key});

  UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AppBarDefault(
            title: 'Daftar Pegawai',
            withLeading: true,
            actions: [
              IconButton(
                icon: Icon(Icons.sort),
                onPressed: () {
                  if (controller.boolAtoZ.value == false) {
                    controller.sortList();
                  } else {
                    controller.cancelSort();
                  }
                },
              ),
            ],
          ),
          TextField(
            onChanged: (value) {
              controller.search(value);
            },
            decoration: InputDecoration(
              hintText: 'Search user name ..',
            ),
          ),
          // controller.showSort.value ?
          // Container(
          //   width: Get.width,
          //   decoration: BoxDecoration(
          //     color: Colors.orange,
          //     boxShadow: [
          //       BoxShadow(
          //         color:
          //         Colors.black.withOpacity(0.3),
          //         spreadRadius: 1,
          //         blurRadius: 5,
          //         offset: Offset(0,
          //             3), // changes position of shadow
          //       ),
          //     ],
          //   ),
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Text('A to z'),
          //       IconButton(
          //         icon: Icon(
          //           Icons.abc_rounded,
          //           color: controller.boolAtoZ.value
          //               ? Colors.orange
          //               : Colors.black,
          //         ),
          //         onPressed: () {
          //
          //         },
          //       )
          //     ],
          //   ),
          // )
          //     : const SizedBox(),
          // controller.showSearch.value ?
          // : const SizedBox(),
          Expanded(
            child: Obx(
              () => controller.loadingListUser.value
                  ? Container(
                      color: Colors.white,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Column(
                          children: [
                            // Obx(
                            //       ()=> ListView.builder(
                            //     shrinkWrap: true,
                            //     physics: const NeverScrollableScrollPhysics(),
                            //     itemCount: controller.listCity.length,
                            //     itemBuilder: (context, index) {
                            //       var data = controller.listCity[index];
                            //       return Container(
                            //         margin: const EdgeInsets.only(bottom: 10),
                            //         padding: const EdgeInsets.all(12),
                            //         decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(8),
                            //             color: Colors.greenAccent),
                            //         child: Column(
                            //           crossAxisAlignment:
                            //           CrossAxisAlignment.start,
                            //           children: [
                            //             CheckboxListTile(
                            //               title: Text(data.name),
                            //               value: controller.selectedCities.contains(data.name),
                            //               onChanged: (value) {
                            //                 if (value!) {
                            //                   controller.selectedCities.add(data.name.toLowerCase());
                            //                 } else {
                            //                   controller.selectedCities.remove(data.name);
                            //                 }
                            //                 // Panggil filterByCity setiap kali perubahan terjadi pada selectedCities
                            //                 controller.filterByCity();
                            //               },
                            //             ),
                            //           ],
                            //         ),
                            //       );
                            //     },
                            //   ),
                            // ),
                            Obx(
                              () => ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.sortListUser.length,
                                itemBuilder: (context, index) {
                                  var data = controller.sortListUser[index];
                                  return CardUser(data: data);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.blue,
        onPressed: () {
          Get.dialog(
              barrierDismissible: false,
              Dialog(backgroundColor: Colors.white, child: DialogAdduser()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
