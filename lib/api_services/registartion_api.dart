import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pehli_gaza_app/model/registration_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationAPI {
  final GraphQLClient client;

  RegistrationAPI(this.client);

  Future<RegistrationModel?> fetchUserData() async {
    final QueryOptions options = QueryOptions(
      document: gql("""
        query SuccessUserResponse {
          find {
            ... on SuccessUserResponse {
              success
              error
              message
              data {
                _id
                fullName
                phoneNumber
                hospital
                weekBefore
                IsDelivered
                createdAt
                deviceToken
        }
        }
        }
       }
      """),
      fetchPolicy: FetchPolicy.noCache,
    );

    final result = await client.query(options);

    if (!result.hasException && result.data != null) {
      final data = result.data!['find']['data'];
      print('API RESPONS$data');
      return RegistrationModel.fromJson(
          data); // Map the response to UserData model
    } else {
      return null;
    }
  }
}
