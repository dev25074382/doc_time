import 'package:doctor/consts/lists.dart';
import 'package:doctor/views/category_details_view/category_details_view.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});
  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        elevation: 0.0,
        title: AppStyle.bold(title: AppStrings.category, size: AppSizes.size18, color: AppColors.white),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 170,
            ),
            itemCount: iconsList.length-1,
            itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap: (){
                  Get.to(() => CategoryDetailsView(catName: iconsTitleList[index],));
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.blueColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          iconsList[index],
                          width: 60,
                          color: AppColors.white,
                        ),
                      ),
                      // const Divider(
                      //   color: Colors.white,
                      // ),
                      25.heightBox,
                      AppStyle.bold(
                        title: iconsTitleList[index],
                        color: AppColors.white,
                        size: AppSizes.size16,
                      ),
                      10.heightBox,
                      AppStyle.normal(
                        title: "13 Specialists",
                        color: AppColors.white.withOpacity(0.5),
                        size: AppSizes.size12,
                      ),
                    ],
                  ),
                ),
              );
            },
        ),
      ),
    );
  }
}
