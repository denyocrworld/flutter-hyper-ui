// ------------------------
// CapekNgoding.com
// ------------------------
// Starring:
// Trian Noviandi
// trian.my.id
// ------------------------
// [1] Update pubspec.yaml
// rubber:
// sliding_up_panel:
// ------------------------
// inspiration: Gojek Main Navigation
// ------------------------
// Min. Usage Level: Hobbyist | (Beginner/Hobbyist)
// Bukan rekomendasi untuk pemula
// Karena ketika digunakan, sangat besar kemungkinan error
// ------------------------
// Status: BETA and Unoptimized
// ------------------------

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//---------
import 'package:rubber/rubber.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
//---------

class GojekMainNavigationView extends StatefulWidget {
  @override
  _GojekMainNavigationViewState createState() =>
      _GojekMainNavigationViewState();
}

class _GojekMainNavigationViewState extends State<GojekMainNavigationView>
    with TickerProviderStateMixin {
  Size get size => MediaQuery.of(context).size;
  double get rubberSheetHeight => size.height - 70;
  double get sheetPercentage => rubberSheetHeight / size.height;

  double? maxScreenHeight;

  late TabController tabController;
  double get pageWidth => size.width;
  double get pageViewWidth => pageWidth * 1.02;
  double get widthFactor => 1.02;
  double get tabPaddingHorizontal =>
      ((widthFactor * pageWidth) - pageWidth) / 2;

  final bubleTabIndicator = const BubbleTabIndicator(
    indicatorHeight: 34.0,
    indicatorColor: Color(0xff017893),
  );

  int activeTab = 1;

  PanelController panelController = PanelController();
  ScrollController sliderSheetScrollCtrl = ScrollController();

  final sliderPosition = ValueNotifier(0.0);

  late AnimationController sliderTransformController;
  late Animation<double> sliderTransformAnimation;

  bool sliderShow = false;
  bool buttonShow = false;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: activeTab,
    );

    sliderTransformController =
        AnimationController(duration: Duration(milliseconds: 150), vsync: this);
    sliderTransformAnimation =
        Tween(begin: 0.0, end: 130.0).animate(sliderTransformController);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Lato',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      child: LayoutBuilder(builder: (context, constrait) {
        maxScreenHeight = constrait.maxHeight;
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
          ),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return true;
            },
            child: Scaffold(
              backgroundColor: Color(0xff02ACD3),
              body: SafeArea(
                child: Stack(
                  children: <Widget>[
                    FractionallySizedBox(
                      widthFactor: widthFactor,
                      heightFactor: 1.0,
                      child: TabBarView(
                        controller: tabController,
                        children: <Widget>[
                          Container(),
                          TabHome(
                            rubberSheetPercentage: sheetPercentage,
                            sliderShow: (show) {
                              if (show != sliderShow && show != null) {
                                sliderShow = show;
                                sliderShow
                                    ? sliderTransformController.reverse()
                                    : sliderTransformController.forward();
                              }
                            },
                          ),
                          Container(),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 22),
                      child: TabBar(
                        controller: tabController,
                        indicator: bubleTabIndicator,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://i.ibb.co/6DmhDz9/icon-promos.png',
                                  width: 22,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  'Promos',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://i.ibb.co/M9NSHYt/icon-home.png',
                                  width: 22,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  'Home',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  "https://i.ibb.co/TbYGpZC/icon-chat.png",
                                  width: 22,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  'Chat',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    slidingSheetBuilder(),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget slidingSheetBuilder() {
    return AnimatedBuilder(
      animation: Listenable.merge([
        sliderPosition,
        sliderTransformController,
        tabController.animation,
      ]),
      builder: (ctx, child) {
        return Transform.translate(
            offset: Offset(
                (tabController.animation!.value - 1) * pageViewWidth * -1,
                sliderTransformAnimation.value),
            child: slidingPanel());
      },
    );
  }

  Widget slidingPanel() {
    double margin = 24 * (-sliderPosition.value + 1);
    double marginFooter = sliderPosition.value * 48;
    double border = 50 * (-sliderPosition.value + 1);
    double footerOpacity() {
      if (sliderPosition.value == 0)
        return 1.0;
      else if (sliderPosition.value <= .20) {
        return 1 - (sliderPosition.value * 4);
      } else
        return 0.0;
    }

    return SlidingUpPanel(
      controller: panelController,
      onPanelSlide: (position) {
        sliderPosition.value = position;
      },
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          spreadRadius: 2,
          blurRadius: 12,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      header: Container(
        width: MediaQuery.of(context).size.width - 48 + marginFooter,
        height: 12,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 35,
            height: 4,
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(50)),
          ),
        ),
      ),
      footer: Opacity(
        opacity: footerOpacity(),
        child: Center(
          child: Container(
            height: 85,
            padding: EdgeInsets.symmetric(horizontal: 12),
            width: MediaQuery.of(context).size.width - 48 + marginFooter,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.green[600]),
                            child: Align(
                              child: Image.network(
                                'https://i.ibb.co/vBhYgqr/icon-goride.png',
                                width: 28,
                                height: 28,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'GoRide',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green[600]),
                          child: Align(
                            child: Image.network(
                              'https://i.ibb.co/GpqjmfX/icon-gocar.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'GoCar',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red),
                          child: Align(
                            child: Image.network(
                              'https://i.ibb.co/hmRpBcC/icon-gofood.png',
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'GoFood',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red),
                          child: Align(
                            child: Image.network(
                              'https://i.ibb.co/BtYYsH3/icon-gosend.png',
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'GoShop',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
          bottomLeft: Radius.circular(border),
          bottomRight: Radius.circular(border)),
      margin: EdgeInsets.all(margin),
      backdropColor: Colors.black,
      backdropEnabled: true,
      maxHeight: MediaQuery.of(context).size.height,
      minHeight: 95,
      panelBuilder: (scrollController) {
        return Opacity(
            opacity: sliderPosition.value < .20 ? 0.0 : sliderPosition.value,
            child: slidingContent(scrollController));
      },
    );
  }
}

//TODO: from sliding_content.dart
Widget slidingContent(ScrollController controller) {
  return Container(
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 24,
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            controller: controller,
            children: <Widget>[
              SizedBox(
                height: 24,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Your Favorites',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border:
                            Border.all(width: 1, color: Colors.green[700]!)),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.green[700],
                          fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green[600]),
                          child: Align(
                            child: Image.network(
                              'https://i.ibb.co/vBhYgqr/icon-goride.png',
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'GoRide',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.green[600]),
                          child: Align(
                            child: Image.network(
                              'https://i.ibb.co/GpqjmfX/icon-gocar.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'GoCar',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red),
                          child: Align(
                            child: Image.network(
                              'https://i.ibb.co/hmRpBcC/icon-gofood.png',
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'GoFood',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red),
                          child: Align(
                            child: Image.network(
                              'https://i.ibb.co/BtYYsH3/icon-gosend.png',
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'GoShop',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

//TODO: from tab_home.dart
class TabHome extends StatefulWidget {
  final Function(bool show) sliderShow;
  final Function(bool show)? slideUpButtonShow;

  final double rubberSheetPercentage;
  TabHome({
    required this.rubberSheetPercentage,
    required this.sliderShow,
    this.slideUpButtonShow,
  });
  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  double get pageWidth => MediaQuery.of(context).size.width;
  double get widthFactor => 1.02;
  double get tabPaddingHorizontal =>
      ((widthFactor * pageWidth) - pageWidth) / 2;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  ScrollController rubberSheetScrollCtrl = ScrollController();
  ScrollController sliderSheetScrollCtrl = ScrollController();
  late RubberAnimationController rubberSheetAnimationCtrl;
  PanelController panelController = PanelController();

  final sliderPosition = ValueNotifier(0.0);

  late AnimationController buttonSliderTransformController;
  late Animation<double> buttonSliderTransformAnimation;

  bool rubberExpanded = true;
  bool slideBtnHideByScroll = true;
  bool buttonShow = false;

  late double distanceScroll;
  late double initialScroll;
  late double endScroll;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    rubberSheetAnimationCtrl = RubberAnimationController(
        vsync: this,
        lowerBoundValue: AnimationControllerValue(pixel: 300),
        upperBoundValue:
            AnimationControllerValue(percentage: widget.rubberSheetPercentage),
        springDescription: SpringDescription.withDampingRatio(
            mass: 1, stiffness: Stiffness.LOW, ratio: DampingRatio.LOW_BOUNCY),
        duration: Duration(microseconds: 1));
    rubberSheetAnimationCtrl.expand();
    buttonSliderTransformController =
        AnimationController(duration: Duration(milliseconds: 150), vsync: this);
    buttonSliderTransformAnimation =
        Tween(begin: 0.0, end: 130.0).animate(buttonSliderTransformController);

    rubberSheetScrollCtrl.addListener(() {
      hideSlider();
    });
    rubberSheetAnimationCtrl.addListener(() {
      hideSlider();
    });
  }

  void scrollUpBtnShow(bool show) {
    if (show != buttonShow) {
      buttonShow = show;
      show
          ? buttonSliderTransformController.forward()
          : buttonSliderTransformController.reverse();
    }
  }

  void hideSlider() {
    if (rubberSheetAnimationCtrl.animationState.value ==
            AnimationState.expanded &&
        rubberSheetScrollCtrl.offset == 0.0) {
      rubberExpanded = true;
      widget.sliderShow(true);
      scrollUpBtnShow(false);
    } else if (rubberSheetAnimationCtrl.animationState.value ==
        AnimationState.collapsed) {
      rubberExpanded = false;
      widget.sliderShow(false);
      scrollUpBtnShow(false);
    } else if (rubberSheetAnimationCtrl.animationState.value ==
        AnimationState.animating) {
      if (rubberExpanded) {
        widget.sliderShow(false);
        scrollUpBtnShow(false);
      } else {
        widget.sliderShow(true);
        scrollUpBtnShow(false);
      }
    } else if (distanceScroll >= 100) {
      widget.sliderShow(true);
      scrollUpBtnShow(false);
    } else if (distanceScroll <= -100) {
      widget.sliderShow(false);
      scrollUpBtnShow(true);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(horizontal: tabPaddingHorizontal),
            child: RubberBottomSheet(
              scrollController: rubberSheetScrollCtrl,
              animationController: rubberSheetAnimationCtrl,
              lowerLayer: Container(
                color: Colors.transparent,
              ),
              upperLayer: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: NotificationListener(
                  onNotification: (notif) {
                    if (notif is ScrollStartNotification) {
                      distanceScroll = 0;
                      initialScroll = rubberSheetScrollCtrl.offset;
                    } else if (notif is ScrollUpdateNotification) {
                      endScroll = rubberSheetScrollCtrl.offset;
                      distanceScroll = initialScroll - endScroll;
                      rubberSheetScrollCtrl.notifyListeners();
                    }
                    return true;
                  },
                  child: HomeContent(
                    controller: rubberSheetScrollCtrl,
                  ),
                ),
              ),
            )),
        scrollUpBtn()
      ],
    );
  }

  Widget scrollUpBtn() {
    return Positioned(
      bottom: 180,
      right: 32,
      child: AnimatedBuilder(
        animation: buttonSliderTransformController,
        builder: (ctx, child) {
          double opacity = buttonSliderTransformAnimation.value / 130;
          return Transform.translate(
            offset: Offset(0, buttonSliderTransformAnimation.value),
            child: Opacity(opacity: opacity, child: child),
          );
        },
        child: GestureDetector(
          onTap: () {
            rubberSheetScrollCtrl.animateTo(0,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey, width: .3)),
            child: Icon(
              Icons.arrow_upward,
              color: Colors.green,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}
//--

// TODO: From HomeView

//TODO: from home_view.dart
class HomeView extends StatefulWidget {
  final Function(bool show) sliderShow;
  final Function(bool show) slideUpButtonShow;
  final double? rubberSheetPercentage;

  HomeView({
    this.rubberSheetPercentage,
    required this.sliderShow,
    required this.slideUpButtonShow,
  });
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  double get pageWidth => MediaQuery.of(context).size.width;
  double get widthFactor => 1.02;
  double get tabPaddingHorizontal =>
      ((widthFactor * pageWidth) - pageWidth) / 2;

  @override
  bool get wantKeepAlive => true;

  ScrollController rubberSheetScrollCtrl = ScrollController();
  ScrollController sliderSheetScrollCtrl = ScrollController();
  late RubberAnimationController rubberSheetAnimationCtrl;
  PanelController panelController = PanelController();

  final sliderPosition = ValueNotifier(0.0);

  late AnimationController buttonSliderTransformController;
  late Animation<double> buttonSliderTransformAnimation;

  bool rubberExpanded = true;
  bool slideBtnHideByScroll = true;
  bool buttonShow = false;

  late double distanceScroll;
  late double initialScroll;
  late double endScroll;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    rubberSheetAnimationCtrl = RubberAnimationController(
        vsync: this,
        lowerBoundValue: AnimationControllerValue(pixel: 300),
        upperBoundValue:
            AnimationControllerValue(percentage: widget.rubberSheetPercentage),
        springDescription: SpringDescription.withDampingRatio(
            mass: 1, stiffness: Stiffness.LOW, ratio: DampingRatio.LOW_BOUNCY),
        duration: Duration(microseconds: 1));
    rubberSheetAnimationCtrl.expand();
    buttonSliderTransformController =
        AnimationController(duration: Duration(milliseconds: 150), vsync: this);
    buttonSliderTransformAnimation =
        Tween(begin: 0.0, end: 130.0).animate(buttonSliderTransformController);

    rubberSheetScrollCtrl.addListener(() {
      hideSlider();
    });
    rubberSheetAnimationCtrl.addListener(() {
      hideSlider();
    });
  }

  void scrollUpBtnShow(bool show) {
    if (show != buttonShow) {
      buttonShow = show;
      show
          ? buttonSliderTransformController.forward()
          : buttonSliderTransformController.reverse();
    }
  }

  void hideSlider() {
    if (rubberSheetAnimationCtrl.animationState.value ==
            AnimationState.expanded &&
        rubberSheetScrollCtrl.offset == 0.0) {
      rubberExpanded = true;
      widget.sliderShow(true);
      scrollUpBtnShow(false);
    } else if (rubberSheetAnimationCtrl.animationState.value ==
        AnimationState.collapsed) {
      rubberExpanded = false;
      widget.sliderShow(false);
      scrollUpBtnShow(false);
    } else if (rubberSheetAnimationCtrl.animationState.value ==
        AnimationState.animating) {
      if (rubberExpanded) {
        widget.sliderShow(false);
        scrollUpBtnShow(false);
      } else {
        widget.sliderShow(true);
        scrollUpBtnShow(false);
      }
    } else if (distanceScroll >= 100) {
      widget.sliderShow(true);
      scrollUpBtnShow(false);
    } else if (distanceScroll <= -100) {
      widget.sliderShow(false);
      scrollUpBtnShow(true);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(horizontal: tabPaddingHorizontal),
            child: RubberBottomSheet(
              scrollController: rubberSheetScrollCtrl,
              animationController: rubberSheetAnimationCtrl,
              lowerLayer: Container(
                color: Colors.transparent,
              ),
              upperLayer: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: NotificationListener(
                  onNotification: (notif) {
                    if (notif is ScrollStartNotification) {
                      distanceScroll = 0;
                      initialScroll = rubberSheetScrollCtrl.offset;
                    } else if (notif is ScrollUpdateNotification) {
                      endScroll = rubberSheetScrollCtrl.offset;
                      distanceScroll = initialScroll - endScroll;
                      rubberSheetScrollCtrl.notifyListeners();
                    }
                    return true;
                  },
                  child: HomeContent(
                    controller: rubberSheetScrollCtrl,
                  ),
                ),
              ),
            )),
        scrollUpBtn()
      ],
    );
  }

  Widget scrollUpBtn() {
    return Positioned(
      bottom: 180,
      right: 32,
      child: AnimatedBuilder(
        animation: buttonSliderTransformController,
        builder: (ctx, child) {
          double opacity = buttonSliderTransformAnimation.value / 130;
          return Transform.translate(
            offset: Offset(0, buttonSliderTransformAnimation.value),
            child: Opacity(opacity: opacity, child: child),
          );
        },
        child: GestureDetector(
          onTap: () {
            rubberSheetScrollCtrl.animateTo(0,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey, width: .3)),
            child: Icon(
              Icons.arrow_upward,
              color: Colors.green,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}

//EOL

//TODO: from home_content.dart

class HomeContent extends StatelessWidget {
  final ScrollController controller;
  final GlobalKey<ScrollSnapListState> sslKey = GlobalKey();
  late ScrollController gopayScrollCtrl;

  HomeContent({
    required this.controller,
  });

  final itemListIndex = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    gopayScrollCtrl = ScrollController();
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 20,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 25,
              height: 3,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ),
        Expanded(
            child: ListView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[search(), profileButton()],
              ),
            ),
            gopay(context),
            topPicks(),
            content(context),
            SizedBox(
              height: 900,
            ),
          ],
        )),
      ],
    );
  }

  Widget content(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Image.network(
                      "https://cdn-icons-png.flaticon.com/128/2830/2830305.png",
                      width: 30,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text(
                        "Gojack",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'This is a Content',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
              ],
            ),
          ),
          Container(
            height: 230,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 225,
                    width: MediaQuery.of(context).size.width - 40,
                    child: Align(
                      child: Card(
                        margin: EdgeInsets.only(
                            left: index == 0 ? 20 : 10, right: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8))),
                              height: 120,
                            ),
                            Container(
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'This is a Content',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget topPicks() {
    var selectedIndex = ValueNotifier(0);

    List<String> category = [
      'All',
      'COVID-19',
      'Donation',
      'Entertainment',
      'Food',
      'J3K',
      'Lifestyle',
      'Payments',
      'Promos',
      'Shopping'
    ];

    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Top picks for you',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
          ),
          AnimatedBuilder(
            animation: selectedIndex,
            builder: (context, child) => Container(
              height: 30,
              margin: EdgeInsets.only(top: 16),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: category.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () => selectedIndex.value = index,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin:
                          EdgeInsets.only(left: index == 0 ? 20 : 4, right: 4),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: index == selectedIndex.value
                                  ? Colors.green[700]!
                                  : Colors.grey[400]!,
                              width: 1),
                          borderRadius: BorderRadius.circular(15),
                          color: index == selectedIndex.value
                              ? Colors.green[700]
                              : Colors.white),
                      child: Center(
                        child: Text(
                          category[index],
                          style: TextStyle(
                              color: index == selectedIndex.value
                                  ? Colors.white
                                  : Colors.grey[800],
                              fontSize: 14),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget gopay(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Color(0xff02ACD3), borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: <Widget>[
          AnimatedBuilder(
            animation: itemListIndex,
            builder: (context, child) => ItemListIndicator(
              total: 2,
              currentIndex: itemListIndex.value,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            height: 100,
            child: ScrollSnapList(
              onItemFocus: (index) {
                itemListIndex.value = index;
              },
              itemSize: 75,
              itemBuilder: (ctx, index) {
                return Container(
                  child: gopayScrollContent(
                      index: index, scrollController: gopayScrollCtrl),
                );
              },
              itemCount: 2,
              duration: 100,
              initialIndex: 1,
              key: sslKey,
              listController: gopayScrollCtrl,
              dynamicItemSize: true,
              scrollDirection: Axis.vertical,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Icon(
                    Icons.arrow_upward,
                    size: 16,
                    color: Color(0xff02ACD3),
                  )),
              SizedBox(
                height: 6,
              ),
              Text(
                'Pay',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              )
            ],
          )),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Icon(
                    Icons.add,
                    size: 16,
                    color: Color(0xff02ACD3),
                  )),
              SizedBox(
                height: 6,
              ),
              Text(
                'Top Up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              )
            ],
          )),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Icon(
                    Icons.menu,
                    size: 16,
                    color: Color(0xff02ACD3),
                  )),
              SizedBox(
                height: 6,
              ),
              Text(
                'More',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              )
            ],
          )),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }

  Widget profileButton() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.green[700]),
      child: Align(
        child: Image.network(
          'https://i.ibb.co/2cvZLJ6/icon-profile.png',
          width: 24,
        ),
      ),
    );
  }

  Widget search() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 20),
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey.withOpacity(.05),
            border: Border.all(color: Colors.grey.withOpacity(.5), width: .5)),
        child: Row(
          children: <Widget>[
            Center(child: Icon(Icons.search)),
            SizedBox(
              width: 8,
            ),
            Text(
              'Order the best nasgor in town...',
              style: TextStyle(color: Colors.grey[700], fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
//EOL

//TODO: from item_list_indicator.dart

class ItemListIndicator extends StatelessWidget {
  final int total;
  final int currentIndex;

  ItemListIndicator({
    required this.currentIndex,
    required this.total,
  });

  Widget item(bool active) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      height: 8,
      width: 2,
      decoration: BoxDecoration(
          color: active ? Colors.white : Colors.grey[400],
          borderRadius: BorderRadius.circular(8)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          for (int i = 0; i < total; i++) item(i == currentIndex ? true : false)
        ],
      ),
    );
  }
}
//EOL

//TODO: from gopay_scroll_content.dart
Widget gopayScrollContent({
  required ScrollController scrollController,
  required int index,
}) {
  double itemHeight = 75;
  int currentIndex = index;
  double activeOffset = itemHeight * currentIndex;

  return AnimatedBuilder(
    animation: scrollController,
    builder: (ctx, child) {
      double opacity;
      if (scrollController.offset < activeOffset - 50)
        opacity = .5;
      else if (scrollController.offset < activeOffset) {
        opacity = 1 + ((scrollController.offset - activeOffset) / 100);
      } else if (scrollController.offset < activeOffset + 50) {
        opacity = 1 - ((scrollController.offset - activeOffset) / 100);
      } else
        opacity = .5;

      return Opacity(
        opacity: opacity,
        child: child,
      );
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      height: itemHeight,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.network(
                "https://i.ibb.co/5rfjSc2/2420279.png",
                width: 12,
                color: Colors.blue,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                index == 1 ? 'Gopay' : 'paylater',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          index == 1 ? secondItem() : firstItem()
        ],
      ),
    ),
  );
}

Widget firstItem() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Order now, pay by the end of month',
        style: TextStyle(
            fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w400),
      )
    ],
  );
}

