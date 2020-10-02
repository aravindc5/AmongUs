import 'package:amongus/constants.dart';
import 'package:amongus/ui/floating_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              'https://i.ytimg.com/vi/EZ7la-hMNuk/maxresdefault.jpg'),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  const Text(
                    'Among Us',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Find the Imposter',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Container(
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 32),
                      child: Container(
                        height: 500,
                        child: Swiper(
                          itemCount: imageUrl.length,
                          itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                          layout: SwiperLayout.STACK,
                          pagination: SwiperPagination(
                              builder: DotSwiperPaginationBuilder(
                                  activeSize: 20, space: 5)),
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 120,
                                    ),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32)),
                                      color: Colors.grey[200],
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 150,
                                          ),
                                          Text(
                                            names[index],
                                            style: TextStyle(
                                              color: col[index],
                                              fontSize: 24,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                child: Column(
                                                  children: [
                                                    const Text(
                                                      'Wins',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      wins[index].toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 20),
                                              ),
                                              Container(
                                                child: Column(
                                                  children: [
                                                    const Text(
                                                      'Loses',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      wins.reversed
                                                          .toList()
                                                          .elementAt(index)
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 20),
                                              ),
                                              Container(
                                                child: Column(
                                                  children: [
                                                    const Text(
                                                      'IMPOSTER',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 17,
                                                          color: Colors.red),
                                                    ),
                                                    Text(
                                                      imposter[index]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 17,
                                                          color: Colors.red),
                                                    ),
                                                  ],
                                                ),
                                                margin:
                                                    EdgeInsets.only(left: 20),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 50,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                GestureDetector(
                                    child: Image.asset(imageUrl[index]),
                                    onTap: () {
                                      transformImage(index, context);
                                    })
                              ],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

transformImage(int index, BuildContext context) {
  Navigator.of(context).pushNamed(FloatingPage.routeName, arguments: index);
}
