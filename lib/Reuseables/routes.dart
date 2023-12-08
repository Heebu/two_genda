import 'package:flutter/cupertino.dart';

import '../View/home_screen.dart';
import '../View/paticipant_screen.dart';
import '../View/search_screen.dart';
import '../View/video_live_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/Home': (context) => const HomeScreen(),
  '/search': (context) => const SearchScreen(),
  '/addLive': (context) => const VideoLiveScreen(),
  '/participants': (context) => const ParticipantScreen(),
};
