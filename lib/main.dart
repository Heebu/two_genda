import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:two_genda/Reuseables/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: ScreenUtilInit(
            designSize: const Size(450.0, 700.0),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              ScreenUtil.init(context);
              return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  appBarTheme: AppBarTheme(
                      centerTitle: true,
                      elevation: 2,
                      titleTextStyle: TextStyle(color: Colors.purple)),
                  useMaterial3: true,
                ),
                routes: routes,
                initialRoute: '/Home',
              );
            }));
  }
}