Widget secondItem() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Rp3.637',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
      ),
      Text(
        'Tap to top up',
        style: TextStyle(
            fontSize: 12,
            color: Colors.green[700],
            fontWeight: FontWeight.w700),
      )
    ],
  );
}
//EOL

//TODO: from scroll_snap_list_custom.dart
class ScrollSnapList extends StatefulWidget {
  ///List background
  final Color? background;

  ///Widget builder.
  final Widget Function(BuildContext, int) itemBuilder;

  ///Animation curve
  final Curve curve;

  ///Animation duration in milliseconds (ms)
  final int duration;

  ///Pixel tolerance to trigger onReachEnd.
  ///Default is itemSize/2
  final double? endOfListTolerance;

  ///Focus to an item when user tap on it. Inactive if the list-item have its own onTap detector (use state-key to help focusing instead).
  final bool focusOnItemTap;

  ///Method to manually trigger focus to an item. Call with help of `GlobalKey<ScrollSnapListState>`.
  final void Function(int)? focusToItem;

  ///Container's margin
  final EdgeInsetsGeometry? margin;

  ///Number of item in this list
  final int? itemCount;

  ///Composed of the size of each item + its margin/padding.
  ///Size used is width if `scrollDirection` is `Axis.horizontal`, height if `Axis.vertical`.
  ///
  ///Example:
  ///- Horizontal list
  ///- Card with `width` 100
  ///- Margin is `EdgeInsets.symmetric(horizontal: 5)`
  ///- itemSize is `100+5+5 = 110`
  final double itemSize;

