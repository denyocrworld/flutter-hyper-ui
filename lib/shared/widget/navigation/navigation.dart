import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';

class NavigationItem {
  final String? label;
  final IconData? icon;

  NavigationItem({
    this.label,
    this.icon,
  });
}

enum NavigationType {
  basic,
  float,
  aoashi,
  basicWithDockedFloating,
  appbar,
}

class ExNavigation extends StatefulWidget {
  final List<Widget> children;
  final List<NavigationItem> menus;
  final NavigationType? type;
  final Widget? floatingActionButton;
  final Color? selectedColor;
  final Color? unselectedColor;
  final PreferredSizeWidget? appBar;

  const ExNavigation({
    Key? key,
    required this.children,
    required this.menus,
    this.type,
    this.floatingActionButton,
    this.selectedColor,
    this.unselectedColor,
    this.appBar,
  }) : super(key: key);

  @override
  State<ExNavigation> createState() => _ExNavigationState();
}

class _ExNavigationState extends State<ExNavigation> {
  int selectedIndex = 0;
  int get itemLength {
    return widget.children.length;
  }

  getNavigation() {
    var selectedColor = widget.selectedColor ?? primaryColor;
    var unselectedColor =
        widget.unselectedColor ?? primaryColor!.withOpacity(0.4);

    if (widget.type == NavigationType.float) {
      return Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 2.0,
          child: Container(
            height: 60.0,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.menus.length,
                (index) {
                  var menu = widget.menus[index];
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              menu.icon,
                              color: selectedIndex == index
                                  ? selectedColor
                                  : unselectedColor,
                              size: selectedIndex == index ? 20.0 : 16.0,
                            ),
                            const SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              "${menu.label}",
                              style: TextStyle(
                                fontSize: 10,
                                color: selectedIndex == index
                                    ? selectedColor
                                    : unselectedColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
    }

    if (widget.type == NavigationType.aoashi) {
      return Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 2.0,
          child: Container(
            height: 60.0,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.menus.length,
                (index) {
                  var menu = widget.menus[index];
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      child: SizedBox(
                        child: Stack(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    menu.icon,
                                    color: selectedIndex == index
                                        ? primaryColor
                                        : primaryColor!.withOpacity(0.4),
                                    size: selectedIndex == index ? 20.0 : 16.0,
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    "${menu.label}",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: selectedIndex == index
                                          ? primaryColor
                                          : primaryColor!.withOpacity(0.4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                height: 50.0,
                                child: Column(
                                  children: [
                                    AnimatedContainer(
                                      height:
                                          selectedIndex == index ? 10.0 : 0.0,
                                      width: 30.0,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        controller: ScrollController(),
                                        child: Column(
                                          children: const [
                                            CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 4.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
    }

    if (widget.type == NavigationType.basicWithDockedFloating) {
      return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(
                width: 10.0,
              ),
              ...List.generate(
                widget.menus.length,
                (index) {
                  var menu = widget.menus[index];
                  return IconButton(
                    icon: Icon(menu.icon),
                    onPressed: () {},
                  );
                },
              ),
              const SizedBox(
                width: 10.0,
              ),
            ],
          ),
        ),
      );
    }

    if (widget.type == NavigationType.appbar) {
      return Container(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: Row(
          children: List.generate(
            widget.menus.length,
            (index) {
              var menu = widget.menus[index];
              return Expanded(
                child: InkWell(
                  onTap: () {
                    selectedIndex = index;
                    setState(() {});
                  },
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            menu.icon,
                            color: selectedIndex == index
                                ? primaryColor
                                : disabledColor,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            "${menu.label}",
                            style: TextStyle(
                              fontSize: 12,
                              color: selectedIndex == index
                                  ? primaryColor
                                  : disabledColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      if (selectedIndex == index)
                        Container(
                          height: 2.0,
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                16.0,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

    return BottomNavigationBar(
      backgroundColor: primaryColor,
      selectedItemColor: widget.selectedColor ?? primaryColor,
      unselectedItemColor: widget.unselectedColor ?? disabledColor,
      currentIndex: selectedIndex,
      onTap: (newSelectedIndex) {
        selectedIndex = newSelectedIndex;

        setState(() {});
      },
      items: List.generate(
        widget.menus.length,
        (index) {
          var menu = widget.menus[index];

          return BottomNavigationBarItem(
            icon: Icon(menu.icon),
            label: menu.label,
          );
        },
      ),
    );
  }

  getBody() {
    if (widget.type == NavigationType.appbar) {
      return Column(
        children: [
          Container(
            child: getNavigation(),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Container(
              child: widget.children[selectedIndex],
            ),
          ),
        ],
      );
    }

    return IndexedStack(
      index: selectedIndex,
      children: widget.children,
    );
  }

  getBottomBarNavigation() {
    if (widget.type == NavigationType.appbar) return;
    return getNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: itemLength,
      child: Scaffold(
        appBar: widget.appBar,
        // body: widget.type == NavigationType.appbar
        //     ? Container(
        //         child: Column(
        //           children: [
        //             Container(
        //               width: MediaQuery.of(context).size.width,
        //               height: 200.0,
        //               color: Colors.blue,
        //             ),
        //           ],
        //         ),
        //       )
        //     : IndexedStack(
        //         index: selectedIndex,
        //         children: widget.children,
        //       ),
        body: getBody(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: widget.floatingActionButton,
        bottomNavigationBar: getBottomBarNavigation(),
      ),
    );
  }
}
