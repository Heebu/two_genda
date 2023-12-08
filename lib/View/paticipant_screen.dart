import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:two_genda/Reuseables/header_texts.dart';

import '../Reuseables/my_buttons.dart';
import '../ViewModel/paticipant_viewmodel.dart';

class ParticipantScreen extends StatelessWidget {
  const ParticipantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ParticipantViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: HeaderText1(
            text: 'Participants',
          ),
          actions: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_picture/logo.png'),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50.sp,
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.grey.shade300.withOpacity(.4),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Participant',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 14.sp)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height,
                child: ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/profile_picture/selem_lawal.png'),
                          ),
                          title: Text('Adedeji Idris'),
                          subtitle: Text('Flutter developer from Ibadan'),
                          trailing: CartButton(
                            text: 'Stick',
                            color: Colors.purple,
                            isClicked: true,
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 5.h,
                        ),
                    itemCount: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
