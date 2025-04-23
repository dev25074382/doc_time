import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/controllers/appointment_controller.dart';
import 'package:doctor/views/doctor_profile_view/doctor_profile_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryDetailsView extends StatelessWidget {
  final String catName;
  const CategoryDetailsView({super.key, required this.catName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDarkColor,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: AppStyle.bold(title: catName, color: AppColors.white, size: AppSizes.size20),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('doctors').where('docCategory', isEqualTo: catName).get(),
          builder: (BuildContext contex, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else{
              var data = snapshot.data?.docs;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 170,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: data?.length??0,
                    itemBuilder: (BuildContext contex, int index){
                      return Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: AppColors.bgDarkColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.only(right: 5),
                        height: 100,
                        width: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150,
                              alignment: Alignment.center,
                              color: Colors.blue,
                              child: Image.asset(AppAssets.icSignup,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            5.heightBox,
                            AppStyle.normal(title: data![index]['docName']),
                            5.heightBox,
                            VxRating(
                              selectionColor: AppColors.yellow6Color,
                              onRatingUpdate: (value) {},
                              maxRating: 5,
                              count: 5,
                              value: double.parse(data[index]['docRating'].toString()),
                              stepInt: true,
                            ),
                          ],
                        ),
                      ).onTap(() {
                        Get.to(() => DoctorProfileView(doc: data[index]));
                      });
                    }
                ),
              );
            }
          })
    );
  }
}
