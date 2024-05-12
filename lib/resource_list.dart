import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//import 'thememanager.dart';
import 'resources.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ResourceList extends StatelessWidget {
  const ResourceList({Key? key}) : super(key: key);

  Future<List<LatestArticle>> fetchLatestArticles() async {
    final apiUrl =
        'https://www.afrotada.com/api/GetLatestResources?page=1&pageSize=10';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> articlesData = data['articles'];
      List<LatestArticle> articles = articlesData.map((articlesData) {
        return LatestArticle.fromJson(articlesData);
      }).toList();

      return articles;
    } else {
      throw Exception('Failed to load latest articles');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Afrotada app'),
        // actions: const [
        //   ThemeManagerWidget(),

        // ]
      ),
      body: FutureBuilder<List<LatestArticle>>(
        future: fetchLatestArticles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error: to load latest articles'),
            );
          } else {
            final articlesList = snapshot.data;
            return ListView.builder(
              itemCount: articlesList?.length,
              itemBuilder: (context, index) {
                final articles = articlesList?[index];
                log(articles!.image);
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: articles.image,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  title: Text(articles.title),
                  subtitle: Text(articles.content),
                );
              },
            );
          }
        },
      ),
    );
  }
}
