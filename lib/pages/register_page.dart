import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_it/get_it.dart';
import 'dart:math';
import 'package:provider/provider.dart';

//services
import '../services/database_service.dart';
import '../services/media_service.dart';
import '../services/cloud_storage_service.dart';

//widget
import '../widgets/custome_input_fields.dart';
import '../widgets/rounded_button.dart';
import '../widgets/rounded_image.dart';

//providers
import '../providers/authentication_provider.dart';

class RegisterPage extends StatefulWidget {
  //const RegisterPage({ Key? key }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late double deviceheight;
  late double devicewidth;

  late Authenticationprovider _auth;
  late DataBaseService _db;
  late CloudStorageService _cloudser;


  String? _email;
  String? _password;
  String? _name;

  String? _profileImage;
  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    _auth = Provider.of<Authenticationprovider>(context);
    _db =  GetIt.instance.get<DataBaseService>();
    _cloudser = GetIt.instance.get<CloudStorageService>();


    deviceheight = MediaQuery.of(context).size.height;
    devicewidth = MediaQuery.of(context).size.width;
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: devicewidth * 0.03, vertical: deviceheight * 0.02),
        height: deviceheight * 0.98,
        width: devicewidth * 0.97,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _profileImageField(),
            SizedBox(
              height: deviceheight * 0.05,
            ),
            _registerForm(),
            SizedBox(
              height: deviceheight * 0.05,
            ),
            _registerButton(),
          ],
        ),
      ),
    );
  }

  Widget _profileImageField() {
    return GestureDetector(
      onTap: () {

       Random random = new Random();
int randomNumber = random.nextInt(70);

          setState(() {

            
            _profileImage = 'https://i.pravatar.cc/400?img=${randomNumber}' ;
          });


        //GetIt.instance.get<MediaService>().pickImageFromLibrary().then((_file) {
          //setState(() {
           // _profileImage = _file;
          //});
       // });
      },
      child: () {
        if (_profileImage != null) {
          return RoundedImageNetwork(
            key: UniqueKey(),
            imagePath: _profileImage!,
            size: deviceheight * 0.15,
          );
        } else {
          return RoundedImageNetwork(
              key: UniqueKey(),
              imagePath: 'https://i.pravatar.cc/400?img=68',
              size: deviceheight * 0.15);
        }
      }(),
    );
  }

  Widget _registerForm() {
    return Container(
      height: deviceheight * 0.35,
      child: Form(
        key: _registerFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomeTextFormField(
                onSaved: (_value) {
                  setState(() {
                    _name = _value;
                  });
                },
                regEx: r".{8,}",
                hintText: "Name",
                obscureText: false),
            CustomeTextFormField(
                onSaved: (_value) {
                  setState(() {
                    _email = _value;
                  });
                },
                regEx:
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                hintText: "Email",
                obscureText: false),
            CustomeTextFormField(
                onSaved: (_value) {
                  setState(() {
                    _password = _value;
                  });
                },
                regEx: r".{8,}",
                hintText: "Password",
                obscureText: true),
          ],
        ),
      ),
    );
  }

  Widget _registerButton() {
    return RoundedButton(
        name: "Register",
        height: deviceheight * 0.065,
        width: devicewidth * 0.65,
        onPressed: () async {

          if (_registerFormKey.currentState!.validate() )
          {
            _registerFormKey.currentState!.save();
            String? _uid = await _auth.registerUSerUsingEmailAndPassword(_email!, _password!);

           String? _imageURL = await _cloudser.saveUserImageToStorage(_uid!, _profileImage!);

          if(_imageURL != null)
            {
              await _db.CreateUser(_uid, _email!, _name!, _imageURL);
            }
            else{
              await _db.CreateUser(_uid, _email!, _name!, _profileImage!);
            }
          }

          await _auth.logout();
          await _auth.loginusingEmailAndPassword(_email!, _password!);



        });
  }
}
