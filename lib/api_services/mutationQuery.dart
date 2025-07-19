// GraphQL Mutation String
const String loginMutation = """
mutation Login(\$args: UpdateUserInput!) {
  Login(args: \$args) {
    success
    error
    message
    data
  }
}
""";

const String userDetailMutation = """
    query Query {
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
        deliveryDate
        edd
        IsDelivered
        email
        createdAt
        deviceToken
          }
        }
      }
    }
  """;
