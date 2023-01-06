import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_add_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(
      viewportFraction:
          0.85); // from pageView we can use PageController and viewportFraction makes it scrollable left and right
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8; // 80% of its original size
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    // initState initializes the necessay things that your page needs
    super.initState();
    pageController.addListener(() {
      setState(() {
        // setState is used to notifies our UI that we have a new value updated or a new value been set
        _currPageValue = pageController
            .page!; // page! is the value of the pages and the page value is gotten from our pageController
      });
    });
  }

  @override // dispose means when we leave the page we don't want it to be active otherwise it may have a memory leak
  void dispose() {
    super.dispose(); // dispose is  usually found in stateful widget
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider Section

        Container(
          padding: EdgeInsets.all(8),
          height: Dimensions.pageView, // whole container size
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, index) {
              // we can use index or position [according to our position first one=0 and the last =4] which starts from 0 to itemCount-1== 4 in our case
              return _buildPageItem(index);
            },
          ),
        ),

        // Dots slider

        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),

        // Popular text
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            children: [
              BigText(text: "Popular"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(text: 'Food Pairing'),
              )
            ],
          ),
        ),

        // List of food and images
        ListView.builder( // if you have a ListViw builder the parent container should be given a certain height
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
              child: Row(
                children: [
                  Container(
                    width: Dimensions.listViewImgSize,
                    height: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(                        
                      borderRadius: BorderRadius.circular(                          
                        Dimensions.radius20,                      
                      ),
                      // color: Colors.white38
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image/food0.png'),
                        ),                 

                    ),
                  ),

                  // text container
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewTextContSize,                     
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                         topLeft:Radius.circular(Dimensions.radius20),
                         bottomRight: Radius.circular(Dimensions.radius20) 
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: "Nutritious fruit meal in Kenya"),
                            SizedBox(
                              height: 5,
                              ),
                            SmallText(text: "With Kenyan characteristics"),
                            SizedBox(
                              height: 5,
                              ),
                            Row(                                
                              children: [
                                IconAndTextWidget(
                                    icon: Icons.circle_sharp,
                                    text: "Normal",
                                    iconColor: AppColors.iconColor1),
                                SizedBox(
                                  width: 3,
                                ),
                                IconAndTextWidget(
                                    icon: Icons.location_on,
                                    text: "1.7km",
                                    iconColor: AppColors.mainColor),
                                const SizedBox(
                                  width: 3,
                                ),
                                IconAndTextWidget(
                                    icon: Icons.access_time_rounded,
                                    text: "32min",
                                    iconColor: AppColors.iconColor2)
                              ],
                             )
                          ],
                        ),
                        ),
                    ),
                  )
                  
                ],
              ),
            );
          },
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    // Dart code used used here
    Matrix4 matrix = new Matrix4
        .identity(); // Matrix4 is an api for scaling in flutter and it has x, y and z parameters
    if (index == _currPageValue.floor()) {
      // .floor is used to get a rounded number or figure
      // checks if the index value matches with current page value
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);

      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index + 1) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xFFfcab88) : Color(0xFF5c524f),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/image/food0.png",
                    ))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30, right: Dimensions.width30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'Chinese Side'),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        Wrap(
                            // Wrap usually put things horizontally
                            children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: AppColors.mainColor,
                            size: 15,
                          ),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(text: "4.5"),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(text: "1287"),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(text: "comments"),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        IconAndTextWidget(
                            icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: AppColors.iconColor1),
                        SizedBox(
                          width: 10,
                        ),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            text: "1.7km",
                            iconColor: AppColors.mainColor),
                        SizedBox(
                          width: 10,
                        ),
                        IconAndTextWidget(
                            icon: Icons.access_time_rounded,
                            text: "32 min",
                            iconColor: AppColors.iconColor2)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
