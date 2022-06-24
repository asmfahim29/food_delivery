import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_apps/colors.dart';
import 'package:food_apps/controllers/popular_product_controller.dart';
import 'package:food_apps/controllers/recommended_product_controller.dart';
import 'package:food_apps/models/popular_products_model.dart';
import 'package:food_apps/utils/ap_constants.dart';
import 'package:food_apps/utils/dimensions.dart';
import 'package:food_apps/widgets/app_column.dart';
import 'package:food_apps/widgets/icon_and_text_widget.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  //pageView functionality implementing
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        debugPrint("current page value is $_currentPageValue");
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  // color: Colors.red,
                  height: Dimensions.pageView,
                  //this pageView.builder acts like carouselSlider.
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position,
                            popularProducts.popularProductList[position]);
                      }),
                )
              : CircularProgressIndicator(
                  color: AppColor.mainColor,
                );
        }),

        //dots section
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColor.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          );
        }),

        SizedBox(
          height: Dimensions.height35,
        ),

        //popular text
        Container(
          margin: EdgeInsets.only(
              left: Dimensions.width20, right: Dimensions.width20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
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
                child: SmallText(
                  text: 'Food pairing',
                ),
              ),
            ],
          ),
        ),

        //List of foods and images
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  //if we remove Container we need to give shrinkWrap true
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                          bottom: Dimensions.height10),
                      child: Row(
                        children: [
                          //image section
                          Container(
                            width: Dimensions.listViewImgSize,
                            height: Dimensions.listViewImgSize,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white38,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                //most important lines (xyzList[index]!.img!) ever for fetching network image.
                                image: NetworkImage(
                                  "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${recommendedProduct.recommendedProductList[index]!.img!}",
                                ),
                              ),
                            ),
                          ),

                          //text container
                          Expanded(
                            child: Container(
                              height: Dimensions.listViewTextContSIze,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimensions.radius20),
                                    bottomRight:
                                        Radius.circular(Dimensions.radius20),
                                  ),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: Dimensions.width10,
                                    right: Dimensions.width10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(
                                        text:
                                            'Nutritious food meal in Bangladesh'),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    SmallText(
                                        text:
                                            'With Bangladeshi Characteristics'),
                                    SizedBox(
                                      height: Dimensions.height15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(
                                          icon: Icons.circle_rounded,
                                          iconColor: AppColor.iconColor1,
                                          text: 'Normal',
                                        ),
                                        IconAndTextWidget(
                                          icon: Icons.location_on_rounded,
                                          iconColor: AppColor.mainColor,
                                          text: '1.7km',
                                        ),
                                        IconAndTextWidget(
                                          icon: Icons.access_time_rounded,
                                          iconColor: AppColor.iconColor2,
                                          text: '32min',
                                        ),
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
                  })
              : CircularProgressIndicator(
                  color: AppColor.mainColor,
                );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProductList) {
    //it's a controller
    //Zoomin Zoom-out of the slider y axis
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            //child container takes the whole space of parent container, that's why Parent = 320,
            //child 220 are giving us the same result if we run it. childs height don't nedd.But
            //if we take stack thn we can gave the size of it.
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width15, right: Dimensions.width15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven ? Color(0xff69c5df) : Color(0xff9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${popularProductList.img!}" //(!) Bang operator not be null
                    ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width35,
                  right: Dimensions.width35,
                  bottom: Dimensions.height35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width10,
                    right: Dimensions.width10,
                    top: Dimensions.height15),
                child: AppColumn(
                  text: popularProductList.name!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
