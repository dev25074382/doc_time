import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/consts/lists.dart';
import 'package:doctor/controllers/home_controller.dart';
import 'package:doctor/res/components/custom_textfield.dart';
import 'package:doctor/views/category_details_view/category_details_view.dart';
import 'package:doctor/views/doctor_profile_view/doctor_profile_view.dart';
import 'package:doctor/views/search_view/search_view.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.blueColor,
        title: AppStyle.bold(title: "${AppStrings.welcome} User", color: AppColors.white, size: AppSizes.size18),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              color: AppColors.blueColor,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextfield(
                      textController: controller.searchQueryController,
                      hint: AppStrings.search,
                      borderColor: AppColors.white,
                      textColor: AppColors.white,
                      inputColor: AppColors.white,
                    ),
                  ),
                  10.widthBox,
                  IconButton(onPressed: (){
                    Get.to(() => SearchView(searchQuery: controller.searchQueryController.text));
                  },
                      icon: Icon(Icons.search, color: AppColors.white,)),
                ],
              ),
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (BuildContext contex, int index){
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => CategoryDetailsView(catName: iconsTitleList[index]));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.blueColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(right: 8),
                              child:Column(
                                children: [
                                  Image.asset(
                                    iconsList[index],
                                    width: 30,
                                  ),
                                  0.8.heightBox,
                                  AppStyle.normal(title: iconsTitleList[index], color: AppColors.white, size: AppSizes.size14),
                                ],
                              ),
                          ),
                          );
                        }
                            ,
                  )
                  ),
                  25.heightBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppStyle.bold(title: "Popular Doctors", color: AppColors.blueColor, size: AppSizes.size22),
                  ),
                  10.heightBox,
                  FutureBuilder<QuerySnapshot>(
                      future: controller.getDoctorList(),
        
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                        if(!snapshot.hasData){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }else{
                          var data = snapshot.data?.docs;
                          return SizedBox(
                            height: 170,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: data?.length ?? 0,
                              itemBuilder: (BuildContext contex, int index){
                                return GestureDetector(
                                  onTap: (){
                                    Get.to(() => DoctorProfileView(doc: data[index]));
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
                                      children: [
                                        Container(
                                          width: 150,
                                          alignment: Alignment.center,
                                          color: Colors.blue,
                                          child: Image.asset(AppAssets.icDoctor,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        5.heightBox,
                                        AppStyle.normal(title: data![index]['docName']),
                                        5.heightBox,
                                        AppStyle.normal(title: data[index]['docCategory'], color: Colors.black54),
        
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                  ),
        
                  5.heightBox,
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AppStyle.normal(title: "View All", color: AppColors.blueColor),
                    ),
                  ),
                  0.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, (index) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Image.asset(AppAssets.icBody, width: 25, color: AppColors.white,),
                          5.heightBox,
                          AppStyle.bold(title: "Lab Tests", color: AppColors.white)
                        ],
                      ),
                    )
                    )
                  )
                ],
              ),
            )],
        ),
      ),
    );
  }
}