  ///Global key that's used to call `focusToItem` method to manually trigger focus event.
  final Key? key;

  ///Global key that passed to child ListView. Can be used for PageStorageKey
  final Key? listViewKey;

  ///Callback function when list snaps/focuses to an item
  final void Function(int) onItemFocus;

  ///Callback function when user reach end of list.
  ///
  ///Can be used to load more data from database.
  final Function? onReachEnd;

  ///Container's padding
  final EdgeInsetsGeometry? padding;

  ///Reverse scrollDirection
  final bool reverse;

  ///Calls onItemFocus (if it exists) when ScrollUpdateNotification fires
  final bool? updateOnScroll;

  ///An optional initial position which will not snap until after the first drag
  final double? initialIndex;

  ///ListView's scrollDirection
  final Axis scrollDirection;

  ///Allows external controller
  final ScrollController listController;

  ///Scale item's size depending on distance to center
  final bool dynamicItemSize;

  ///Custom equation to determine dynamic item scaling calculation
  ///
  ///Input parameter is distance between item position and center of ScrollSnapList (Negative for left side, positive for right side)
  ///
  ///Output value is scale size (must be >=0, 1 is normal-size)
  ///
  ///Need to set `dynamicItemSize` to `true`
  final double Function(double distance)? dynamicSizeEquation;

