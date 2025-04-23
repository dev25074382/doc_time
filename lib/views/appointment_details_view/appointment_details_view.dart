import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/consts/consts.dart';


class AppointmentDetailsView extends StatelessWidget {
  final DocumentSnapshot doc;
  const AppointmentDetailsView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        title: AppStyle.bold(title: doc['appWithName'], color: AppColors.white, size: AppSizes.size20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppStyle.bold(title: "Selected appointment day"),
            5.heightBox,
            AppStyle.normal(title: doc['appDay']),
            20.heightBox,
            AppStyle.bold(title: "Selected appointment time"),
            5.heightBox,
            AppStyle.normal(title: doc['appTime']),
            20.heightBox,
            AppStyle.bold(title: "Contact No:"),
            5.heightBox,
            AppStyle.normal(title: doc['appMobile']),
            20.heightBox,
            AppStyle.bold(title: "Full Name:"),
            5.heightBox,
            AppStyle.normal(title: doc['appName']),
            20.heightBox,
            AppStyle.bold(title: "Message:"),
            5.heightBox,
            AppStyle.normal(title: doc['appMsg']),
          ],
        ),
      ),
    );
  }
}
