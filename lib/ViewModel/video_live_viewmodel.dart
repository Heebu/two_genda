import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../View/video_live_screen.dart';

class VideoLiveViewModel extends BaseViewModel {
  CameraController? cameraController;
  Future<void>? initializeControllerFuture;
  bool isMicrophoneEnabled = true;
  bool isVideoRecoding = false;
  double ratio = 1;

  Future<void> getCameraController() async {
    // Get a specific camera from the list of available cameras
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    // Create a CameraController
    cameraController = CameraController(firstCamera, ResolutionPreset.medium);

    // Initialize the controller. This returns a Future.
    return cameraController!.initialize();
  }

  void saved(context) {
    print(cameraController!.value.aspectRatio / 2.9);
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return MyShowButtonSheets();
      },
    );
  }

  void startVideo() {
    if (isVideoRecoding == false) {
      //cameraController?.startVideoRecording();
      isVideoRecoding = true;
    } else if (isVideoRecoding = true) {
      // cameraController?.stopVideoRecording();
      isVideoRecoding = false;
    }
    notifyListeners();
  }

  switchCameras() async {
    final cameras = await availableCameras();
    final currentCameraIndex = cameras.indexOf(cameraController!.description);
    final nextCameraIndex = (currentCameraIndex + 1) % cameras.length;

    // Dispose of the current controller
    cameraController?.dispose();

    // Create a new CameraController with the next camera
    final nextCamera = cameras[nextCameraIndex];
    cameraController = CameraController(nextCamera, ResolutionPreset.medium);

    // Initialize the next controller
    await cameraController!.initialize();

    // Set the preview for the new controller
    notifyListeners();
  }

  void enableAudioVoice() {
    //cameraController?.enableAudio = true;
  }

  intial() {
    initializeControllerFuture = getCameraController();

    ;
    //print(ratio);
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }
}
