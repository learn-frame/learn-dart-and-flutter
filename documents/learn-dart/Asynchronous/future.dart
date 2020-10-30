// import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert';

const yanceyOfficialRepoAPI = '/users/YanceyOfficial/repos';
const yanceyBlogRepoAPI = '/orgs/Yancey-Blog/repos';

// FIXME:
Future<HttpClientResponse> getData(String path) async {
  const apiDomain = 'https://api.github.com';
  final url = '$apiDomain$path';
  final httpClient = new HttpClient();

  try {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      var json = await response.transform(utf8.decoder).join();
      var data = jsonDecode(json);
      return data as Future<HttpClientResponse>;
    } else {
      throw 'Error getting IP address:\nHttp status ${response.statusCode}';
    }
  } catch (exception) {
    throw 'Failed getting IP address';
  }
}

// void getDatas(String url) {
//   HttpRequest.getString(url).then((String result) {
//     print(result);
//     // then().catchError() 组合是 try-catch 的异步版本
//     // 不过基本都会使用 async + await 的方式
//   }).catchError((e) {
//     // Handle or ignore the error.
//   });
// }

void main() async {
  print(getData(yanceyBlogRepoAPI));

  // 链式调用
  try {
    final value = await getData(yanceyBlogRepoAPI);
    await getData(yanceyBlogRepoAPI);
    await getData(yanceyBlogRepoAPI);
    print('Done!');
  } catch (e) {
    /* Handle exception... */
  }

  // 等待多个 Future, 类比 JavaScript 的 Promise.all
  await Future.wait([
    getData(yanceyBlogRepoAPI),
    getData(yanceyBlogRepoAPI),
    getData(yanceyBlogRepoAPI)
  ]);
}
