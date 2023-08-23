import 'package:flutter/material.dart';
import 'package:news_app/services/newsClient.dart';
import 'package:news_app/services/newsModel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NewsClient nClient = NewsClient();

  // List<dynamic> nList = [];

  // news getter
  Future<dynamic> _getNews() async {
    // phle pura map mngawa lo
    Map<String, dynamic> newsMap = await nClient.getNews();
    // uske baad articles waai list ko extract kr lo
    // List<dynamic> nList = newsMap["articles"];
    // uske baad List of maps se convert krdo List of NewsModel mein
    List<NewsModel> specificList = genericToSpecific(newsMap["articles"]);

    return specificList;
  }

  // generic(map of dynamics) to specific(either Sources or NewsClient) map type conversion
  genericToSpecific(List<dynamic> lst) {
    List<NewsModel> newsList = (lst.map((obj) {
      NewsModel singleNews = NewsModel.extractJSON(obj);
      return singleNews;
    })).toList();

    return newsList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("News App"),
          centerTitle: true,
          actions: [
            IconButton(
                iconSize: 18,
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(Icons.replay))
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 255, 229, 135),
          // context voh page ya jagh he jahan pe future builder cheezein build krega
          // snapshot => backend se jo data aa rha hoga uska object (json)
          // snapshot voh cheex=zein he jo build krni he
          // future voh funcion jo backend se data laa rha hoga
          child: FutureBuilder(
              future: _getNews(),
              builder: ((context, snapshot) {
                // show the loading circle if the conncetionstate is waiting
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                            color: Colors.yellow[100],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.network(
                                    snapshot.data[index].urlToImage,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    snapshot.data![index].title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index].description,
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      // color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index].url,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }));
                  // return Center(
                  //   child: Text(snapshot.data![0].title),
                  // );
                }
                return Container();
              })),
        ),
      ),
    );
  }
}
