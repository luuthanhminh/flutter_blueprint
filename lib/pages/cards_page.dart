import 'package:fl_blueprint/app/app_resouces.dart';
import 'package:fl_blueprint/view_models/cards_viewmodel.dart';
import 'package:fl_blueprint/widgets/screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:domain/domain.dart' as Domain;

class CardsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // ViewModel init
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read(cardsViewModelProvider).initialize();
      });
      return context.read(cardsViewModelProvider).dispose;
    }, []);
    return ScreenWidget(
        backgroundColor: Color(0xFF141D28),
        body: HookBuilder(builder: (ctx) {
          final cards = useProvider(cardsProvider);
          return Container(
              padding: EdgeInsets.only(top: 30.h),
              child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                            itemCount: cards.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              final card = cards[index];
                              if (card.images.length > 1) {
                                return CarouselCardItemView(card);
                              } else {
                                return SingleCardItemView(card);
                              }
                            }),
                        SizedBox(height: 24.h),
                        Container(
                          padding: EdgeInsets.only(left: 24.w),
                          child: Text(
                            'Sollicitudin in tortor.',
                            style: regularSFTextStyle(
                                size: 24.sp, color: Colors.white),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 24.w, top: 16.h, right: 24.w),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Platea sollicitudin platea habitant senectus. Placerat.',
                            style: regularSFTextStyle(
                                size: 13.sp, color: Color(0xFFA0AEBB)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 24.w, top: 16.h, right: 24.w),
                          height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.r),
                              border: Border.all(
                                color: Color(0x777E7E7E),
                              )),
                          child: InkWell(
                              onTap: () {
                                ctx.read(cardsViewModelProvider).navigateToScreen2();
                              },
                              child: Container(
                                  padding:
                                      EdgeInsets.only(left: 15.w, right: 15.w),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Text('Egestas scleri',
                                                style: regularSFTextStyle(
                                                    size: 13.sp,
                                                    color: Colors.white))),
                                        Image.asset(AppIcons.icArrow)
                                      ]))),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 24.w, top: 16.h, right: 24.w, bottom: 30.h),
                          height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.r),
                              border: Border.all(
                                color: Color(0x777E7E7E),
                              )),
                          child: InkWell(
                              onTap: () {
                                ctx.read(cardsViewModelProvider).navigateToComponentsPage();
                              },
                              child: Container(
                                  padding:
                                      EdgeInsets.only(left: 15.w, right: 15.w),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Text('Consectur',
                                                style: regularSFTextStyle(
                                                    size: 13.sp,
                                                    color: Colors.white))),
                                        Image.asset(AppIcons.icArrow)
                                      ]))),
                        )
                      ])));
        }));
  }
}

class SingleCardItemView extends StatelessWidget {
  final Domain.Card _card;
  SingleCardItemView(this._card);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          padding: EdgeInsets.only(left: 24.w, top: 20.h),
          child: Text(_card.header,
              style: boldSFTextStyle(size: 24.sp, color: Colors.white))),
      SizedBox(height: 16.h),
      Container(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(_card.description,
                        style: regularSFTextStyle(
                            size: 13.sp, color: Color(0xFFA0AEBB))),
                    SizedBox(height: 7.h),
                    Text('Euismod.',
                        style:
                            boldSFTextStyle(size: 14.sp, color: Colors.white))
                  ])),
              Image.asset(AppIcons.icEdit)
            ],
          )),
      SizedBox(height: 24.h),
      Container(
          height: 327.h,
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Image.network(_card.images[0])),
      SizedBox(height: 8.h),
      Container(height: 0.5.h, color: Color(0x777E7E7E))
    ]);
  }
}

class CarouselCardItemView extends StatefulWidget {
  final Domain.Card _card;
  CarouselCardItemView(this._card);
  @override
  State<StatefulWidget> createState() {
    return _CarouselCardItemViewState(_card);
  }
}

class _CarouselCardItemViewState extends State<CarouselCardItemView> {
  final Domain.Card _card;
  int _indicatorCurrentIndex = 0;
  _CarouselCardItemViewState(this._card);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(_card.header,
                        style:
                            boldSFTextStyle(size: 24.sp, color: Colors.white))),
                Row(
                    children: _card.images.map((url) {
                  int index = _card.images.indexOf(url);
                  return Container(
                    width: 6.w,
                    height: 6.h,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0x777E7E7E),
                      ),
                      shape: BoxShape.circle,
                      color: _indicatorCurrentIndex == index
                          ? Color(0xFF0076CE)
                          : Colors.transparent,
                    ),
                  );
                }).toList())
              ],
            )),
        SizedBox(height: 56.h),
        CarouselSlider.builder(
            itemCount: _card.images.length,
            itemBuilder: (_, imageIndex, ___) {
              return Container(
                padding: EdgeInsets.only(right: 11.w),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0x777E7E7E),
                    ),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 24.w, top: 24.h),
                          child: Text(
                            (imageIndex + 1).toString(),
                            style: regularSFTextStyle(
                                size: 56.sp, color: Colors.white),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 24.w, top: 20.h),
                          height: 298.h,
                          child: Image.network(_card.images[imageIndex],
                              fit: BoxFit.fill),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 24.w, top: 49.h),
                          child: Text(
                            'Lorem Ipsum',
                            style: boldSFTextStyle(
                                size: 24.sp, color: Colors.white),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 24.w, top: 12.h, right: 24.w),
                          child: Text(
                            _card.description,
                            style: regularSFTextStyle(
                                size: 14.sp, color: Color(0xFFA0AEBB)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 24.w, top: 18.h),
                          child: Text(
                            'Egestas scelerisque vel.',
                            style: regularSFTextStyle(
                                size: 13.sp, color: Color(0xFF67B4E0)),
                          ),
                        ),
                      ]),
                ),
              );
            },
            options: CarouselOptions(
                height: 588.h,
                viewportFraction: 0.9,
                scrollDirection: Axis.horizontal,
                reverse: false,
                enableInfiniteScroll: false,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _indicatorCurrentIndex = index;
                  });
                })),
        SizedBox(height: 40.h),
        Container(height: 0.5.h, color: Color(0x777E7E7E))
      ],
    );
  }
}
