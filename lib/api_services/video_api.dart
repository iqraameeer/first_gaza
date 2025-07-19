import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pehli_gaza_app/model/video_model.dart';
import 'GraphQLService.dart';

class VideoAPI {
  Future<List<VideoModel>> fetchVideos() async {
    if (GraphQLConfig.authTokenNotifier == null) {
      print("No token found. Please login first.");
      return []; // No token, return empty list
    }
    const String query = '''
      query {
        getVideos {
          success
          error
          message
          data {
            title
            link
            thumbnail
          }
        }
      }
    ''';

    try {
      final QueryOptions options = QueryOptions(
        document: gql(query),
      );

      final QueryResult result = await GraphQLConfig.clientNotifier.value
          .query(options); // Access the client through clientNotifier

      if (result.hasException) {
        print("Result: ${result.exception.toString()}");
        return []; // Return an empty list in case of error
      }

      final data = result.data?['getVideos'];
      if (data != null && data['success']) {
        return (data['data'] as List)
            .map((videoJson) => VideoModel.fromJson(videoJson))
            .toList();
      } else {
        print('Error: ${data?['error']}');
        return []; // Return an empty list if the fetch is unsuccessful
      }
    } catch (e) {
      print('Error fetching videos: $e');
      return []; // Return an empty list in case of error
    }
  }
}
