import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Create a Form widget.
class Userform extends StatefulWidget {
  const Userform({Key key, User user})
      : _user = user,
        super(key: key);
  final User _user;

  @override
  _UserformState createState() => _UserformState();
}

class _UserformState extends State<Userform> {
  User _user;
  final _fieldlabelController = TextEditingController();
  final _mobileNoController = TextEditingController();
  final _adhareNoController = TextEditingController();
  final _drivingLicController = TextEditingController();
  final _pinCodeController = TextEditingController();
  final _fullAddressController = TextEditingController();

  @override
  void iniState() {
    super.initState();
    // _fieldlabelController.addListener(() {
    //   setState(() {});
    // });
  }

  void clearfield(fieldname) {
    setState(() {
      fieldname.clear();
    });
  }

  Widget userField(String fieldlabel, Icon iconname, fieldname, typename) {
    return TextField(
      decoration: InputDecoration(
          labelText: fieldlabel,
          prefixIcon: iconname,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.blue)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.white))
          // suffixIcon: _fieldlabelController.text.isEmpty
          //     ? Container(
          //         width: 0,
          //       )
          //     : IconButton(
          //         onPressed: () => clearfield(_fieldlabelController),
          //         icon: Icon(
          //           Icons.close,
          //           color: Colors.white,
          //         )
          //         )
          ),
      controller: fieldname,
      keyboardType: typename,
      textInputAction: TextInputAction.done,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Detail"),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          padding: EdgeInsets.all(32),
          children: [
            userField("Full Name", Icon(Icons.person), _fieldlabelController,
                TextInputType.name),
            const SizedBox(
              height: 24,
            ),
            userField("Mobile No.", Icon(Icons.phone), _mobileNoController,
                TextInputType.phone),
            const SizedBox(
              height: 24,
            ),
            userField("Adhare No.", Icon(Icons.card_travel_sharp),
                _adhareNoController, TextInputType.number),
            const SizedBox(
              height: 24,
            ),
            userField("Driving Licence", Icon(Icons.car_rental),
                _drivingLicController, TextInputType.number),
            const SizedBox(
              height: 24,
            ),
            userField("Pin Code", Icon(Icons.location_on), _pinCodeController,
                TextInputType.number),
            const SizedBox(
              height: 24,
            ),
            userField("Full Address", Icon(Icons.map), _fullAddressController,
                TextInputType.streetAddress),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(onPressed: null, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
