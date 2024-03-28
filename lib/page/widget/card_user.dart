import 'package:flutter/material.dart';
import 'package:pegawai/model/user_model.dart';
import 'package:pegawai/utilities/typography.dart';

class CardUser extends StatelessWidget {
  CardUser({required this.data});

  final UserModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
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
  }
}
