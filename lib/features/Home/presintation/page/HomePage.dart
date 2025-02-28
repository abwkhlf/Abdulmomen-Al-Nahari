import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:versomarket/core/AppTheme.dart';
import 'package:versomarket/core/util/ScreenUtil.dart';
import '../../../../injection_container.dart';
import '../manager/Home_bloc.dart';
class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List filterList = [];

  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();

  int itemisselected = 0;
  String valueInput = "";
  Widget homeWidget = Container();
  ScreenUtil screenUtil = ScreenUtil();
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.deepOrange,
        elevation: 100,
        title: Text(
          'Home Page',
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.white),
        ),
      ),
      body: Column(
        spacing: 15,
        children: [
          BlocProvider(
            create: (context) => sl<Home_bloc>(),
            child: BlocConsumer<Home_bloc, HomeState>(
              listener: (context, state) {
                if (state is carouselError) {
                  print(state.errorMessage);
                }
              },
              builder: (context, state) {
                if (state is carouselInitial) {
                  BlocProvider.of<Home_bloc>(context).add(carouselEvent());
                }

                if (state is carouselLoading) {
                  homeWidget = Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenUtil.screenHeight * .1,
                      ),
                    ],
                  );
                }

                if (state is carouselLoaded) {
                  //TODO::Show home here

                  return Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.3,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 1000),
                          autoPlayCurve: Curves.easeInOutCubic,
                          enlargeCenterPage: true,
                          scrollPhysics: BouncingScrollPhysics(),
                          viewportFraction: 0.75,
                        ),
                        items: state.carouselModel.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Stack(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 800,
                                    height: MediaQuery.of(context).size.height * 0.25,
                                    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.001),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 1,
                                          spreadRadius: 2,
                                          offset: Offset(5, 5),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        i.image,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ),
                                  ),
                                ],

                              );
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  );
                }

                return homeWidget;
              },
            ),
          ),

          BlocProvider(
            create: (context) => sl<Home_bloc>(),
            child: BlocConsumer<Home_bloc, HomeState>(
              listener: (context, state) {
                if (state is categoriesError) {
                  print(state.errorMessage);
                }
              },
              builder: (context, state) {
                if (state is carouselInitial) {
                  BlocProvider.of<Home_bloc>(context).add(categoriesEvent());
                }

                if (state is carouselLoading) {
                  homeWidget = Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenUtil.screenHeight * .1,
                      ),
                    ],
                  );
                }

                if (state is categoriesLoaded) {
                  //TODO::Show home here

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Categories",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categoriesModel.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(state.categoriesModel[index].image),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    state.categoriesModel[index].name,
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
;
                }

                return homeWidget;
              },
            ),
          ),

          BlocProvider(
            create: (context) => sl<Home_bloc>(),
            child: BlocConsumer<Home_bloc, HomeState>(
              listener: (context, state) {
                if (state is featuredProductsError) {
                  print(state.errorMessage);
                }
              },
              builder: (context, state) {
                if (state is carouselInitial) {
                  BlocProvider.of<Home_bloc>(context).add(featuredProductsEvent());
                }

                if (state is featuredProductsLoading) {
                  homeWidget = Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenUtil.screenHeight * .1,
                      ),
                    ],
                  );
                }

                if (state is featuredProductsLoaded) {
                  //TODO::Show home here

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Featured Products",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 110,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.productModel.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppTheme.primaryColor, width: 5),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 6,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.network(
                                        state.productModel[index].image,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      state.productModel[index].name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }

                return homeWidget;
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void dispose() {
    super.dispose();
  }
}
