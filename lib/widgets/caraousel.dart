//Carousel widget 
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container customCarousel(BuildContext context,List<Image> items){
  return  Container(
                      height: 120.h,
                      width: MediaQuery.of(context).size.width,
                      //   decoration: redBlackGradient,
                      child: CarouselSlider(
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            aspectRatio: 16 / 9,
                            autoPlay: true,
                            viewportFraction: 0.2.h),
                        items: items,
                      ),
                    );
}