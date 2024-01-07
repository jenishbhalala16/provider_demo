import '../config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Provider Demo",style: appCss.dmDenseSemiBold18.textColor(appColor(context).appTheme.darkText))
      )
    );
  }
}
