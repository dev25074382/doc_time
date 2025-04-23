import 'package:doctor/consts/consts.dart';
import 'package:doctor/consts/lists.dart';
import 'package:doctor/controllers/auth_controller.dart';
import 'package:doctor/controllers/settings_controller.dart';
import 'package:doctor/views/login_view.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: AppStyle.bold(title: AppStrings.settings, color: AppColors.white, size: AppSizes.size20),
      ),
      body: Obx(()=>
      controller.isLoading.value ? const
      Center(child: CircularProgressIndicator(),
      )
        : Column(
          children: [
            ListTile(
              leading: CircleAvatar(child: Image.asset(AppAssets.icSignup)),
              title: AppStyle.bold(title: controller.userName.value),
              subtitle: AppStyle.normal(title: controller.email.value),
            ),
            const Divider(),
            10.heightBox,
            ListView(
              shrinkWrap: true,
              children: List.generate(settingsList.length, (index) => ListTile(
                onTap: () async {
                  if(index == 2){
                    AuthController().signout();
                    Get.offAll(() => const LoginView());
                  }
                  if(index == 0){
                    AuthController().forgetpassword(email: controller.email.value);
                    Get.offAll(() => const LoginView());
                  }
                },
                leading: Icon(settingsListIcon[index], color: AppColors.blueColor,),
                title: AppStyle.bold(title: settingsList[index]),
              ))
            )
          ],
        ),
      ),
    );
  }
}
