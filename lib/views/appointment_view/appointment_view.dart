import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/controllers/appointment_controller.dart';
import 'package:doctor/controllers/auth_controller.dart';
import 'package:doctor/views/appointment_details_view/appointment_details_view.dart';
import 'package:get/get.dart';

class AppointmentView extends StatelessWidget {
  final bool isDoctor;
  const AppointmentView({super.key, this.isDoctor = false});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: AppStyle.bold(title: "Appointments", color: AppColors.white, size: AppSizes.size20),
        actions: [
          IconButton(onPressed: (){
            AuthController().signout();
          }, icon: const Icon(Icons.power_settings_new_rounded))
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: controller.getAppointments(isDoctor),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            var data = snapshot.data?.docs;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: data?.length ?? 0,
                  itemBuilder: (BuildContext contex, int index){
                    return ListTile(
                      onTap: () {
                        Get.to(() => AppointmentDetailsView(doc: data[index],));
                      },
                      leading: CircleAvatar(child: Image.asset(AppAssets.icLogin),),
                      title: AppStyle.bold(title: data![index][isDoctor ? 'appWithName' : 'appName']),
                      subtitle: AppStyle.normal(
                          title: "${data[index]['appDay']} - ${data[index]['appTime']}",
                          color: AppColors.textColor.withOpacity(0.5)),
                    );
                  }
              ),
            );
          }
        },
      )
    );
  }
}
