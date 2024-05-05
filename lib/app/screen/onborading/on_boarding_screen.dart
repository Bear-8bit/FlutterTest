import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/app/screen/onborading/widget/onboarding_widget.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {


  final PageController  _pageController = PageController();

  int _activePage = 0;

  void onNextPage(){
    if(_activePage  < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,);
    }
  }

  final List<Map<String, dynamic>> _pages = [
  {
    'color': '#000000',
    'title': 'Lựa chọn đa dạng',
    'image': 'assets/image/onboarding/firstboarding.png',
    'description': 'Kho sản phẩm của cửa hàng sẽ bao gồm tất cả mô hình liên quan đến game và anime, khiến cho bạn có thể tha hồ lựa chọn.',
    'skip': true
  },
  {
    'color': '#ED1C24',
    'title': 'Sản phẩm chất lượng',
     'image': 'assets/image/onboarding/secondboarding.png',
    'description': 'Tất cả mô hình của cửa hàng điều là chính hãng và đảm bảo không có sản phẩm giả kém chất lượng.',
    'skip': true
  },
  {
    'color': '#000000',
    'title': 'Giao hàng nhanh chóng',
    'image': 'assets/image/onboarding/thirdboarding.png',
    'description': 'Cửa hàng sẽ giao sản phẩm đặt mua một cách nhanh chóng và kỹ lưỡng, đảm bảo sản phẩm luôn được đóng gói kỹ càng.',
    'skip': false
  },
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            scrollBehavior: AppScrollBehavior(),
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemBuilder: (BuildContext context, int index){
              return OnBoardingWidget(
                index: index,
                color: _pages[index]['color'],
                title: _pages[index]['title'],
                description: _pages[index]['description'],
                image: _pages[index]['image'],
                skip: _pages[index]['skip'],
                onTab: onNextPage,
              );
            }
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.75,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicator()
                )
              ],
            ),
          )

        ],
      ),
    );
  }

  List<Widget> _buildIndicator() {
    final indicators =  <Widget>[];

    for(var i = 0; i < _pages.length; i++) {

      if(_activePage == i) {
        indicators.add(_indicatorsTrue());
      }else{
        indicators.add(_indicatorsFalse());
      }
    }
    return  indicators;
  }

  Widget _indicatorsTrue() {
    final String color;
    if(_activePage == 0){
      color = '#1A1A1A';
    } else  if(_activePage ==  1) {
      color = '#ED1C24';
    } else {
      color = '#1A1A1A';
    }

    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 6,
      width: 42,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: hexToColor(color),
      ),
    );
  }

  Widget _indicatorsFalse() {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade100,
      ),
    );
  }
}