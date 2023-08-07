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
import 'package:new_panel/features/drivers_license_ocr_feature/presentation/manager/camera_bloc/status/vin_number_scanner_status.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/presentation/manager/ocr_bloc/ocr_driver_license_bloc.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/presentation/manager/ocr_bloc/status/ocr_driver_license_status.dart';
import 'package:new_panel/main.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage>  with WidgetsBindingObserver {
  GlobalKey key = GlobalKey();
  double rectangleOverLayWidth = 0;
  double rectangleOverLayHeight = 0;
  double rectangleOverLayRadius = 0;
  double cameraScale = 1;
  CameraController? cameraController ;
  double ratio = 1.59;
  late BuildContext _context;
  void _getWidgetInfo(_) {
    final size = MediaQuery.of(_context).size;
    final media = MediaQuery.of(_context);
    double width = media.orientation == Orientation.portrait ? size.shortestSide * .9 : size.longestSide * .5;
    double cornerRadius = 0.064;
    double height = width / ratio;
    double radius = cornerRadius * height;

    if(cameraController != null){
      if (media.orientation == Orientation.portrait) {
        cameraScale = size.aspectRatio * cameraController!.value.aspectRatio;
      } else {
        cameraScale = 1 / size.aspectRatio * cameraController!.value.aspectRatio;
      }
    }


    if (cameraScale < 1) {
      cameraScale = 1 / cameraScale;
    }

    final RenderBox renderBox = key.currentContext?.findRenderObject() as RenderBox;


    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size sizeOverLay = renderBox.size;
    logger.e(sizeOverLay);

    final Size sizeScreen = MediaQuery.of(_context).size;

    BlocProvider.of<CameraBloc>(_context).add(
        StartDetectDriverLicense(
            cameraController: cameraController!,
            centerOffset: offset,
            ratio: MediaQuery.of(_context).devicePixelRatio,
            sizeScreen: sizeScreen,
            overLayRect: key.globalPaintBounds!,
            scale: cameraScale,
            overlaySize: sizeOverLay,
            isLandscape: media.orientation == Orientation.portrait ? false : true));

  }
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<CameraBloc>(create:  (context) => CameraBloc(initCameraUseCase: locator(),detectDriversLicenseUseCase: locator(),cameraImageToInputImageUseCase: locator() , cropImageUseCase:  locator() , detectDriverLicenseSingleImageUseCase: locator(),vinNumberScannerUseCase: locator())..add(InitCameraEvent()),),
        BlocProvider<OcrDriverLicenseBloc>(create: (context) => OcrDriverLicenseBloc(ocrDriverLicenseUseCase: locator()))
        // BlocProvider<OcrBloc>(create: (context)=> Ocr)

      ],

      child: Builder(
          builder: (context) {
            _context = context;
            return Scaffold(
              body: BlocConsumer<CameraBloc, CameraState>(

                listener: (context, state) {

                  if(state.cropImageStatus is CropImageCompleted){
                    logger.w("Crop image completed");
                    CropImageCompleted cropImageCompleted = state.cropImageStatus as  CropImageCompleted;
                    BlocProvider.of<OcrDriverLicenseBloc>(context).add(StartProcessDriverLicense(imageFile: cropImageCompleted.imageFile));
                  }
                  if(state.cropImageStatus is CropImageError){
                    CropImageError cropImageError = state.cropImageStatus as CropImageError;
                    AppUtils.showCustomNotification(context: context, messageType: MessageType.error,
                        message: cropImageError.responseError.message??""
                    );
                    BlocProvider.of<CameraBloc>(context).add(DisposeCamera(cameraController: cameraController!));
                    Navigator.of(context).pop();
                  }

                },
                builder: (context, state) {
                  if(state.cameraStatus is CameraInitLoading){
                    return const CustomLoading();
                  }
                  if(state.cameraStatus is CameraInitCompleted){
                    CameraInitCompleted cameraInitCompleted = state.cameraStatus as CameraInitCompleted;
                    cameraController = cameraInitCompleted.cameraController;
                    WidgetsBinding.instance.addObserver(this);
                    WidgetsBinding.instance.addPostFrameCallback(_getWidgetInfo);

                    final size = MediaQuery.of(context).size;
                    final media = MediaQuery.of(context);
                    double rectangleOverLayWidth = media.orientation == Orientation.portrait ? size.shortestSide * .9 : size.longestSide * .5;

                    double cornerRadius = 0.064;
                    double rectangleOverLayHeight = rectangleOverLayWidth / ratio;
                    double rectangleOverLayRadius = cornerRadius * rectangleOverLayHeight;

                    if (media.orientation == Orientation.portrait) {
                      cameraScale = size.aspectRatio * cameraInitCompleted.cameraController.value.aspectRatio;
                    } else {
                      cameraScale = 1 / size.aspectRatio * cameraInitCompleted.cameraController.value.aspectRatio;
                    }

                    if (cameraScale < 1) {
                      cameraScale = 1 / cameraScale;
                    }


                    return

                      Stack(
                        //   fit: StackFit.expand,
                        children: [
                          Container(
                            color: Colors.green,
                            height: 1.sh,
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Transform.scale(
                                  scale: cameraScale,
                                  child: Center(child: CameraPreview(cameraInitCompleted.cameraController)),
                                ),

                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      key: key,
                                      width: rectangleOverLayWidth,
                                      height: rectangleOverLayWidth / ratio,
                                      decoration: ShapeDecoration(
                                          color: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(rectangleOverLayRadius),
                                              side: const BorderSide(
                                                  width: 1, color: Colors.white))),
                                    )),

                                ColorFiltered(
                                  colorFilter:
                                  const ColorFilter.mode(Colors.black54, BlendMode.srcOut),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            width: rectangleOverLayWidth,
                                            height: rectangleOverLayHeight,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(rectangleOverLayRadius)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // if (widget.customPaint != null) widget.customPaint!,
                              ],
                            ),
                          ),

                          Align(
                            alignment: Alignment.topLeft,
                            child:  Padding(
                              padding: EdgeInsets.only(top: 50.h , left: 20.w),
                              child:  CircularButton(
                                  gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientOrange : AppColors.gradientOrangeDark,
                                  onTap: (){
                                    BlocProvider.of<CameraBloc>(context).add(DisposeCamera(cameraController: cameraInitCompleted.cameraController));
                                    Navigator.of(context).pop();
                                  }, radius: 35.r,
                                  child: Icon(
                                    Icons.arrow_back_outlined,
                                    size: 20.r,
                                    color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
                                  )),
                            ),
                          ),

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding:  EdgeInsets.only(bottom: 50.h),
                              child: RoundCornerButton(
                                width: 250.w,
                                height: 46.h,
                                onTap: () async{
                                  BlocProvider.of<CameraBloc>(context).add(DisposeCamera(cameraController: cameraController!));
                                  final ImagePicker picker = ImagePicker();
                                   await picker.pickImage(source: ImageSource.gallery).then((XFile? image) {
                                    if(image != null){

                                      BlocProvider.of<CameraBloc>(context).add(DetectDriverLicenseFromImageGallery(imageFile: File(image.path)));

                                    }
                                  });


                                },
                                title: "Open Gallery",
                              ),
                            ),
                          ),


                          Align(
                            alignment: media.orientation == Orientation.portrait
                                ? Alignment.topLeft
                                : Alignment.bottomLeft,
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 150,
                                  left: 20,
                                  right: 20,
                                  bottom: media.orientation == Orientation.portrait ? 0 : 5),
                              child: IntrinsicHeight(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    CustomText(text: "Scanning Driver's Licence",
                                      textStyle: Theme.of(context).textTheme.titleLarge,
                                      textFontWight: TextFontWight.bold,
                                      textColor: Theme.of(context).brightness == Brightness.light ?AppColors.white : AppColors.whiteDark,
                                    ),

                                    Flexible(
                                      child:
                                      CustomText(text: "Position your Driver's Licence within the Rectangle and ensure the Image is Perfectly Readable.",
                                        textStyle: Theme.of(context).textTheme.displayLarge,
                                        textFontWight: TextFontWight.regular,
                                        multiLine: true,
                                        textColor: Theme.of(context).brightness == Brightness.light ?AppColors.white.withOpacity(0.7) : AppColors.whiteDark,
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),




                        ],
                      );
                  }

                  return  const CustomLoading();

                },
              ),
            );
          }
      ),
    );
  }
}

