import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/service_locator.dart';
import 'package:new_panel/core/widgets/appBar.dart';
import 'package:new_panel/core/widgets/bos_bottom_navigation.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/simple_body.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

class SignaturePad extends StatefulWidget {
  const SignaturePad({Key? key , this.title}) : super(key: key);
  final String? title;
  @override
  State<SignaturePad> createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
    exportPenColor: Colors.black,
  );
  File? mainSignatureFile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SimpleBody(

        appBarCustom: const AppBarCustom(),
        body: Column(
          children: [

            widget.title != null?
            CustomText(
              text: widget.title!,
              textStyle: Theme.of(context).textTheme.labelSmall,
              multiLine: true,
              textFontWight: TextFontWight.medium,
            ) : const SizedBox(),

            if(widget.title != null)
              SizedBox(
                height: 20.h,
              ),


            CustomContainer(
              width: 358.w,
              height: 595.h,
              color: Theme.of(context).brightness == Brightness.light ?AppColors.white : AppColors.whiteDark,
              boxShadow: [
                Theme.of(context).brightness == Brightness.light ?AppColors.boxShadow : AppColors.boxShadowDark,
              ],
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              child: Signature(
                width: 358.w,
                height: 595.h,
                controller: _controller,
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),


                BosBottomNavigation(
                  onTapLeftButton: (){
                    _controller.clear();
                  },
                  onTapRightButton: () async{
                    Uint8List? unit8 = await _controller.toPngBytes();
                    final directory = await getApplicationDocumentsDirectory();

                    File localFile =  File('${directory.path}/${DateTime.now()}signature.png');

                    if(await localFile.exists() && localFile.existsSync()) await localFile.delete();
                    File? fileDirectory = await localFile.create();
                    await fileDirectory.writeAsBytes(unit8!);
                    mainSignatureFile = fileDirectory;
                    if(mainSignatureFile != null){
                 //     BlocProvider.of<ProfileSettingBloc>(context).add(AddSignatureEvent(signatureFile: mainSignatureFile!));
                    }

                  },
                  leftButtonTitle: "Reset",
                  rightButtonTitle: "Submit",
                  //rightButtonLoading: state.addSignatureStatus is AddSignatureLoading,
                  leftButtonIcon: Icons.refresh_rounded,
                  rightButtonIcon: Icons.check,
                  iconSize: 25.r,
                )



          ],
        )
    );
  }
}
