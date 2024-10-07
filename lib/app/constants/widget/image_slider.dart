import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';
import '../../features/dashboard/data_model/dashboard_datamodel.dart';

class ImageSliderLinearIndicator extends StatefulWidget {
  List<DashboardSliderContent> dashboardSliderContent;
  double heightForSlider;

  ImageSliderLinearIndicator({super.key, required this.dashboardSliderContent, required this.heightForSlider});

  @override
  State<ImageSliderLinearIndicator> createState() => _ImageSliderLinearIndicatorState();
}

class _ImageSliderLinearIndicatorState extends State<ImageSliderLinearIndicator> {
  int _currentIndex = 0;

  Widget buildIndicator(int index) {
    return Container(
      width: _currentIndex == index ? 20.0 : 10.0,
      height: 5.0,
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      decoration: BoxDecoration(
        color: _currentIndex == index ? Colors.white : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: widget.dashboardSliderContent.map(
            (e) {
              return Container(
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: AppTheme.appPrimaryColor),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        e.heading!,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        e.data!,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w200),
                      ),
                      const SizedBox(height: 10),
                      Image.asset(
                        e.path!,
                        height: 195,
                        width: 157,
                      )
                    ],
                  ));
            },
          ).toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            aspectRatio: 3,
            height: widget.heightForSlider,
          ),
        ),
        const SizedBox(height: 15),
        Positioned(
          bottom: 10,
          left: MediaQuery.sizeOf(context).width / 2,
          child: Row(
            children: List.generate(
              widget.dashboardSliderContent.length, // Number of carousel items
              (index) => buildIndicator(index),
            ),
          ),
        ),
      ],
    );
  }
}
