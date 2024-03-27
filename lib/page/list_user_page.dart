import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pegawai/controller/user_controller.dart';
import 'package:pegawai/utilities/typography.dart';

class ListUserPage extends StatelessWidget {
  ListUserPage({super.key});

  UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('A to z'),
                              IconButton(
                                icon: Icon(
                                  Icons.abc_rounded,
                                  color: controller.boolAtoZ.value
                                      ? Colors.orange
                                      : Colors.black,
                                ),
                                onPressed: () {
                                  controller.sortUsersByName();
                                },
                              )
                            ],
                          ),
                        ),
                        Obx(
                          () =>
                          // controller.boolAtoZ.value
                          //     ? ListView.builder(
                          //         shrinkWrap: true,
                          //         physics: const NeverScrollableScrollPhysics(),
                          //         itemCount: controller.originalListUser.length,
                          //         itemBuilder: (context, index) {
                          //           var data =
                          //               controller.originalListUser[index];
                          //           return Container(
                          //             margin: const EdgeInsets.only(bottom: 10),
                          //             padding: const EdgeInsets.all(12),
                          //             decoration: BoxDecoration(
                          //                 borderRadius:
                          //                     BorderRadius.circular(8),
                          //                 color: Colors.greenAccent),
                          //             child: Row(
                          //               children: [
                          //                 const Icon(
                          //                   Icons.person_outline_rounded,
                          //                   size: 30,
                          //                   color: Colors.black,
                          //                 ),
                          //                 const SizedBox(width: 12),
                          //                 Expanded(
                          //                   child: Column(
                          //                     crossAxisAlignment:
                          //                         CrossAxisAlignment.start,
                          //                     children: [
                          //                       Text(
                          //                         'Nama\t: ${data.name}',
                          //                         style: TStyle.w400
                          //                             .copyWith(fontSize: 12),
                          //                       ),
                          //                       Text(
                          //                         'Email\t: ${data.email}',
                          //                         style: TStyle.w400
                          //                             .copyWith(fontSize: 12),
                          //                       ),
                          //                       Text(
                          //                         'Phone\t: ${data.phoneNumber}',
                          //                         style: TStyle.w400
                          //                             .copyWith(fontSize: 12),
                          //                       ),
                          //                       Text(
                          //                         'City\t: ${data.city}',
                          //                         style: TStyle.w400
                          //                             .copyWith(fontSize: 12),
                          //                       ),
                          //                       Text(
                          //                         'Address\t: ${data.address}',
                          //                         style: TStyle.w400
                          //                             .copyWith(fontSize: 12),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 )
                          //               ],
                          //             ),
                          //           );
                          //         },
                          //       )
                          //     :
                          ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.listUser.length,
                                  itemBuilder: (context, index) {
                                    var data = controller.listUser[index];
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.greenAccent),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.person_outline_rounded,
                                            size: 30,
                                            color: Colors.black,
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Nama\t: ${data.name}',
                                                  style: TStyle.w400
                                                      .copyWith(fontSize: 12),
                                                ),
                                                Text(
                                                  'Email\t: ${data.email}',
                                                  style: TStyle.w400
                                                      .copyWith(fontSize: 12),
                                                ),
                                                Text(
                                                  'Phone\t: ${data.phoneNumber}',
                                                  style: TStyle.w400
                                                      .copyWith(fontSize: 12),
                                                ),
                                                Text(
                                                  'City\t: ${data.city}',
                                                  style: TStyle.w400
                                                      .copyWith(fontSize: 12),
                                                ),
                                                Text(
                                                  'Address\t: ${data.address}',
                                                  style: TStyle.w400
                                                      .copyWith(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
