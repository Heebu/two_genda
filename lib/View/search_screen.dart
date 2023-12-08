import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:two_genda/Reuseables/header_texts.dart';

import '../Reuseables/my_buttons.dart';
import '../ViewModel/search_screen_viewmodel.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SearchScreenViewModel(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: const HeaderText1(
                text: 'Search',
              ),
              actions: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/profile_picture/logo.png'),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.search),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              //height: 0.h,
                              width: MediaQuery.sizeOf(context).width / 1.5,
                              child: Center(
                                child: TextField(
                                  onChanged: (value) {},
                                  decoration: const InputDecoration(
                                      hintText: 'Find Live contents',
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.h, horizontal: 10.w),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade900,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Text(
                                    'Search',
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.white),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Wrap(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 3.w),
                            height: 210.h,
                            width: MediaQuery.sizeOf(context).width / 2.2,
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 5.w),
                            decoration: BoxDecoration(
                                // color: Colors.orange,
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const LiveButton(),
                                    const Spacer(),
                                    CircleAvatar(
                                      radius: 18.r,
                                      backgroundImage: AssetImage(
                                          'assets/profile_picture/profile_picture.png'),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 230.w / 2,
                                  height: 155.h / 2,
                                  color: Colors.green,
                                ),
                                ListTile(
                                  leading: CircleAvatar(
                                      radius: 25.r / 2,
                                      backgroundColor: Colors.red,
                                      child: CircleAvatar(
                                        radius: 23.r / 2,
                                        backgroundColor: Colors.blue,
                                        backgroundImage: AssetImage(
                                            'assets/profile_picture/profile_picture.png'),
                                      )),
                                  title: Text(
                                    'Tips on how to eat under pressure',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Text(
                                    '2.1k watching',
                                    style: TextStyle(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 3.w),
                            height: 210.h,
                            width: MediaQuery.sizeOf(context).width / 2.2,
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 5.w),
                            decoration: BoxDecoration(
                                // color: Colors.orange,
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const LiveButton(),
                                    const Spacer(),
                                    CircleAvatar(
                                      radius: 18.r,
                                      backgroundImage: AssetImage(
                                          'assets/profile_picture/profile_picture.png'),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 230.w / 2,
                                  height: 155.h / 2,
                                  color: Colors.green,
                                ),
                                ListTile(
                                  leading: CircleAvatar(
                                      radius: 25.r / 2,
                                      backgroundColor: Colors.red,
                                      child: CircleAvatar(
                                        radius: 23.r / 2,
                                        backgroundColor: Colors.blue,
                                        backgroundImage: AssetImage(
                                            'assets/profile_picture/profile_picture.png'),
                                      )),
                                  title: Text(
                                    'Tips on how to eat under pressure',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Text(
                                    '2.1k watching',
                                    style: TextStyle(
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            )));
  }
}
