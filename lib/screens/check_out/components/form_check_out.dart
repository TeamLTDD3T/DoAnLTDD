import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:three_t_fashion/data_sources/api_thanhtoan.dart';
import 'package:three_t_fashion/screens/check_out/function/check_information.dart';
import 'package:three_t_fashion/screens/home/home_screen.dart';
import 'package:three_t_fashion/screens/login/login_screen.dart';
import 'package:three_t_fashion/screens/order/order_screen.dart';

class FormCheckout extends StatefulWidget {
  final int idTaiKhoan;
  final String phone;
  final String address;
  final String fullname;
  const FormCheckout(
    this.address,
    this.fullname,
    this.phone,
    this.idTaiKhoan, {
    Key? key,
  }) : super(key: key);
  @override
  _FormCheckoutState createState() => _FormCheckoutState();
}

class _FormCheckoutState extends State<FormCheckout> with InputValidationMixin {
  final GlobalKey<FormState> _frmKey = GlobalKey<FormState>();
  final txtNote = TextEditingController();
  final txtFullname = TextEditingController();
  final txtPhone = TextEditingController();
  final txtAddress = TextEditingController();

  @override
  void initState() {
    super.initState();
    txtFullname.text = widget.fullname;
    txtPhone.text = widget.phone;
    txtAddress.text = widget.address;
    txtNote.text = '';
  }

  final payment = ['Payment in cash'];
  String? value1 = 'Payment in cash';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: const Text(
            'Confirm order information',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
          const SizedBox(height: 10),
          Form(
            key: _frmKey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: const [
                      Text(
                        'Fullname:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: 350,
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.black),
                  // ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: txtFullname,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      errorStyle:
                          TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold
                              // backgroundColor: Colors.black,
                              ),
                      fillColor: Colors.grey,
                      filled: true,
                      hintText: 'Fullname',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (isFullNameValid(value!) == '') {
                        return null;
                      }
                      return isFullNameValid(value);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: const [
                      Text(
                        'Phone:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: 350,
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.black),
                  // ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: txtPhone,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        errorStyle: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold
                            // backgroundColor: Colors.black,
                            ),
                        fillColor: Colors.grey,
                        filled: true,
                        hintText: 'Phone',
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none),
                    validator: (value) {
                      var kq = isPhoneValid(value!);
                      if (kq == '') {
                        return null;
                      }
                      return kq;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: const [
                      Text(
                        'Address:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: 350,
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.black),
                  // ),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: txtAddress,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      errorStyle:
                          TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold
                              // backgroundColor: Colors.black,
                              ),
                      fillColor: Colors.grey,
                      filled: true,
                      hintText: 'Address',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (isAddressValid(value!) == '') {
                        return null;
                      }
                      return isAddressValid(value);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: const [
                      Text(
                        'Note:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: 350,
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.black),
                  // ),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    minLines: 2,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    controller: txtNote,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      errorStyle:
                          TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold
                              // backgroundColor: Colors.black,
                              ),
                      fillColor: Colors.grey,
                      filled: true,
                      hintText: 'Note',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (isNoteValid(value!) == '') {
                        return null;
                      }
                      return isNoteValid(value);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: const [
                      Text(
                        'Payment Method:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 350,
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: value1,
                      iconSize: 30,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      // isExpanded: true,
                      items: payment.map(buildMenuItem).toList(),
                      onChanged: (value1) =>
                          setState(() => this.value1 = value1),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_frmKey.currentState!.validate()) {
                        _frmKey.currentState!.save();
                        var list = await ApiServicesThanhToan().thanhToan(
                            widget.idTaiKhoan,
                            txtFullname.text,
                            txtAddress.text,
                            txtPhone.text,
                            txtNote.text);
                        if (list.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Notification'),
                              content: const Text('Order Success'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'OK');
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreens(3, widget.idTaiKhoan),
                                        ),
                                        (route) => false);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          String note = '';
                          for (var i = 0; i < list.length; i++) {
                            note = note + list[i] + '\n';
                          }
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Notification'),
                              content: Text(
                                'There are products:\n' +
                                    note +
                                    'In the cart exceed the quantity in stock !',
                                style: const TextStyle(
                                    fontSize: 18, fontStyle: FontStyle.italic),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'OK');
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                    child: const Text(
                      "Order",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(15)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      );
}
