import 'package:doctor/controllers/auth_controller.dart';
import 'package:doctor/res/components/custom_button.dart';
import 'package:doctor/res/components/custom_textfield.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/views/home_view/home_view.dart';
import 'package:get/get.dart';

import '../appointment_view/appointment_view.dart';
import '../home_view/home.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  var isDoctor = false;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      body: Container(
        // margin: const EdgeInsets.only(top: 40),
        // padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // color: Colors.blue,
                          // decoration: const BoxDecoration(
                          //     gradient: LinearGradient(stops: [0.08,0.91], begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xA30008FF),Color(0xFF00FFCD)])
                          // ),
                          // height: 300,
                          // width: 1375,
                          child: Image.asset(
                            // alignment: Alignment.centerLeft,
                            AppAssets.icSignup,
                            // height: 200,
                            width: 1200,
                          ),
                        ),
                        // 20.heightBox,
                        Container(
                          width: 1380,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(stops: [0.08,0.91],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFF87CEEB),Color(0xFFB0C4DE)])
                          ),
                          child: AppStyle.bold(title: AppStrings.signupNow, size: AppSizes.size20, alignment: TextAlign.center,),
                        )
                      ],
                    )),
              ],
            ),
            20.heightBox,
            Expanded(
                child: Form(
                    child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomTextfield(
                              hint: AppStrings.fullname,
                              textController: controller.fullnameController,),
                            20.heightBox,
                            CustomTextfield(
                              hint: AppStrings.email,
                              textController: controller.emailController,),
                            20.heightBox,
                            CustomTextfield(
                              hint: AppStrings.password,
                              textController: controller.passwordController,),
                            20.heightBox,
                            SwitchListTile(title: "Sign up as a Doctor".text.make(),value: isDoctor, onChanged: (newValue){
                              setState(() {
                                isDoctor = newValue;
                              });
                            }),
                            Visibility(
                              visible: isDoctor,
                              child: Column(
                                children: [
                                  CustomTextfield(
                                    hint: "About",
                                    textController: controller.aboutController,),
                                  20.heightBox,
                                  CustomTextfield(
                                    hint: "Category",
                                    textController: controller.categoryController,),
                                  20.heightBox,
                                  CustomTextfield(
                                    hint: "Services",
                                    textController: controller.servicesController,),
                                  20.heightBox,
                                  CustomTextfield(
                                    hint: "Address",
                                    textController: controller.addressController,),
                                  20.heightBox,
                                  CustomTextfield(
                                    hint: "Phone Number",
                                    textController: controller.phoneController,),
                                  20.heightBox,
                                  CustomTextfield(
                                    hint: "Timing",
                                    textController: controller.timingController,),
                                  20.heightBox, 
                                ],
                              ),
                            ),

                            20.heightBox,
                            20.heightBox,
                            CustomButton(buttonText: AppStrings.signup,
                                onTap: () async{
                              await controller.signupUser(isDoctor);
                              if(controller.userCredential != null){
                                if(isDoctor){
                                  //signing as a doctor
                                  Get.to(()=>const AppointmentView());
                                }else{
                                  //signing as a user
                                  Get.to(()=>const Home());
                                }
                              }
                            }),
                            20.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppStyle.normal(title: AppStrings.alreadyHaveAccount),
                                20.widthBox,
                                GestureDetector(
                                  onTap: (){
                                    Get.back();
                                  },
                                  child: AppStyle.bold(title: AppStrings.login),
                                ),
                              ],
                            )
                          ],
                        ))))
          ],
        ),
      ),
    );
  }
}