  ScrollSnapList({
    required this.itemBuilder,
    required this.itemSize,
    required this.onItemFocus,
    this.background,
    ScrollController? listController,
    this.curve = Curves.ease,
    this.duration = 500,
    this.endOfListTolerance,
    this.focusOnItemTap = true,
    this.focusToItem,
    this.itemCount,
    this.key,
    this.listViewKey,
    this.margin,
    this.onReachEnd,
    this.padding,
    this.reverse = false,
    this.updateOnScroll,
    this.initialIndex,
    this.scrollDirection = Axis.horizontal,
    this.dynamicItemSize = false,
    this.dynamicSizeEquation,
  })  : listController = listController ?? ScrollController(),
        super(key: key);

  @override
  ScrollSnapListState createState() => ScrollSnapListState();
}

class ScrollSnapListState extends State<ScrollSnapList> {
  //true if initialIndex exists and first drag hasn't occurred
  bool isInit = true;
  //to avoid multiple onItemFocus when using updateOnScroll
  int previousIndex = -1;
  //Current scroll-position in pixel
  double currentPixel = 0;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialIndex != null) {
        //set list's initial position
        focusToInitialPosition();
      } else {
        isInit = false;
      }
    });

    ///After initial jump, set isInit to false
    Future.delayed(Duration(milliseconds: 10), () {
      if (this.mounted) {
        setState(() {
          isInit = false;
        });
      }
    });
  }

  ///Scroll list to an offset
  void _animateScroll(double location) {
    Future.delayed(Duration.zero, () {
      widget.listController.animateTo(
        location,
        duration: Duration(milliseconds: widget.duration),
        curve: widget.curve,
      );
    });
  }

  ///Calculate scale transformation for dynamic item size
  double calculateScale(int index) {
    //scroll-pixel position for index to be at the center of ScrollSnapList
    double intendedPixel = index * widget.itemSize;
    double difference = intendedPixel - currentPixel;

    if (widget.dynamicSizeEquation != null) {
      //force to be >= 0
      double scale = widget.dynamicSizeEquation!(difference);
      return scale < 0 ? 0 : scale;
    }

    //default equation
    return 1 - min(difference.abs() / 500, 0.4);
  }

  Widget _buildListItem(BuildContext context, int index) {
    Widget child;
    if (widget.dynamicItemSize) {
      child = Transform.scale(
        scale: calculateScale(index),
        child: widget.itemBuilder(context, index),
      );
    } else {
      child = widget.itemBuilder(context, index);
    }

    if (widget.focusOnItemTap)
      return GestureDetector(
        onTap: () => focusToItem(index),
        child: child,
      );

    return child;
  }

  ///Calculates target pixel for scroll animation
  ///
  ///Then trigger `onItemFocus`
  double _calcCardLocation({
    required double itemSize,
    double? pixel,
    int? index,
  }) {
    //current pixel: pixel
    //listPadding is not considered as moving pixel by scroll (0.0 is after padding)
    //substracted by itemSize/2 (to center the item)
    //divided by pixels taken by each item
    int cardIndex =
        index != null ? index : ((pixel! - itemSize / 2) / itemSize).ceil();

    //trigger onItemFocus
    if (widget.onItemFocus != null && cardIndex != previousIndex) {
      previousIndex = cardIndex;
      widget.onItemFocus(cardIndex);
    }

    //target position
    return (cardIndex * itemSize);
  }

  /// Trigger focus to an item inside the list
  /// Will trigger scoll animation to focused item
  void focusToItem(int index) {
    double targetLoc =
        _calcCardLocation(index: index, itemSize: widget.itemSize);
    _animateScroll(targetLoc);
  }

  ///Determine location if initialIndex is set
  void focusToInitialPosition() {
    if (widget.listController.hasClients == false) return;
    widget.listController.jumpTo((widget.initialIndex! * widget.itemSize));
  }

  ///Trigger callback on reach end-of-list
  void _onReachEnd() {
    if (widget.onReachEnd != null) widget.onReachEnd!();
  }

  @override
  void dispose() {
    // widget.listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      margin: widget.margin,
      child: LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints constraint) {
          double _listPadding = (widget.scrollDirection == Axis.horizontal
                      ? constraint.maxWidth
                      : constraint.maxHeight) /
                  2 -
              widget.itemSize / 2;
          return GestureDetector(
            //by catching onTapDown gesture, it's possible to keep animateTo from removing user's scroll listener
            onTapDown: (_) {},
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo is ScrollEndNotification) {
                  // dont snap until after first drag
                  if (isInit) {
                    return true;
                  }

                  double tolerance =
                      widget.endOfListTolerance ?? (widget.itemSize / 2);
                  if (scrollInfo.metrics.pixels >=
                      scrollInfo.metrics.maxScrollExtent - tolerance) {
                    _onReachEnd();
                  }

                  //snap the selection
                  double offset = _calcCardLocation(
                    pixel: scrollInfo.metrics.pixels,
                    itemSize: widget.itemSize,
                  );

                  //only animate if not yet snapped (tolerance 0.01 pixel)
                  if ((scrollInfo.metrics.pixels - offset).abs() > 0.01) {
                    _animateScroll(offset);
                  }
                } else if (scrollInfo is ScrollUpdateNotification) {
                  //save pixel position for scale-effect
                  if (widget.dynamicItemSize) {
                    setState(() {
                      currentPixel = scrollInfo.metrics.pixels;
                    });
                  }

                  if (widget.updateOnScroll == true) {
                    // dont snap until after first drag
                    if (isInit) {
                      return true;
                    }

                    if (widget.onItemFocus != null && isInit == false) {
                      _calcCardLocation(
                        pixel: scrollInfo.metrics.pixels,
                        itemSize: widget.itemSize,
                      );
                    }
                  }
                }
                return true;
              },
              child: ListView.builder(
                key: widget.listViewKey,
                controller: widget.listController,
                padding: widget.scrollDirection == Axis.horizontal
                    ? EdgeInsets.symmetric(horizontal: _listPadding)
                    : EdgeInsets.symmetric(
                        vertical: _listPadding,
                      ),
                reverse: widget.reverse,
                scrollDirection: widget.scrollDirection,
                itemBuilder: _buildListItem,
                itemCount: widget.itemCount,
              ),
            ),
          );
        },
      ),
    );
  }
}
//EOL

