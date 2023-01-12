import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/feature/login/login_view_modal/login_view_modal.dart';
import 'package:state_management/product/constant/image_enum.dart';
import 'package:kartal/kartal.dart';
import 'package:state_management/product/padding/page_padding.dart';

import '../../../product/utility/input_decoration.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginViewModal _loginViewModal;

  @override
  void initState() {
    _loginViewModal = LoginViewModal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const String name = 'Name';
    const String data = 'login';
    const String data2 = 'Remember Me';
    const String data3 = 'Login';

    return ChangeNotifierProvider.value(
      value: _loginViewModal,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const PagePadding.allLow(),
          child: Column(
            children: [
              AnimatedContainer(
                height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.2),
                duration: context.durationLow,
                child: ImageEnums.door.toImage,
              ),
              Text(data3, style: context.textTheme.headline3),
              TextField(
                decoration: ProjectIntputs(name),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Center(child: Text(data)),
              ),
              CheckboxListTile(
                value: _loginViewModal.isCheckBoxOkay,
                title: Text(data2),
                onChanged: (value) {
                  print(value);
                  _loginViewModal.checkBoxChange(value ?? false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
