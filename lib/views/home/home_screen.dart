import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rashi_network/services/api/api_access.dart';
import 'package:rashi_network/ui/widgets/progress_circle.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/viewmodel/model/horoscope_model.dart';
import 'package:rashi_network/viewmodel/model/live_astrologer.dart';
import 'package:rashi_network/viewmodel/model/pr_release_model.dart';
import 'package:rashi_network/viewmodel/provider/api_future_state.dart';
import 'package:rashi_network/viewmodel/provider/appstate.dart';
import 'package:rashi_network/views/blogs/blogs_details.dart';
import 'package:rashi_network/views/blogs/view_all_blogs.dart';
import 'package:rashi_network/views/daily_horoscope/daily_horoscope.dart';
import 'package:rashi_network/views/home/home_first_view.dart';
import 'package:rashi_network/views/home/more_for_grid_view.dart';
import 'package:rashi_network/views/live_astrologer/live_astrologer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final PageController _controller = PageController(viewportFraction: 0.95);
  int currentPage = 0;
  List<String> bannerAssets = [
    'assets/img/banner/1.png',
    'assets/img/banner/2.png',
  ];
  @override
  Widget build(BuildContext context) {
    final appStateauto = ref.watch(appStateautoDispose);
    final homeBannerFuture = ref.watch(futureGetBanner);
    final latestBlogsFuture = ref.watch(futureLatestBlogs);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          homeBannerFuture.when(
            data: (data) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                      height: 152,
                      child: PageView.builder(
                          controller: _controller,
                          onPageChanged: (value) {
                            setState(() {
                              currentPage = value;
                            });
                          },
                          itemCount: bannerAssets.length,
                          itemBuilder: (context, index) {
                            final livedata = bannerAssets[index];
                            return GestureDetector(
                              onTap: () {},
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 5, left: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          width: 1,
                                          color: DesignColor.lightGrey,
                                        ),
                                      ),
                                      child: Image.asset(
                                        livedata,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                  // Positioned(
                                  //   bottom: 16,
                                  //   left: 30,
                                  //   child: DesignButtons(
                                  //     onPressed: () async {
                                  //       DesignUtlis.launchURL(livedata.btnLink!);
                                  //     },
                                  //     textLabel: 'View',
                                  //     isTappedNotifier: ValueNotifier(false),
                                  //     sideWidth: 1,
                                  //     colorText: DesignColor.darkTeal1,
                                  //     borderSide: true,
                                  //     colorBorderSide: DesignColor.darkTeal1,
                                  //     fontSize: 14,
                                  //     color: Colors.transparent,
                                  //   ),
                                  // ),
                                ],
                              ),
                            );
                          })),
                  Positioned(
                    bottom: 14,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        data.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                  ),
                ],
              );
            },
            error: (error, stackTrace) {
              return const SizedBox(
                  height: 24, width: 24, child: DesignProgress());
            },
            loading: () {
              return const SizedBox(
                  height: 24, width: 24, child: DesignProgress());
            },
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeFirstView(appStateauto: appStateauto),
                const SizedBox(height: 10),
                const DesignText(
                  'We have More for you',
                  fontSize: 20,
                  fontWeight: 600,
                ),
                const SizedBox(height: 10),
                MoreForYouCardGrid(appStateauto: appStateauto),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const DesignText(
                      'Daily Horoscope',
                      fontSize: 20,
                      fontWeight: 600,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DailyHoroscope(),
                            ));
                      },
                      child: const DesignText(
                        'View all',
                        fontSize: 13,
                        fontWeight: 400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          SizedBox(
            height: 125,
            child: ListView.builder(
                itemCount: HoroscopeModel.items.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  final livedata = HoroscopeModel.items[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      width: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                          color: DesignColor.lightGrey,
                        ),
                      ),
                      child: Image.asset(
                        livedata.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DesignText(
                  'Live Astrologers',
                  fontSize: 20,
                  fontWeight: 600,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LiveAstrologer(),
                        ));
                  },
                  child: const DesignText(
                    'View all',
                    fontSize: 13,
                    fontWeight: 400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 125,
            child: FutureBuilder<List<LiveAstrologerModel>>(
                future: ApiAccess().liveAstrologer(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var snap = snapshot.data!;
                    return ListView.builder(
                        itemCount: snap.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        itemBuilder: (context, index) {
                          final data = snap[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: SizedBox(
                              width: 125,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 125,
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      width: 125,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          width: 1,
                                          color: DesignColor.lightGrey,
                                        ),
                                      ),
                                      child: Image.asset(
                                        'assets/img/background.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(height: 6),
                                      Flexible(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2, color: Colors.green),
                                            borderRadius: BorderRadius.circular(
                                                60), // assuming height/width is 83
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            child: Image.network(
                                              'https://thetaramandal.com/public/astrologer/${data.photo}',
                                              height: 83,
                                              width: 83,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return const Icon(Icons.error);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: DesignText(
                                          data.name!,
                                          fontSize: 14,
                                          fontWeight: 600,
                                          textAlign: TextAlign.center,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return const SizedBox(
                      height: 24,
                      width: 24,
                      child: DesignProgress(
                        color: DesignColor.prepBlue,
                      ),
                    );
                  }
                }),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DesignText(
                  'Latest Blogs',
                  fontSize: 20,
                  fontWeight: 600,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LatestBlogsAllView(),
                        ));
                  },
                  child: const DesignText(
                    'View all',
                    fontSize: 13,
                    fontWeight: 400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 134,
            child: latestBlogsFuture.when(
              data: (data) {
                return ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemBuilder: (context, index) {
                      final livedata = data[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LatestBlogsDetails(
                                    text: livedata.body!,
                                    image:
                                        'https://thetaramandal.com/public/post/${livedata.image!}'),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            width: 181,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 1,
                                color: DesignColor.lightGrey,
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 82,
                                  width: double.infinity,
                                  child: Image.network(
                                    'https://thetaramandal.com/public/post/${livedata.image!}',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: DesignText(
                                    livedata.title!,
                                    fontSize: 9,
                                    fontWeight: 600,
                                    maxLines: 2,
                                  ),
                                )
                                // Padding(
                                //   padding: const EdgeInsets.all(4.0),
                                //   child: HtmlWidget(
                                //     livedata.body!,
                                //     textStyle: const TextStyle(
                                //       fontSize: 9,
                                //       fontWeight: FontWeight.w600,
                                //       overflow: TextOverflow.ellipsis,
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              error: (error, stackTrace) {},
              loading: () {},
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                DesignText(
                  'PR Release',
                  fontSize: 20,
                  fontWeight: 600,
                ),
                // DesignText(
                //   'View all',
                //   fontSize: 13,
                //   fontWeight: 400,
                // ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 125,
            child: FutureBuilder<List<PrReleaseModel>>(
                future: ApiAccess().prRelease(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final snap = snapshot.data!;
                    return ListView.builder(
                        itemCount: snap.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        itemBuilder: (context, index) {
                          final data = snap[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              width: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 1,
                                  color: DesignColor.lightGrey,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  print(data.desktopimg);
                                },
                                child: Image.network(
                                  "https://thetaramandal.com/public/banner/${data.desktopimg}",
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return Container();
                  }
                }),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      height: 6,
      width: currentPage == index ? 18 : 8,
      decoration: BoxDecoration(
        color: currentPage == index
            ? const Color(0xFF999999)
            : const Color(0xFFE6E6E6),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
