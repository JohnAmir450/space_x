import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/core/helpers/extentions.dart';
import 'package:space_x/core/helpers/spacing.dart';
import 'package:space_x/core/routing/routes.dart';
import 'package:space_x/core/thiming/styles.dart';

class CustomErrorStateMessage extends StatelessWidget {
  final String errorText;
  const CustomErrorStateMessage({
    super.key, required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const Text('Oops, There was an error',style: TextStyles.font15RedMedium,),
      verticalSpace(15.h),
      Text(errorText,style: TextStyles.font13GreyRegular.copyWith(color: Colors.amber),),
      verticalSpace(25.h),
      OutlinedButton(onPressed: (){
        context.pushNamed(Routes.homeScreen);
      }, child:  Text('Back To Home',style: TextStyles.font22BlackBold.copyWith(color: Colors.purple),))
    ],);
  }
}
