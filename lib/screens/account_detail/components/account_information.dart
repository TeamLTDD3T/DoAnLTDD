import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:three_t_fashion/data_sources/api_taikhoan.dart';
import 'package:three_t_fashion/screens/account_detail/function/check_information.dart';
import 'package:three_t_fashion/screens/home/home_screen.dart';

class AccountInformation extends StatefulWidget {
  final int idTaiKhoan;
  final String email;
  final String phone;
  final String address;
  final String fullname;
  final String birthday;
  const AccountInformation(this.address, this.email, this.fullname, this.phone,
      this.idTaiKhoan, this.birthday,
      {Key? key})
      : super(key: key);

  @override
  _AccountInformationState createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation>
    with InputValidationMixin {
  final GlobalKey<FormState> _frmKey = GlobalKey<FormState>();
  final txtBirthday = TextEditingController();
  final txtFullname = TextEditingController();
  final txtPhone = TextEditingController();
  final txtAddress = TextEditingController();
  final txtEmail = TextEditingController();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1975),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != txtBirthday)
      setState(() {
        txtBirthday.text = picked.toString().split(' ')[0];
      });
  }

  @override
  void initState() {
    super.initState();
    txtFullname.text = widget.fullname;
    txtPhone.text = widget.phone;
    txtAddress.text = widget.address;
    txtBirthday.text = widget.birthday;
    txtEmail.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
      child: Form(
        key: _frmKey,
        child: Column(
          children: <Widget>[
            const Text(
              'Account information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: txtEmail,
              keyboardType: TextInputType.emailAddress,
              readOnly: true,
              decoration: const InputDecoration(
                fillColor: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: txtFullname,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'Full name',
                fillColor: Colors.grey,
              ),
              validator: (value) {
                if (isFullNameValid(value!) == '') {
                  return null;
                }
                return isFullNameValid(value);
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: txtBirthday,
              readOnly: true,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                hintText: 'Brithday',
                fillColor: Colors.grey,
              ),
              onTap: () => _selectDate(context),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: txtPhone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Phone',
                fillColor: Colors.grey,
              ),
              validator: (value) {
                var kq = isPhoneValid(value!);
                if (kq == '') {
                  return null;
                }
                return kq;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: txtAddress,
              keyboardType: TextInputType.streetAddress,
              decoration: const InputDecoration(
                hintText: 'Address',
                fillColor: Colors.grey,
              ),
              validator: (value) {
                if (isAddressValid(value!) == '') {
                  return null;
                }
                return isAddressValid(value);
              },
            ),
            const SizedBox(height: 10),
            Container(
              width: 350,
              child: ElevatedButton(
                onPressed: () async {
                  if (_frmKey.currentState!.validate()) {
                    _frmKey.currentState!.save();
                    var taiKhoan = await ApiServicesTaiKhoan().capNhatTaiKhoan(
                        txtEmail.text,
                        txtFullname.text,
                        txtBirthday.text,
                        txtAddress.text,
                        txtPhone.text);
                    if (taiKhoan.email != '') {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Notification'),
                          content: const Text('Information update success!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'OK');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        (HomeScreens(3, widget.idTaiKhoan)),
                                  ),
                                );
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Notification'),
                          content: const Text('Information update fail!'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
                child: const Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
