import 'package:doctor/controllers/auth_controller.dart';
import 'package:doctor/res/components/custom_button.dart';
import 'package:doctor/res/components/custom_textfield.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/views/appointment_view/appointment_view.dart';
import 'package:doctor/views/signup_view/signup_view.dart';
import 'package:get/get.dart';

import 'ForgotPasswordView.dart';
import 'home_view/home.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  var isDoctor = false;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      body: Container(
        //margin: const EdgeInsets.only(top: 40),
        //padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                      // decoration: const BoxDecoration(
                      //     gradient: LinearGradient(stops: [0.08,0.91], begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xA30008FF),Color(0xFF00FFCD)])
                      // ),
                      // height: 310,
                      // width: 1375,
                      child: Image.asset(
                        AppAssets.icLogo,
                        width: 2000,
                      ),
                    ),
                    Container(
                      width: 1000,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(stops: [0.08,0.91], begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF1F3949),Color(0xFF3A5A7B)])
                      ),
                      child: AppStyle.bold(title: AppStrings.welcomeBack, size: AppSizes.size20, alignment: TextAlign.center, color: AppColors.white),
                    ),
                    Container(
                      width: 1380,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(stops: [0.08,0.91], begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF1F3949),Color(0xFF3A5A7B)])
                      ),
                      child: AppStyle.bold(title: AppStrings.weAreExcited, alignment: TextAlign.center, color: AppColors.white),
                    )
                  ],
                )),
              ],
            ),
            30.heightBox,
            Expanded(
                child: Form(
                    child: SingleChildScrollView(
                        child: Column(
              children: [
                CustomTextfield(hint: AppStrings.email, textController: controller.emailController,),
                20.heightBox,
                CustomTextfield(hint: AppStrings.password, textController: controller.passwordController,),
                10.heightBox,
                SwitchListTile(value: isDoctor, onChanged: (newValue){
                  setState(() {
                    isDoctor = newValue;
                  });
                },title: "Sign is as a Doctor".text.make(),),
                20.heightBox,
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const ForgotPasswordView());
                    },
                    child: AppStyle.normal(title: AppStrings.forgetPassword),
                  ),
                ),
                20.heightBox,
                CustomButton(buttonText: AppStrings.login,
                    onTap: () async{
                  await controller.loginUser();
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
                    AppStyle.normal(title: AppStrings.dontHaveAccount),
                    20.widthBox,
                    GestureDetector(
                      onTap: (){
                        Get.to(()=>const  SignupView());
                      },
                      child: AppStyle.bold(title: AppStrings.signup),
                    )
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
