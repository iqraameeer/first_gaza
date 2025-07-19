// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
//
// final HttpLink _httpLink = HttpLink(
//   "http://93.127.195.209:3000/graphql",
//   defaultHeaders: {
//     'Authorization':
//         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MWY0MzE3N2NiYzA4ZjQ3N2M2YWM4ZSIsInJvbGUiOjIsImhvc3BpdGFsIjoiQUtVIiwibmFtZSI6Ik1lbW9uYSIsImlhdCI6MTczMzM4ODQ0MCwiZXhwIjoxNzM1OTgwNDQwfQ.HNiC4z5wwe7kl0pJV8NyFsRhAPw8VpqLCmfwz_yGTo4",
//     'AuthorizationSource': 'API',
//   },
// );
//
// // Define the client to manage GraphQL operations
// final ValueNotifier<GraphQLClient> client = ValueNotifier(
//   GraphQLClient(
//     link: _httpLink,
//     cache: GraphQLCache(
//         store: HiveStore()), // Enable Hive cache for better performance
//   ),
// );