//TODO: from bubble_tab_indicator_custom.dart

class BubbleTabIndicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;
  final double indicatorRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry insets;
  final TabBarIndicatorSize tabBarIndicatorSize;

  const BubbleTabIndicator({
    this.indicatorHeight: 20.0,
    this.indicatorColor: Colors.greenAccent,
    this.indicatorRadius: 100.0,
    this.tabBarIndicatorSize = TabBarIndicatorSize.label,
    this.padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0),
    this.insets: const EdgeInsets.symmetric(horizontal: 0.0),
  })  : assert(indicatorHeight != null),
        assert(indicatorColor != null),
        assert(indicatorRadius != null),
        assert(padding != null),
        assert(insets != null);

  @override
  Decoration lerpFrom(Decoration? a, double t) {
    if (a is BubbleTabIndicator) {
      return BubbleTabIndicator(
        padding: EdgeInsetsGeometry.lerp(a.padding, padding, t)!,
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
      );
    }
    return lerpFrom(a, t);
  }

  @override
  Decoration lerpTo(Decoration? b, double t) {
    if (b is BubbleTabIndicator) {
      return BubbleTabIndicator(
        padding: EdgeInsetsGeometry.lerp(padding, b.padding, t)!,
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
      );
    }
    return lerpTo(b, t);
  }

  @override
  _BubblePainter createBoxPainter([VoidCallback? onChanged]) {
    return _BubblePainter(this, onChanged!);
  }
}

