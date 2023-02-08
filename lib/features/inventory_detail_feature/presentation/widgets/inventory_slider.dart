import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_images.dart';

class InventorySlider extends StatefulWidget {
  const InventorySlider({Key? key}) : super(key: key);

  @override
  State<InventorySlider> createState() => _InventorySliderState();
}

class _InventorySliderState extends State<InventorySlider> {
  TextEditingController searchbarController = TextEditingController();
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<Widget> imageSliderList = [
    Image.asset(
      AppImages.sliderTest,
      width: 1.sw,
      fit: BoxFit.fitWidth,
    ),
    Image.asset(
      AppImages.sliderTest,
      width: 1.sw,
      fit: BoxFit.fitWidth,
    ),
    Image.asset(
      AppImages.sliderTest,
      width: 1.sw,
      fit: BoxFit.fitWidth,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: 1.sw,
            child: CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                  viewportFraction: 1.5,
                  enlargeCenterPage: true ,
                  scrollDirection: Axis.horizontal,
                  aspectRatio: 2.57,
                  height: 272.h,
                  enableInfiniteScroll: true,
                  initialPage: 1,
                  autoPlay: true,
                  padEnds: false,
                  animateToClosest: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
              items: imageSliderList,
            )),
        _sliderIndicator(context),
      ],
    );
  }

  Widget _sliderIndicator(BuildContext context) {
    return Positioned(
      bottom: 30,
      right: 0,
      left: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageSliderList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 6.0,
              height: 6.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
