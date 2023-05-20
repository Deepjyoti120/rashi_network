import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/viewmodel/provider/api_future_state.dart';
import 'package:rashi_network/views/blogs/blogs_details.dart';
class LatestBlogsAllView extends ConsumerStatefulWidget {
  const LatestBlogsAllView({super.key});

  @override
  ConsumerState<LatestBlogsAllView> createState() => _LatestBlogsAllViewState();
}

class _LatestBlogsAllViewState extends ConsumerState<LatestBlogsAllView> {
  @override
  Widget build(BuildContext context) { 
    final latestBlogsFuture = ref.watch(futureLatestBlogs);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Blogs',
          color: Colors.white,
          fontSize: 20,
          fontWeight: 600,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        centerTitle: true,
      ),
      body: latestBlogsFuture.when(
        data: (data) {
          return ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(12),
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
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      width: 200,
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
                            width: double.infinity,
                            child: Image.network(
                              'https://thetaramandal.com/public/post/${livedata.image!}',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: DesignText(
                              livedata.title!,
                              fontSize: 12,
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
    );
  }
}
