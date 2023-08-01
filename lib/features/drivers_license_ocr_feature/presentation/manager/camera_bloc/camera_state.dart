part of 'camera_bloc.dart';

 class CameraState  {
   final CameraStatus cameraStatus ;
   final DriverLicenseDetectionStatus driverLicenseDetectionStatus;
   final CropImageStatus cropImageStatus;

   const CameraState({required this.cameraStatus , required this.driverLicenseDetectionStatus , required this.cropImageStatus});

   CameraState copyWith({CameraStatus ? newCameraStatus , DriverLicenseDetectionStatus ? newDriverLicenseDetectionStatus,CropImageStatus? newCropImageStatus}){
     return CameraState(
         cameraStatus: newCameraStatus ?? cameraStatus,
       driverLicenseDetectionStatus: newDriverLicenseDetectionStatus ?? driverLicenseDetectionStatus,
       cropImageStatus: newCropImageStatus ??cropImageStatus
     );
   }
}


