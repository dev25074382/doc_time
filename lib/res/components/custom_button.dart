import 'package:doctor/consts/consts.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  final Color? textColor;
  const CustomButton({super.key,required this.buttonText, this.textColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
          backgroundColor: Colors.blue,
          foregroundColor: textColor ?? Colors.white,
        ),
        onPressed: onTap,
        child: buttonText.text.make(),
      ),
    );
  }
}
