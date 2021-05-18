import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

class Server{
  static String apiKey = 'O6MslD0K66buTTAl6EnooxwKyMK2';
  static Future<http.Response> playerInfo(int pid){
    var url = 'https://cricapi.com/api/playerStats?pid=$pid&apikey=$apiKey';
    Future<http.Response> future = http.get(url);
    return future;
  }
  static Future<http.Response> getPlayerId([String name]){

    var url = 'https://cricapi.com/api/playerFinder?name=$name&apikey=$apiKey';
    Future<http.Response> future = http.get(url);
    return future;
  }
  static String api = 'b342bf049b6047a0a6bc30366e22192b';
  static Future<http.Response> getNews([String country]){
    country = country??'in';     //null operator
    var url = 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$api';
   Future<http.Response> future = http.get(url);
   return future;
  }
//  static Future<http.Response> getMusic([String artistName]){
//    var url = 'https://itunes.apple.com/search?term=$artistName&limit=25';
//    Future<http.Response> future = http.get(url);
//    return future;
//  }

}
