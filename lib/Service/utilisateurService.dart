import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project/model/Abonne.dart';
import 'package:project/model/Besoin.dart';
import 'package:project/model/Livraison.dart';
import 'package:project/model/Livreur.dart';
import 'package:project/model/User.dart';

class UtilisateurService {
  UtilisateurService._instantiate();
  //String key = consumerKey;

  static final UtilisateurService instance = UtilisateurService._instantiate();

  final String _baseUrl =
      'http://ec2-54-162-95-240.compute-1.amazonaws.com:8080/Yobulma/yobulma/';
  //String _nextPageToken = '';

  Future<String> enregistrerUnNouveauAbonne(
      Map<String, dynamic> NouveauAbonne) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    print("la valeur de l'utilisateur à envoyer ${json.encode(NouveauAbonne)}");
    print(_baseUrl + "enregistrerNouveauAbonne");
    var response = await http.post(_baseUrl + "enregistrerNouveauAbonne",
        headers: headers, body: json.encode(NouveauAbonne));
    print(response.body);
    if (response.statusCode == 200) {
      return "user created successfuly";
    }
  }

  Future<String> enregistrerUnNouveauLivreur(
      Map<String, dynamic> NouveauAbonne) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    print("la valeur de l'utilisateur à envoyer ${json.encode(NouveauAbonne)}");
    print(_baseUrl + "register");
    var response = await http.post(_baseUrl + "register",
        headers: headers, body: json.encode(NouveauAbonne));
    print(response.body);
    if (response.statusCode == 200) {
      return "user created successfuly";
    }
  }

  //inscrire un utilisateur abonne ,livreur ,chef de zone ou l'administrateur
  Future<User> Login(Map<String, dynamic> user) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    print("la valeur de l'utilisateur à envoyer ${json.encode(user)}");
    print(_baseUrl + "login");
    var response = await http.post(_baseUrl + "login",
        headers: headers, body: json.encode(user));
    // print(response.body);
    print(json.decode(response.body)['currentUser']);
    if (response.statusCode == 200) {
      var user = json.decode(response.body)['currentUser'];
      print(user);

      User curentUser = User.fromJson(user);
      print("current user object $curentUser");

      //      //print(user['currentUser']);

      return curentUser;
    }
  }

  //inscrire un utilisateur abonne ,livreur ,chef de zone ou l'administrateur
  Future<Besoin> enregistrerBesoin(Map<String, dynamic> newbesoin) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    print("la valeur de l'utilisateur à envoyer ${json.encode(newbesoin)}");
    print(_baseUrl + "addbesoin");
    var response = await http.post(_baseUrl + "addbesoin",
        headers: headers, body: json.encode(newbesoin));
    // print(response.body);
    print(json.decode(response.body));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var besoin = json.decode(response.body);
      print("besoin avant $besoin");

      Besoin curentBesoin = Besoin.fromJson(besoin);
      print("current user object $curentBesoin");
      return curentBesoin;
    }
  }

  //enregistrerliraison
  Future<Livraison> enregistrerLivraison(Map<String, dynamic> newbesoin) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    print("la valeur de l'utilisateur à envoyer ${json.encode(newbesoin)}");
    print(_baseUrl + "addlivraison");
    var response = await http.post(_baseUrl + "addlivraison",
        headers: headers, body: json.encode(newbesoin));
    // print(response.body);
    print(json.decode(response.body));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var livraison = json.decode(response.body);
      print("besoin avant $livraison");

      Livraison curentLivraison = Livraison.fromJson(livraison);
      print("current user object $curentLivraison");
      return curentLivraison;
    }
  }

  //confirmerLiraison
  Future<Besoin> confirmerLivraison(
      Map<String, dynamic> newbesoin, int id) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    print("la valeur de l'utilisateur à envoyer ${json.encode(newbesoin)}");
    print(_baseUrl + "addlivraison");
    var response = await http.put(_baseUrl + "besoin/" + "$id",
        headers: headers, body: json.encode(newbesoin));
    // print(response.body);
    print(json.decode(response.body));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var besoin = json.decode(response.body);
      print("besoin avant $besoin");

      Besoin curentBesoin = Besoin.fromJson(besoin);
      print("current user object $curentBesoin");
      return curentBesoin;
    }
  }

