import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../Reuseables/header_texts.dart';
import '../Reuseables/my_buttons.dart';
import '../ViewModel/home_screen_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeScreenViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/profile_picture/logo.png'),
            ),
            title: const HeaderText1(text: 'Live'),
            centerTitle: true,
            actions: [
              GestureDetector(
                onTap: () {
                  model.navigateToSearch(context);
                },
                child: AppBarIcon(
                  icon: Icons.search,
                ),
              ),
              GestureDetector(
                onTap: () {
                  model.navigateToCart(context);
                },
                child: AppBarIcon(
                  icon: Icons.card_travel,
                ),
              ),
            ]),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderText2(text: 'Feature'),
                SizedBox(
                  height: 100.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      height: 70.h,
                      width: 70.w,
                      child: Stack(
                        children: [
                          CircleAvatar(
                              radius: 40.r,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 38.r,
                                backgroundColor: Colors.blue,
                                backgroundImage: AssetImage(
                                    'assets/profile_picture/nice_concept.png'),
                              )),
                          const Align(
                            alignment: Alignment.bottomCenter,
                            child: LiveButton(),
                          )
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10.w,
                    ),
                    itemCount: 12,
                  ),
                ),
                //cartegories
                const HeaderText2(text: 'Categories'),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        model.isTouched1();
                      },
                      child: CartButton(
                        text: 'Business',
                        isClicked: model.isBuss,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () {
                        model.isTouched2();
                      },
                      child: CartButton(
                        text: 'Personal',
                        isClicked: model.isPersonal,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),

                Container(
                  height: MediaQuery.sizeOf(context).height / 2,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 3.w),
                            height: 250.h,
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 5.w),
                            decoration: BoxDecoration(
                                // color: Colors.orange,
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const LiveButton(),
                                    Container(
                                      width: 230.w,
                                      height: 155.h,
                                      color: Colors.green,
                                    ),
                                    CircleAvatar(
                                      radius: 20.r,
                                      backgroundImage: AssetImage(
                                          'assets/profile_picture/dark_like.png'),
                                    )
                                  ],
                                ),
                                ListTile(
                                  leading: CircleAvatar(
                                      radius: 25.r,
                                      backgroundColor: Colors.red,
                                      backgroundImage: AssetImage(
                                          'assets/profile_picture/profile_picture.png'),
                                      child: CircleAvatar(
                                        radius: 23.r,
                                        backgroundColor: Colors.blue,
                                      )),
                                  title: Text(
                                    'Tips on how to eat under pressure',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Text(
                                    '2.1k watching',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                // Row(
                                //   children: [
                                //
                                //
                                //     // Column(
                                //     //   children: [
                                //     //     HeaderText3()
                                //     //   ],
                                //     // )
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10.h,
                          ),
                      itemCount: 120),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addLive');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
