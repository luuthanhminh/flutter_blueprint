import 'package:domain/domain.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/size_extension.dart';

import '../app/app_resouces.dart';
import '../app/setup_locator.dart';
import '../view_models/components_viewmodel.dart';
import '../widgets/screen_widget.dart';

/// Provider hold the logic for Components page
final componentsViewModelProvider = AutoDisposeChangeNotifierProvider(
    (ref) => locator.get<ComponentsViewModel>());

/// Components Page
class ComponentsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // ViewModel init
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read(componentsViewModelProvider).initialize();
      });
      return;
    }, []);
    return ScreenWidget(
        backgroundColor: Color(0xFF141D28),
        body: Container(
            padding: EdgeInsets.only(top: 30.h),
            child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 24.w, right: 24.w),
                          child: Text(
                            'Fringilla vulputate.',
                            style: regularSFTextStyle(
                                size: 24.sp, color: Colors.white),
                          )),
                      SizedBox(height: 20.h),
                      Container(
                          padding: EdgeInsets.only(left: 24.w, right: 24.w),
                          child: Text(
                            'Massa risus.',
                            style: regularSFTextStyle(
                                size: 14.sp, color: Colors.white),
                          )),
                      SizedBox(height: 20.h),
                      _ListComponent(),
                      Container(
                        margin: EdgeInsets.only(
                            left: 24.w, top: 30.h, right: 24.w, bottom: 30.h),
                        height: 50.h,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.r),
                            border: Border.all(
                              color: Color(0xFF065A9A),
                            )),
                        child: Text('Lorem Ipsum',
                            style: boldSFTextStyle(
                                size: 14.sp, color: Colors.white)),
                      )
                    ]))));
  }
}

class _ListComponent extends HookWidget {
  final componentsProvider = Provider.autoDispose(
      (ref) => ref.watch(componentsViewModelProvider).components);

  @override
  Widget build(BuildContext context) {
    final components = useProvider(componentsProvider);
    return ListView.builder(
        itemCount: components.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return _ComponentItemView(components[index], () {
            context
                .read(componentsViewModelProvider)
                .openUrl(components[index].url);
          });
        });
  }
}

class _ComponentItemView extends StatelessWidget {
  final Component _component;
  final Function _itemTapped;
  _ComponentItemView(this._component, this._itemTapped);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF242C35),
      margin: EdgeInsets.only(left: 24.w, top: 16.h, right: 24.w),
      padding:
          EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h, bottom: 16.h),
      child: InkWell(
          onTap: _itemTapped,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
                child: Text(
              _component.text,
              style: regularSFTextStyle(size: 20.sp, color: Colors.white),
            )),
            Container(
                margin: EdgeInsets.only(left: 14.w),
                child: Image.asset(AppIcons.icArrow))
          ])),
    );
  }
}
