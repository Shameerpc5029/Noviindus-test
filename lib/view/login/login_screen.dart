import 'package:flutter/material.dart';
import 'package:moovbe_bus/common/colors.dart';
import 'package:moovbe_bus/common/sizedbox.dart';
import 'package:moovbe_bus/controller/login/login_controller.dart';
import 'package:moovbe_bus/view/widgets/custom_textbutton.dart';
import 'package:moovbe_bus/view/widgets/textformfield_widget.dart';
import 'package:provider/provider.dart';

final GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context);
    return Consumer<LoginController>(
      builder: (context, value, child) {
        return Form(
          key: formGlobalKey,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: screenSize.size.height * .4,
                        width: double.infinity,
                        color: AppColor.themSecondaryColor,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: screenSize.size.height * .25,
                              ),
                              Text(
                                "Welcome",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 41,
                                  color: AppColor.white,
                                ),
                              ),
                              Text(
                                "Manage your Bus and Drivers",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: AppColor.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 2,
                        left: 20,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(180 / 360),
                          child: ClipPath(
                            clipper: _Triangle(),
                            child: Container(
                              color: AppColor.themePimaryColor,
                              height: 400,
                              width: 550,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormfieldWidegt(
                          validator: (p0) {
                            return value.usernameValidation(p0);
                          },
                          hintText: 'Enter Username',
                          inputType: TextInputType.emailAddress,
                          controller: value.username,
                        ),
                        KSizedBox.kheight20,
                        TextFormfieldWidegt(
                          validator: (p0) {
                            return value.passwordValidation(p0);
                          },
                          hintText: 'Enter Password',
                          inputType: TextInputType.visiblePassword,
                          controller: value.password,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: value.isLoading == true
                  ? const Align(
                      alignment: Alignment.bottomCenter,
                      child: CircularProgressIndicator(),
                    )
                  : CustomTextButton(
                      backgroundColor: AppColor.themePimaryColor,
                      foregroundColor: AppColor.white,
                      onPressed: () {
                        if (formGlobalKey.currentState!.validate()) {
                          formGlobalKey.currentState!.save();
                          value.login(context);
                        }
                      },
                      text: 'Login',
                    ),
            ),
          ),
        );
      },
    );
  }
}

class _Triangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
