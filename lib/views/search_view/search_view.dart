import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../doctor_profile_view/doctor_profile_view.dart';

class SearchView extends StatelessWidget {
  final String searchQuery;
  const SearchView({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.blueColor,
        title: AppStyle.bold(title: "Search Results", color: AppColors.white, size: AppSizes.size18),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('doctors').get(),
          // future: FirebaseFirestore.instance.collection('doctors').where('docCategory', isEqualTo: catName).get(),
          builder: (BuildContext contex, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else{
              // var data = snapshot.data?.docs;
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
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext contex, int index){

                      var doc = snapshot.data!.docs[index];

                      return !(doc['docName'].toString().toLowerCase()).contains(searchQuery.toLowerCase()) ? const SizedBox.shrink():
                      GestureDetector(
                        onTap: (){
                          Get.to(() => DoctorProfileView(doc: doc));
                        },
                        child: Container(
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
                                width: 120,
                                alignment: Alignment.center,
                                color: Colors.blue,
                                child: Image.asset(AppAssets.icSignup,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              5.heightBox,
                              AppStyle.normal(title: doc['docName']),
                              5.heightBox,
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
                      );
                    }
                ),
              );
            }
          }),
    );
  }
}
