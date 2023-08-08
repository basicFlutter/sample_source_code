part of 'camera_bloc.dart';

 class CameraState  {
   final CameraStatus cameraStatus ;
   final DriverLicenseDetectionStatus driverLicenseDetectionStatus;
   final CropImageStatus cropImageStatus;
   final VinNumberScannerStatus vinNumberScannerStatus;
   final BarcodeScannerStatus barcodeScannerStatus;

   const CameraState({required this.cameraStatus , required this.driverLicenseDetectionStatus , required this.cropImageStatus , required this.vinNumberScannerStatus , required this.barcodeScannerStatus});

   CameraState copyWith({CameraStatus ? newCameraStatus , DriverLicenseDetectionStatus ? newDriverLicenseDetectionStatus,CropImageStatus? newCropImageStatus , VinNumberScannerStatus ? newVinNumberScannerStatus , BarcodeScannerStatus ? newBarcodeScannerStatus}){
     return CameraState(
         cameraStatus: newCameraStatus ?? cameraStatus,
       driverLicenseDetectionStatus: newDriverLicenseDetectionStatus ?? driverLicenseDetectionStatus,
       cropImageStatus: newCropImageStatus ??cropImageStatus,
       vinNumberScannerStatus: newVinNumberScannerStatus?? vinNumberScannerStatus,
       barcodeScannerStatus: newBarcodeScannerStatus ?? barcodeScannerStatus
     );
   }
}


