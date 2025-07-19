import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static final ValueNotifier<String?> authTokenNotifier = ValueNotifier(null);

  static HttpLink getHttpLink() {
    return HttpLink(
      "https://pehlighiza.akdndhrc.com/api/",
      defaultHeaders: {
        'Authorization': authTokenNotifier.value ?? '',
        'AuthorizationSource': 'API',
      },
    );
  }

  static GraphQLClient getClient() {
    return GraphQLClient(
      link: getHttpLink(),
      cache: GraphQLCache(store: HiveStore()),
    );
  }

  static ValueNotifier<GraphQLClient> get clientNotifier {
    return ValueNotifier(getClient());
  }

  static void updateAuthToken(String newToken) {
    authTokenNotifier.value = newToken;
    authTokenNotifier.notifyListeners();
  }
}