/*
  http://ec2-54-152-106-79.compute-1.amazonaws.com:8080/Yobulma/yobulma/besoinbyabonne/13
*/
  Future<List<Besoin>> getBesoinByABonne(int id) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    print("la valeur de l'utilisateur à envoyer ${json.encode(id)}");
    print(_baseUrl + "besoinbyabonne/" + "$id");
    var response =
        await http.get(_baseUrl + "besoinbyabonne/" + "$id", headers: headers);
    // print(response.body);
    var convertDataJson = jsonDecode(response.body) as List;

    if (response.statusCode == 200) {
      var besoin = json.decode(response.body);
      List<Besoin> besoinjson =
          convertDataJson.map((besoin) => Besoin.fromJson(besoin)).toList();
      print("besoin avant $besoinjson");
      return besoinjson;
    }
  }

  //get la liste des livraison qu'un livreur doit valider
  Future<List<Livraison>> getLiraisonByLivreur(int id) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    print("la valeur de l'utilisateur à envoyer ${json.encode(id)}");
    print(_baseUrl + "livraisonbylivreur/" + "$id");
    var response = await http.get(_baseUrl + "livraisonbylivreur/" + "$id",
        headers: headers);
    // print(response.body);
    var convertDataJson = jsonDecode(response.body) as List;

    if (response.statusCode == 200) {
      var livraison = json.decode(response.body);
      List<Livraison> besoinjson = convertDataJson
          .map((livraison) => Livraison.fromJson(livraison))
          .toList();
      print("besoin avant $besoinjson");
      return besoinjson;
    }
  }

  ///getAllLireur
  Future<List<LivreurModel>> getAllLireur() async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    print(_baseUrl + "allLivreur/");
    var response = await http.get(_baseUrl + "allLivreur/", headers: headers);
    // print(response.body);
    var convertDataJson = jsonDecode(response.body) as List;

    if (response.statusCode == 200) {
      var besoin = json.decode(response.body);
      List<LivreurModel> livreur = convertDataJson
          .map((besoin) => LivreurModel.fromJson(besoin))
          .toList();
      print("besoin avant $livreur");
      return livreur;
    }
  }

  ///getAllbesoin
  Future<List<Besoin>> getAllBesoins() async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    print(_baseUrl + "allbesoin/");
    var response = await http.get(_baseUrl + "allbesoin/", headers: headers);
    // print(response.body);
    var convertDataJson = jsonDecode(response.body) as List;

    if (response.statusCode == 200) {
      var besoin = json.decode(response.body);
      List<Besoin> besoins =
          convertDataJson.map((besoin) => Besoin.fromJson(besoin)).toList();
      print("besoin avant $besoins");
      return besoins;
    }
  }

  ///getAllLireur
  Future<List<AbonneModel>> getAllAbonne() async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    print(_baseUrl + "allLivreur/");
    var response = await http.get(_baseUrl + "allAbonne/", headers: headers);
    // print(response.body);
    var convertDataJson = jsonDecode(response.body) as List;

    if (response.statusCode == 200) {
      var besoin = json.decode(response.body);
      List<AbonneModel> abonne = convertDataJson
          .map((besoin) => AbonneModel.fromJson(besoin))
          .toList();
      print("besoin avant $abonne");
      return abonne;
    }
  }

  ///getaboonebybesoin
  Future<AbonneModel> getAbonneByBesoin(int id) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    print(_baseUrl + "getAbonneBybesoin/");
    var response = await http.get(_baseUrl + "getAbonneBybesoin/" + "$id",
        headers: headers);
    // print(response.body);
    var convertDataJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      var abonneres = json.decode(response.body);
      AbonneModel abonne = AbonneModel.fromJson(abonneres);
      print("abonne $abonne");
      return abonne;
    }
  }

  ///getLireurBybesoin

  Future<LivreurModel> getLivreurByBesoin(int id) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    print(_baseUrl + "getLivreurBybesoin/");
    var response = await http.get(_baseUrl + "getLivreurBybesoin/" + "$id",
        headers: headers);
    // print(response.body);
    var convertDataJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      var abonneres = json.decode(response.body);
      LivreurModel livreur = LivreurModel.fromJson(abonneres);
      print("abonne $livreur");
      return livreur;
    }
  }

  ///Paiement

  Future<String> Paiement() async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    print(_baseUrl + "paiement/");
    var response = await http.post(_baseUrl + "paiement/", headers: headers);
    // print(response.body);
    var convertDataJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      String url = json.decode(response.body);
      /*  LivreurModel livreur = LivreurModel.fromJson(abonneres);
      print("abonne $livreur");*/
      return url;
    }
  }

