import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/controllers/appointment_controller.dart';
import 'package:doctor/res/components/custom_button.dart';
import 'package:doctor/views/book_appointment_view/book_appointment_view.dart';
import 'package:get/get.dart';

class DoctorProfileView extends StatelessWidget {
  final DocumentSnapshot doc;
  const DoctorProfileView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.bgDarkColor,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: AppStyle.bold(title: "Doctor Details", color: AppColors.white, size: AppSizes.size20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Image.asset(AppAssets.icDoctor),
                    ),
                    11.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppStyle.bold(title: doc['docName'], color: AppColors.textColor, size: AppSizes.size14),
                          AppStyle.bold(
                            title: doc['docCategory'],
                              color: AppColors.textColor.withOpacity(0.5),
                              size: AppSizes.size12),
                          const Spacer(),
                          VxRating(
                            selectionColor: AppColors.yellow6Color,
                            onRatingUpdate: (value) {},
                            maxRating: 5,
                            count: 5,
                            value: double.parse(doc['docRating'].toString()),
                            stepInt: true,
                          ),
                        ],
                      ),
                    ),
                    AppStyle.bold(title: "See all reviews", color: AppColors.blueColor, size: AppSizes.size12),
                  ],
                ),
              ),
              10.heightBox,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.white,
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: AppStyle.bold(title: "Phone Number", color: AppColors.textColor),
                      subtitle: AppStyle.normal(
                        title: doc['docPhone'], color: AppColors.textColor.withOpacity(0.5), size: AppSizes.size12),
                      trailing: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                          child: Icon(Icons.phone, color: AppColors.blueColor,)),
                    ),
                    10.heightBox,
                    AppStyle.bold(title: "About", color: AppColors.textColor, size: AppSizes.size16),
                    5.heightBox,
                    AppStyle.normal(title: doc['docAbout'], color: AppColors.textColor.withOpacity(0.5), size: AppSizes.size14),
                    10.heightBox,
                    AppStyle.bold(title: "Address", color: AppColors.textColor, size: AppSizes.size16),
                    5.heightBox,
                    AppStyle.normal(title: doc['docAddress'], color: AppColors.textColor.withOpacity(0.5), size: AppSizes.size14),
                    10.heightBox,
                    AppStyle.bold(title: "Working Time", color: AppColors.textColor, size: AppSizes.size16),
                    5.heightBox,
                    AppStyle.normal(title: doc['docTiming'], color: AppColors.textColor.withOpacity(0.5), size: AppSizes.size14),
                    10.heightBox,
                    AppStyle.bold(title: "Services", color: AppColors.textColor, size: AppSizes.size16),
                    5.heightBox,
                    AppStyle.normal(title: doc['docService'], color: AppColors.textColor.withOpacity(0.5), size: AppSizes.size14),
          
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(
            buttonText: "Book an appointment",
            onTap: (){
              Get.to(() => BookAppointmentView(
                docId: doc['docId'],
                docName: doc['docName'],
              ));
            }),
      ),
    );
  }
}
