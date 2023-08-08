part of 'camera_bloc.dart';

abstract class CameraEvent extends Equatable {
  const CameraEvent();
}

class InitCameraEvent extends CameraEvent{

  @override
  List<Object?> get props => [];

}

class StartDetectDriverLicense extends CameraEvent{
 final double? scale;
 final CameraController cameraController;
 final Offset? centerOffset;
 final Size? sizeScreen;
 final Rect? overLayRect;
 final double? ratio;
 final bool? isLandscape;
 final Size? overlaySize ;
 const StartDetectDriverLicense({
   required this.cameraController,
   this.centerOffset,
   this.sizeScreen,
   this.scale,
   this.overLayRect,
   this.ratio,
   this.isLandscape,

   this.overlaySize
 });
  @override
  List<Object?> get props => [cameraController , centerOffset,sizeScreen,scale,overLayRect,ratio,isLandscape,overlaySize];

}


class DriverLicenseDetected extends CameraEvent{
  // final XFile driverLicenseImage ;
  final CameraController cameraController;
  final ObjectDetectEntity objectDetectEntity;
 const DriverLicenseDetected({required this.cameraController, required this.objectDetectEntity});
  @override
  // TODO: implement props
  List<Object?> get props => [cameraController , objectDetectEntity];
}


class CropImageEvent extends CameraEvent{
 final  CropImageInputParam cropImageInputParam;
  const CropImageEvent({required this.cropImageInputParam});
  @override
  List<Object?> get props => [cropImageInputParam];
}


class DetectDriverLicenseFromImageGallery extends CameraEvent{
  final File imageFile;
  const DetectDriverLicenseFromImageGallery({required this.imageFile});
  @override
  // TODO: implement props
  List<Object?> get props => [imageFile];
}

class DisposeCamera extends CameraEvent{
  final CameraController cameraController;
  const DisposeCamera({required this.cameraController});
  @override
  List<Object?> get props => [cameraController];

}


class StartScanVinNumber extends CameraEvent{
  final double? scale;
  final CameraController cameraController;
  final Offset? centerOffset;
  final Size? sizeScreen;
  final Rect? overLayRect;
  final double? ratio;
  final bool? isLandscape;
  final Size? overlaySize ;
  const StartScanVinNumber({
    required this.cameraController,
    this.centerOffset,
    this.sizeScreen,
    this.scale,
    this.overLayRect,
    this.ratio,
    this.isLandscape,
    this.overlaySize
});
  @override
  List<Object?> get props => [cameraController , centerOffset,sizeScreen,scale,overLayRect,ratio,isLandscape,overlaySize];

}


class VinNumberDetected extends CameraEvent{
  final CameraController cameraController;
  final VinNumberEntity vinNumberEntity;
  const VinNumberDetected({required this.vinNumberEntity , required this.cameraController});

  @override
  List<Object?> get props => [cameraController , vinNumberEntity];

}


class ScanBarcode extends CameraEvent{
  final double? scale;
  final CameraController cameraController;
  final Offset? centerOffset;
  final Size? sizeScreen;
  final Rect? overLayRect;
  final double? ratio;
  final bool? isLandscape;
  final Size? overlaySize ;

  const ScanBarcode({
    required this.cameraController,
    this.centerOffset,
    this.sizeScreen,
    this.scale,
    this.overLayRect,
    this.ratio,
    this.isLandscape,
    this.overlaySize
});

  @override
  List<Object?> get props => [cameraController , centerOffset,sizeScreen,scale,overLayRect,ratio,isLandscape,overlaySize];

}


class BarcodeDetected extends CameraEvent{
  final CameraController cameraController;
  final BarcodeEntity barcodeEntity;
  const BarcodeDetected({required this.barcodeEntity , required this.cameraController});

  @override
  List<Object?> get props => [cameraController , barcodeEntity];
}