class _BubblePainter extends BoxPainter {
  _BubblePainter(
    this.decoration,
    VoidCallback onChanged,
  )   : assert(decoration != null),
        super(onChanged);

  final BubbleTabIndicator decoration;

  double get indicatorHeight => decoration.indicatorHeight;
  Color get indicatorColor => decoration.indicatorColor;
  double get indicatorRadius => decoration.indicatorRadius;
  EdgeInsetsGeometry get padding => decoration.padding;
  EdgeInsetsGeometry get insets => decoration.insets;
  TabBarIndicatorSize get tabBarIndicatorSize => decoration.tabBarIndicatorSize;

  double? initialOffset;
  double? stopOffset;

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);

    Rect indicator = padding.resolve(textDirection).inflateRect(rect);

    if (tabBarIndicatorSize == TabBarIndicatorSize.tab) {
      indicator = insets.resolve(textDirection).deflateRect(rect);
    }

    return Rect.fromLTWH(
      indicator.left,
      indicator.top,
      indicator.width,
      indicator.height,
    );
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    if (initialOffset == null)
      initialOffset = (offset.dx - configuration.size!.width) / 3;

    assert(configuration != null);
    assert(configuration.size != null);

    double dxOffset;
    double? currenStopOffset =
        getStopOffset(initialOffset!, configuration.size!.width, offset.dx);
    stopOffset = currenStopOffset ?? stopOffset;
    if (offset.dx >= stopOffset!) {
      dxOffset =
          offsetControl(initialOffset!, configuration.size!.width, offset.dx);
    } else {
      dxOffset = offsetControlFromRigth(
          initialOffset!, configuration.size!.width, offset.dx);
    }

    final Rect rect = Offset(
            dxOffset, (configuration.size!.height / 2) - indicatorHeight / 2) &
        Size(
            configuration.size!.width +
                widthControl(
                    initialOffset!, configuration.size!.width, offset.dx),
            indicatorHeight);
    final TextDirection textDirection = configuration.textDirection!;
    final Rect indicator = _indicatorRectFor(rect, textDirection);
    final Paint paint = Paint();
    paint.color = indicatorColor;

    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndRadius(indicator, Radius.circular(indicatorRadius)),
        paint);
  }

  double widthControl(double initialOffset, double baseWidth, double offset) {
    double tabWidth = initialOffset * 2 + baseWidth;

    if (offset < tabWidth + initialOffset) {
      double halfEnd = tabWidth / 2 + initialOffset;
      if (offset < halfEnd) {
        return (offset - initialOffset) * 1.5;
      } else {
        return (halfEnd - initialOffset + halfEnd - offset) * 1.5;
      }
    } else if (offset < tabWidth * 2 + initialOffset) {
      double halfEnd = tabWidth / 2 + initialOffset + tabWidth;
      if (offset < halfEnd) {
        double x = (offset - initialOffset - tabWidth) * 1.5;
        return x;
      } else {
        return ((tabWidth / 2) + (halfEnd - offset)) * 1.5;
      }
    } else
      return 0;
  }

  double offsetControl(double initialOffset, double baseWidth, double offset) {
    double tabWidth = initialOffset * 2 + baseWidth;
    if (offset < tabWidth + initialOffset) {
      double halfEnd = tabWidth / 2 + initialOffset;
      if (offset < halfEnd)
        return initialOffset;
      else {
        double x = offset - halfEnd;
        return x * 2 + initialOffset;
      }
    } else if (offset < (tabWidth * 2 + initialOffset)) {
      double halfEnd = tabWidth / 2 + initialOffset + tabWidth;
      if (offset < halfEnd)
        return tabWidth + initialOffset;
      else {
        double x = offset - halfEnd;
        return x * 2 + initialOffset + tabWidth;
      }
    } else {
      return offset;
    }
  }

  double offsetControlFromRigth(
      double initialOffset, double baseWidth, double offset) {
    double tabWidth = initialOffset * 2 + baseWidth;
    if (offset < tabWidth + initialOffset) {
      double halfEnd = tabWidth / 2 + initialOffset;
      if (offset < halfEnd) {
        double x = (offset - halfEnd) * .5;
        return (tabWidth +
                ((halfEnd - tabWidth - initialOffset) * 1.5) +
                initialOffset) +
            x;
      } else {
        double x = offset - tabWidth - initialOffset;
        return tabWidth + (x * 1.5) + initialOffset;
      }
    } else if (offset < (tabWidth * 2 + initialOffset)) {
      double halfEnd = tabWidth / 2 + initialOffset + tabWidth;

      if (offset < halfEnd) {
        double x = (offset - halfEnd) * .5;

        return ((tabWidth * 2) +
                ((halfEnd - (tabWidth * 2) - initialOffset) * 1.5) +
                initialOffset) +
            x;
      } else {
        double x = offset - (tabWidth * 2) - initialOffset;
        return (tabWidth * 2) + (x * 1.5) + initialOffset;
      }
    } else {
      return offset;
    }
  }

  double roundDouble(double value, int places) {
    double mod = double.parse("${pow(10.0, places)}");
    return ((value * mod).round().toDouble() / mod);
  }

  double? getStopOffset(double initialOffset, double baseWidth, double offset) {
    double secondStop = initialOffset * 3 + baseWidth;
    double thirdStop = initialOffset * 5 + baseWidth * 2;

    if (roundDouble(offset, 8) == roundDouble(initialOffset, 8)) {
      return initialOffset;
    } else if (roundDouble(offset, 8) == roundDouble(secondStop, 8)) {
      return secondStop;
    } else if (roundDouble(offset, 8) == roundDouble(thirdStop, 8)) {
      return thirdStop;
    }
  }
}
//EOL