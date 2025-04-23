import 'package:doctor/consts/consts.dart';
import 'package:doctor/controllers/appointment_controller.dart';
import 'package:doctor/res/components/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../../res/components/custom_button.dart';

class BookAppointmentView extends StatelessWidget {
  final String docId;
  final String docName;
  const BookAppointmentView({super.key, required this.docId, required this.docName});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: AppStyle.bold(title: docName, color: AppColors.white, size: AppSizes.size20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyle.bold(title: "Select appointment day"),
              5.heightBox,
              CustomTextfield(hint: "Select day", textController: controller.appDayController,),
              10.heightBox,
              AppStyle.bold(title: "Select appointment time"),
              5.heightBox,
              CustomTextfield(hint: "Select time", textController: controller.appTimeController,),
              20.heightBox,
              AppStyle.bold(title: "Contact No:"),
              5.heightBox,
              CustomTextfield(hint: "Enter your contact no.", textController: controller.appMobileController,),
              20.heightBox,
              AppStyle.bold(title: "Full Name:"),
              5.heightBox,
              CustomTextfield(hint: "Enter your name", textController: controller.appNameController,),
              10.heightBox,
              AppStyle.bold(title: "Message:"),
              5.heightBox,
              CustomTextfield(hint: "Enter your message", textController: controller.appMessageController,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(()=>Padding(
          padding: const EdgeInsets.all(10.0),
          child: controller.isLoading.value
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : CustomButton(
            buttonText: "Book an appointment",
            onTap: () async{
              await controller.bookAppointment(docId, docName, context);
            },),
        ),
      ),
    );
  }
}
