import 'package:fl_blueprint/app/core/app_resouces.dart';
import 'package:fl_blueprint/app/services/navigation_service.dart';
import 'package:fl_blueprint/app/widgets/widget_util.dart';
import 'package:fl_blueprint/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/page_widget.dart';

/// Screen 2 page
class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageWidget(
        appBar: buildNavigationBar(leadingTapped: () {
          locator.get<NavigationService>().goBack();
        }),
        backgroundColor: Color(0xFF141D28),
        body: Container(
            padding: EdgeInsets.only(top: 30.h, left: 24.w, right: 24.w),
            child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pellentesque nulla enim sed.',
                        style: regularSFTextStyle(
                            size: 24.sp, color: Colors.white),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mattis praesent lorem egestas tellus orci leo.''',
                        style: regularSFTextStyle(
                            size: 14.sp, color: Colors.white),
                      ),
                      SizedBox(height: 28.h),
                      Image.network('https://bosat.vn/gallery/rong-3.jpg',
                          height: 164.h,
                          width: double.infinity,
                          fit: BoxFit.fill),
                      SizedBox(height: 30.h),
                      _buildText(1, 'Mus sed at ligula.'),
                      _buildText(2, 'Tortor sem.'),
                      _buildText(3, 'Quam in nunc nibh mattis in diam.'),
                      SizedBox(height: 24.h),
                      Container(height: 0.5.h, color: Color(0x777E7E7E)),
                      SizedBox(height: 40.h),
                      Image.network('https://bosat.vn/gallery/rong-3.jpg',
                          height: 164.h,
                          width: double.infinity,
                          fit: BoxFit.fill),
                      SizedBox(height: 24.h),
                      _buildText(1, 'A sodales et purus leo.'),
                      _buildText(2, 'Est lorem.'),
                      _buildText(3,
                          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Semper amet viverra non justo a morbi blandit.'''),
                      _buildText(4, 'Lacinia nunc curabitur velit.'),
                      _buildText(5, 'Lacinia non.'),
                      _buildText(5, 'Diam ac molestie.'),
                      _buildText(5, 'Volutpat id sed.'),
                      SizedBox(height: 40.h)
                    ]))));
  }

  Widget _buildText(int number, String text) {
    return Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('${number.toString()}.',
              style: regularSFTextStyle(color: Colors.white, size: 13.sp)),
          SizedBox(width: 12.w),
          Flexible(
              child: Text(text,
                  style: regularSFTextStyle(color: Colors.white, size: 13.sp))),
        ]));
  }
}
