import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:two_genda/Reuseables/header_texts.dart';
import '../Reuseables/my_buttons.dart';
import '../ViewModel/video_live_viewmodel.dart';

class VideoLiveScreen extends StatelessWidget {
  const VideoLiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        onViewModelReady: (model) => model.intial(),
        viewModelBuilder: () => VideoLiveViewModel(),
        builder: (context, model, child) => Scaffold(
              body: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 0.46.sp,
                    child: FutureBuilder<void>(
                      future: model.initializeControllerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            model.cameraController!.value.isInitialized) {
                          // If the Future is complete, display the preview
                          return CameraPreview(
                            model.cameraController!,
                          );
                        } else {
                          // Otherwise, display a loading indicator
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          SafeArea(
                              child: model.isVideoRecoding == false
                                  ? Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: AppBarIcon(
                                            icon: (Icons.arrow_back),
                                            color: Colors.grey.shade200
                                                .withOpacity(.3),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  4,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.h, horizontal: 10.w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: Colors.grey.shade200
                                                  .withOpacity(.3)),
                                          child: const HeaderText1(
                                              text: 'Go Live'),
                                        ),
                                        const Spacer(),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            model.startVideo();
                                          },
                                          child: AppBarIcon(
                                            icon: (Icons.arrow_back),
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: 10.w,
                                        // ),
                                        Container(
                                          height: 60.h,
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  1.3,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 3.h, horizontal: 5.w),
                                          decoration: BoxDecoration(
                                              color: Colors.blueGrey.shade100
                                                  .withOpacity(.3),
                                              borderRadius:
                                                  BorderRadius.circular(10.r)),
                                          child: Row(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Tips for cooking under pressure",
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  Text('2.1k watching'),
                                                ],
                                              ),
                                              Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, '/participants');
                                                },
                                                child: AppBarIcon(
                                                  icon: Icons.people,
                                                  color: Colors.purple,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                          const Spacer(),
                          model.isVideoRecoding == false
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        model.enableAudioVoice();
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey.shade200,
                                        radius: 25.r,
                                        child: const Icon(Icons.mic),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    GestureDetector(
                                      onTap: () {
                                        model.saved(context);
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey.shade200,
                                        radius: 30.sp,
                                        child: Icon(
                                          Icons.circle,
                                          color: model.isVideoRecoding == false
                                              ? Colors.red
                                              : Colors.blue,
                                          size: 50.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    GestureDetector(
                                      onTap: () {
                                        model.switchCameras();
                                      },
                                      child: CircleAvatar(
                                        radius: 25.r,
                                        backgroundColor: Colors.grey.shade200,
                                        child: const Icon(Icons.cameraswitch),
                                      ),
                                    ),
                                  ],
                                )
                              : Container(
                                  height: MediaQuery.sizeOf(context).height / 2,
                                  color: Colors.grey.shade200.withOpacity(.5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200
                                                .withOpacity(.2),
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width /
                                                        1.3,
                                                child: ListView.separated(
                                                    itemBuilder:
                                                        (context, index) =>
                                                            Container(
                                                              height: 50.h,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .purple
                                                                      .shade400
                                                                      .withOpacity(
                                                                          .4),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.r)),
                                                              child: Row(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            5.w),
                                                                    child:
                                                                        const CircleAvatar(
                                                                      backgroundImage:
                                                                          AssetImage(
                                                                              'assets/profile_picture/nice_concept.png'),
                                                                    ),
                                                                  ),
                                                                  const Text(
                                                                    'Nice Concept',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                    itemCount: 10),
                                              ),
                                              CircleAvatar(
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50.h,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 20.r,
                                              backgroundImage: AssetImage(
                                                  'assets/profile_picture/profile_picture.png'),
                                            ),
                                            Expanded(
                                                child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w,
                                                  vertical: 5.h),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade300
                                                    .withOpacity(.4),
                                                borderRadius:
                                                    BorderRadius.circular(20.r),
                                              ),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText:
                                                        'Type in your text',
                                                    suffix: IconButton(
                                                        onPressed: () {},
                                                        icon:
                                                            Icon(Icons.send))),
                                              ),
                                            )),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.card_giftcard))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}

class MyShowButtonSheets extends StatelessWidget {
  const MyShowButtonSheets({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => VideoLiveViewModel(),
      builder: (context, model, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all()),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Title')),
            ),
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all()),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Description')),
            ),
            const HeaderText3(
                text: 'This will be seen by anyone who joins the Live'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CartButton(
                      text: 'Go back',
                      isClicked: false,
                    )),
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                    onTap: () {
                      if (titleController.text.isNotEmpty &&
                          descriptionController.text.isNotEmpty) {
                        model.startVideo();
                      }
                    },
                    child: CartButton(
                      text: 'Save',
                      isClicked: true,
                      color: Colors.blue.shade900,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
