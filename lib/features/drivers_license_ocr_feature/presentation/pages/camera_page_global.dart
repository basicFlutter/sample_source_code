import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/extenstions/app_extension.dart';

import 'package:new_panel/core/service_locator.dart';
import 'package:new_panel/core/utils/app_utils.dart';
import 'package:new_panel/core/widgets/circular_button.dart';
import 'package:new_panel/core/widgets/custom_loading.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/round_corner_button.dart';

import 'package:new_panel/features/drivers_license_ocr_feature/presentation/manager/camera_bloc/camera_bloc.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/presentation/manager/camera_bloc/status/camera_status.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/presentation/manager/camera_bloc/status/crop_image_status.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/presentation/manager/ocr_bloc/ocr_driver_license_bloc.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/presentation/manager/ocr_bloc/status/ocr_driver_license_status.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/presentation/widgets/driver_license_scanner.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/presentation/widgets/vin_number_scanner.dart';
import 'package:new_panel/main.dart';

class CameraPageGlobal extends StatefulWidget {
  const CameraPageGlobal({Key? key , required this.scannerMode}) : super(key: key);
 final ScannerMode scannerMode ;

  @override
  State<CameraPageGlobal> createState() => _CameraPageGlobalState();
}

class _CameraPageGlobalState extends State<CameraPageGlobal>  with WidgetsBindingObserver {


  @override
  Widget build(BuildContext context) {


    Widget getScannerModePage(){
      switch(widget.scannerMode){

        case ScannerMode.driverLicenseScanner:
       return const DriverLicenseScanner();
        case ScannerMode.vinNumberScanner:
          return const VinNumberScanner();
        case ScannerMode.barcodeScanner:
          return const VinNumberScanner();
      }
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider<CameraBloc>(create:  (context) => CameraBloc(initCameraUseCase: locator(),detectDriversLicenseUseCase: locator(),cameraImageToInputImageUseCase: locator() , cropImageUseCase:  locator() , detectDriverLicenseSingleImageUseCase: locator() , vinNumberScannerUseCase: locator())..add(InitCameraEvent()),),
        BlocProvider<OcrDriverLicenseBloc>(create: (context) => OcrDriverLicenseBloc(ocrDriverLicenseUseCase: locator()))
        // BlocProvider<OcrBloc>(create: (context)=> Ocr)

      ],

      child: Builder(
          builder: (context) {
            return Scaffold(
              body: getScannerModePage()
            );
          }
      ),
    );
  }
}