/*[
  Future<String> createOrder(Map<dynamic, dynamic> order) async {
    Map<String, String> parameters = {
      //'part': 'snippet, contentDetails, statistics',
      //'id': channelId,
      'key': consumerKey,
    };
    Map<String, String> authorization = {
      "consumer_key": "ck_7b4ff1a59239f94c1cc4d70f0cf22ce9c8e2f6bc",
      "consumer_secret": "cs_b231413e9c5250005e6c99446f0ccec60a2f2e6c",
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: authorization['consumer_key']

      //key:consumerKey
    };

    print("la valeur de l'utilisateur à envoyer ${json.encode(order)}");
    var response = await http.post("http://appkme.sn/wp-json/wc/v3/orders",
        headers: headers,
        // key:consumerKey,
        body: json.encode(order));
    //print(response.body);
    print(response.statusCode);
    if (response.statusCode == 201) {
      return "order  created successfuly";
    }
  }


  Future<Channel> fetchChannel({String channelId}) async {
    Map<String, String> parameters = {
      'part': 'snippet, contentDetails, statistics',
      'id': channelId,
      'key': API_Key,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    // Get Channel
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body)['items'][0];
      Channel channel = Channel.fromMap(data);

      // Fetch first batch of videos from uploads playlist
      channel.videos = await fetchVideosFromPlaylist(
        playlistId: channel.uploadPlaylistId,
      );
      return channel;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  Future<List<Video>> fetchVideosFromPlaylist({String playlistId}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playlistId,
      'maxResults': '50',
      'pageToken': _nextPageToken,
      'key': API_Key,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    // Get Playlist Videos
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      _nextPageToken = data['nextPageToken'] ?? '';
      List<dynamic> videosJson = data['items'];

      // Fetch first eight videos from uploads playlist
      List<Video> videos = [];
      videosJson.forEach(
        (json) => videos.add(
          Video.fromMap(json['snippet']),
        ),
      );
      return videos;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  Future<List<Song>> fetchSongFromPlaylist() async {
    print("the method is call let's see what ze'll happen");
]*/
/*
    http://appkme.sn/wp-json/wp/v2/Media/?filter%20media_type=audio
    http://appkme.sn/wp-json/wp/v2/Media/
*/ /*

    final response = await http.get(
        'http://appkme.sn/wp-json/wp/v2/Media/?per_page=100',
        headers: {"Accept": "application/json", 'Content-Type': 'audio/mpeg'});

    var convertDataJson = jsonDecode(response.body) as List;
    */
/* List<Map> maptosong = [];
    convertDataJson.forEach((element) {
      maptosong.add(element['id']);
      maptosong.add(element['title']['rendered']);
      maptosong.add(element['media_details']['length']);
      maptosong.add(element['source_url']);
       maptosong.add(element['id']);
    });*/ /*

    //print(maptosong);
    print("la donne convertit ${convertDataJson}");
    // var tagObjsJson = jsonDecode(arrayObjsText)['tags'] as List;
    List<Song> videojson =
        convertDataJson.map((SongJson) => Song.fromJson(SongJson)).toList();

    for (var i = 0; i < videojson.length; i++) {
      if (videojson[i].mediaType != 'file') {
        print("l'element à supprimer ${videojson[i]}");
        videojson.removeWhere((element) => element.mediaType == 'image');
        //   videojson.remove(videojson[i]);
      }
      //videojson = videojson;
    }
*/
/*    videojson.forEach((element) {
      print("la liste des elements${element.mediaType}");
      if (element.mediaType != 'file') {
        print(element.mediaType);
        videojson.remove(element);
      }
    });*/ /*


    print("la liste d'instance de son ${videojson}");
    print(videojson[0].title);
    return videojson;
  }
*/

/*List<Song> songs = [];
      List<dynamic> snippet = [];
      for (var element in data) {
        print("les elements ${element['id']}");
        snippet.add(element['id']);
        snippet.add(element['title']['rendered']);
        songs.add(element['media_details']['length_formatted']);
        songs.add(element['source_url']);*/
// songs.add(element['id']);

}
//_nextPageToken = data['nextPageToken'] ?? '';
//   List<dynamic> videosJson = data;

// Fetch first eight videos from uploads playlist

/*  videosJson.forEach(
        (json) => songs.add(Song.fromList(snippet)),
      );
      print("la liste des ${songs}");
      return songs;
    } else {
      throw json.decode(response.body)['error']['message'];
    }*/
