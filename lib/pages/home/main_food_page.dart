import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/home/food_page_body.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
// import 'package:food_delivery_app/widgets/big_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is" + MediaQuery.of(context).size.height.toString());
    print("current weight is" + MediaQuery.of(context).size.width.toString());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width14, vertical: Dimensions.height14),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "Kenya", color: AppColors.mainColor),
                      Row(
                        children: [
                          SmallText(
                            text: "Nairobi",
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: Dimensions.width45,
                    height: Dimensions.height45,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor),
                    child: Icon(Icons.search,
                        color: Colors.white,
                        size: Dimensions
                            .iconSize24 // in flutter 24 is usually the default size
                        ),
                  ),
                ],
              ),
              Expanded(child: SingleChildScrollView(
                child: const FoodPageBody()
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
