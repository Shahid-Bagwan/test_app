import 'package:flutter/material.dart';
import 'package:test_app/_mock_data/mock.dart';
import 'package:test_app/widgets/video_detail.dart';
import 'package:test_app/widgets/video_tile.dart';

import '../widgets/home_side_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFollowingSelected = true;
  int _snappedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => {
                  setState(() {
                    _isFollowingSelected = true;
                  })
                },
                child: Text(
                  "Following",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: _isFollowingSelected ? 18 : 15,
                      color: _isFollowingSelected ? Colors.white : Colors.grey),
                ),
              ),
              Text(
                "   |   ",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 15, color: Colors.grey),
              ),
              GestureDetector(
                onTap: () => {
                  setState(() {
                    _isFollowingSelected = false;
                  })
                },
                child: Text(
                  "For you",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: !_isFollowingSelected ? 18 : 15,
                      color:
                          !_isFollowingSelected ? Colors.white : Colors.grey),
                ),
              )
            ],
          ),
        ),
        body: PageView.builder(
            onPageChanged: (int page) => {
                  setState(() {
                    _snappedPageIndex = page;
                  }),
                },
            scrollDirection: Axis.vertical,
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  VideoTile(
                    video: videos[index],
                    currentIndex: index,
                    snappedPageIndex: _snappedPageIndex,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                            height: MediaQuery.of(context).size.height / 4,
                            child: VideoDetail(video: videos[index])),
                      ),
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.75,
                          child: HomeSideBar(
                            video: videos[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }));
  }
}
