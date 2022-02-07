import 'package:flutter/material.dart';
import 'package:three_t_fashion/constants.dart';
import 'package:three_t_fashion/data_sources/api_taikhoan.dart';
import 'package:three_t_fashion/models/account.dart';
import 'account_information.dart';

class Body extends StatelessWidget {
  final idTaiKhoan;
  const Body(this.idTaiKhoan, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<Account>(
            future: ApiServicesTaiKhoan().layThongTinTaiKhoan(idTaiKhoan),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              return snapshot.hasData
                  ? AccountInformation(
                      snapshot.data!.diachi!,
                      snapshot.data!.email,
                      snapshot.data!.hoten!,
                      snapshot.data!.sdt!,
                      snapshot.data!.id!,
                      snapshot.data!.ngaysinh!)
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
          const SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
// FormCheckout(snapshot.data!.diachi!, snapshot.data!.hoten!,
//                       snapshot.data!.sdt!, snapshot.data!.id!)
