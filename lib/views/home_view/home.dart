import 'package:doctor/consts/consts.dart';
import 'package:doctor/views/appointment_view/appointment_view.dart';
import 'package:doctor/views/category_view/category_view.dart';
import 'package:doctor/views/home_view/home_view.dart';
import 'package:doctor/views/login_view.dart';
import 'package:doctor/views/settings_view/settings_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List screenList = [
    const HomeView(),
    const AppointmentView(),
    const CategoryView(),
    const SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColors.white.withOpacity(0.5),
        selectedItemColor: AppColors.white,
        selectedLabelStyle: TextStyle(
          color: AppColors.white,
        ),
        selectedIconTheme: IconThemeData(
          color: AppColors.white,
        ),
        backgroundColor: AppColors.blueColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (value){
            setState(() {
              selectedIndex = value;
            });
          },
          items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.note), label: "Appointment"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ]),
    );
  }
}
