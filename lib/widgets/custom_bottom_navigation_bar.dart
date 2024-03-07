import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.selectedPageIndex, required this.onIconTap});

  final int selectedPageIndex;
  final Function onIconTap;

  @override
  Widget build(BuildContext context) {
    final barHeight = MediaQuery.of(context).size.height * 0.06;
    final style = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 10, fontWeight: FontWeight.w100);
    return BottomAppBar(
      color: selectedPageIndex == 0 ? Colors.black : Colors.white,
      child: Container(
        height: barHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            __bottomBarNavItem(0, 'Home', style, 'home'),
            __bottomBarNavItem(1, 'Discover', style, 'discover'),
            __addVideoNavItem(barHeight),
            __bottomBarNavItem(2, 'Inbox', style, 'message'),
            __bottomBarNavItem(3, 'Profile', style, 'account')
          ],
        ),
      ),
    );
  }

  __bottomBarNavItem(
      int index, String label, TextStyle textStyle, String iconName) {
    bool isSelected = selectedPageIndex == index;
    Color iconAndTextColor = isSelected ? Colors.black : Colors.grey;

    if (isSelected && selectedPageIndex == 0) {
      iconAndTextColor = Colors.white;
    }

    return GestureDetector(
      onTap: () => {onIconTap(index)},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/${isSelected ? iconName + '_filled' : iconName}.svg',
            color: iconAndTextColor,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(label, style: textStyle.copyWith(color: iconAndTextColor)),
        ],
      ),
    );
  }

  __addVideoNavItem(double height) {
    return Container(
      height: height - 15,
      width: 48,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blueAccent, Colors.redAccent]),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Container(
          width: 41,
          height: height - 15,
          decoration: BoxDecoration(
            color: selectedPageIndex == 0 ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.add,
            color: selectedPageIndex == 0 ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
