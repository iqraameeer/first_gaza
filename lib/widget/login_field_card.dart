import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pehli_gaza_app/Utils/colors.dart';
import 'package:pehli_gaza_app/Utils/responsive_size.dart';
import 'package:pehli_gaza_app/api_services/mutationQuery.dart';
import 'package:pehli_gaza_app/config/route_imports.dart';
import 'package:pehli_gaza_app/model/registration_model.dart';
import 'package:pehli_gaza_app/widget/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api_services/GraphQLService.dart';
import '../api_services/registartion_api.dart';
import '../views/login/provider/login_provider.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final TextEditingController _phoneNumberController =
      TextEditingController(text: "");
  final TextEditingController _passwordController =
      TextEditingController(text: "");
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic>? userDetails;

  bool disableFields = false;
  bool _flag = true;
  RegistrationModel? registrationModel;
  late RegistrationAPI apiServices;
  bool isLoading = true;
  bool isDelivered = false;
  int pregnancyWeek = 0;
  late DateTime currentDate;
  String motherRegisteredDate = "";
  bool checkingUserLoggedIn = true;
  DateTime registrationDate = DateTime.now();
  DateTime deliveryDate = DateTime.now();
  String? _phoneError; // Track phone number error
  String? _passwordError; // Track password error

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _clearSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');
    await prefs.remove('userDetails');
    await prefs.remove('phoneNumber');
    await prefs.remove('password');
    await prefs.remove('deviceToken');
    GraphQLConfig.updateAuthToken('');
  }

  Future<void> _checkLoginStatus() async {
    setState(() {
      checkingUserLoggedIn = true;
    });

    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');
    if (authToken != null && authToken.isNotEmpty) {
      GraphQLConfig.updateAuthToken(authToken);
      final isValid = await _validateToken(authToken);
      if (isValid) {
        await _fetchUserDetails();
      } else {
        await _clearSharedPreferences();
        setState(() {
          checkingUserLoggedIn = false;
        });
      }
    } else {
      await _clearSharedPreferences();
      setState(() {
        checkingUserLoggedIn = false;
      });
    }
  }

  Future<bool> _validateToken(String token) async {
    QueryOptions options = QueryOptions(
      document: gql(userDetailMutation),
      fetchPolicy: FetchPolicy.noCache,
    );

    try {
      final QueryResult result = await GraphQLConfig.getClient().query(options);
      if (result.hasException) {
        print("Token validation error: ${result.exception}");
        return false;
      }
      final data = result.data?['find']?['data'];
      return data != null;
    } catch (e) {
      print("Token validation exception: $e");
      return false;
    }
  }

  Future<void> _login(GraphQLClient client) async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final String phoneNumber = _phoneNumberController.text;
    final String password = _passwordController.text;
    await _clearSharedPreferences();

    final String? deviceToken = await FirebaseMessaging.instance.getToken();
    if (deviceToken == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: Unable to retrieve device token."),
          backgroundColor: Color(0xFF0281C1),
          duration: Duration(seconds: 3),
        ),
      );
      print("Error: Device token is null.");
      loginProvider.loadingEnd();
      return;
    }

    final MutationOptions options = MutationOptions(
      document: gql(loginMutation),
      variables: {
        "args": {
          "phoneNumber": phoneNumber,
          "password": password,
          "deviceToken": deviceToken,
        },
      },
      fetchPolicy: FetchPolicy.noCache,
    );

    try {
      final QueryResult result = await client.mutate(options);

      if (result.hasException) {
        String errorMessage = result.exception.toString().toLowerCase();
        if (errorMessage.contains('phone') || errorMessage.contains('number')) {
          setState(() {
            _phoneError = 'Incomplete  number';
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Incomplete number"),
              backgroundColor: Color(0xFF0281C1),
              duration: Duration(seconds: 3),
            ),
          );
        } else if (errorMessage.contains('password')) {
          setState(() {
            _passwordError = 'Password is required';
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Password is required"),
              backgroundColor: Color(0xFF0281C1),
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Login Error: Invalid credentials"),
              backgroundColor: Color(0xFF0281C1),
              duration: Duration(seconds: 3),
            ),
          );
        }
        print("Login error: ${result.exception}");
        loginProvider.loadingEnd();
        return;
      }

      final data = result.data?['Login'];
      if (data != null && data['success'] == true) {
        final String? token = data['data'];
        if (token != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('authToken', token);
          await prefs.setString('deviceToken', deviceToken);
          GraphQLConfig.updateAuthToken(token);
          await _fetchUserDetails();
        } else {
          throw Exception("Login token is null");
        }
      } else {
        String errorMessage = data?['message']?.toLowerCase() ?? '';
        if (errorMessage.contains('phone') || errorMessage.contains('number')) {
          setState(() {
            _phoneError = 'Incomplete or invalid number';
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Incomplete or invalid number"),
              backgroundColor: Color(0xFF0281C1),
              duration: Duration(seconds: 3),
            ),
          );
        } else if (errorMessage.contains('password')) {
          setState(() {
            _passwordError = 'Password is required';
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Password is required"),
              backgroundColor: Color(0xFF0281C1),
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          throw Exception("Invalid credentials");
        }
        loginProvider.loadingEnd();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login Error"),
          backgroundColor: Color(0xFF0281C1),
          duration: Duration(seconds: 3),
        ),
      );
      print("Login exception: $e");
      await _clearSharedPreferences();
      loginProvider.loadingEnd();
    } finally {
      loginProvider.loadingEnd();
    }
  }

  Future<void> _fetchUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');
    if (token == null || token.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: No auth token found"),
          backgroundColor: Color(0xFF0281C1),
          duration: Duration(seconds: 3),
        ),
      );
      print("No auth token found");
      await _clearSharedPreferences();
      setState(() {
        checkingUserLoggedIn = false;
      });
      return;
    }

    GraphQLConfig.updateAuthToken(token);

    QueryOptions options = QueryOptions(
      document: gql(userDetailMutation),
      fetchPolicy: FetchPolicy.noCache,
    );

    try {
      final QueryResult result = await GraphQLConfig.getClient().query(options);

      if (result.hasException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: Failed to fetch user details"),
            backgroundColor: Color(0xFF0281C1),
            duration: Duration(seconds: 3),
          ),
        );
        print("User Detail Error: ${result.exception}");
        await _clearSharedPreferences();
        setState(() {
          checkingUserLoggedIn = false;
        });
        return;
      }

      final userDetails = result.data?['find']?['data'];
      if (userDetails != null) {
        await prefs.setString('userDetails', jsonEncode(userDetails));
        final phoneNumber = userDetails['phoneNumber'];
        if (phoneNumber != null) {
          await prefs.setString('phoneNumber', phoneNumber);
          print("Phone number saved: $phoneNumber");
        } else {
          throw Exception("Phone number not found in user details");
        }

        final password = _passwordController.text;
        if (password.isNotEmpty) {
          await prefs.setString('password', password);
          print("Password saved: $password");
        }

        if (userDetails['pregnancyWeek'] != null) {
          setState(() {
            pregnancyWeek = userDetails['pregnancyWeek'];
          });
        }

        print("User details saved to SharedPreferences.");
        setState(() {
          checkingUserLoggedIn = false;
        });
        Get.offAllNamed(AppRoutes.bottomNavBar);
      } else {
        throw Exception("User details not found");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: Failed to fetch user details"),
          backgroundColor: Color(0xFF0281C1),
          duration: Duration(seconds: 3),
        ),
      );
      print("Fetch user details exception: $e");
      await _clearSharedPreferences();
      setState(() {
        checkingUserLoggedIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Card(
            margin: const EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Let's sign you in",
                      style: TextStyle(
                        fontFamily: "PlusJakartaSans",
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: ColorsConstant.signintxt,
                      ),
                    ),
                    Text(
                      "Please enter the details to continue",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: "PlusJakartaSans",
                        color: ColorsConstant.signintxt,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Phone Number',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "PlusJakartaSans",
                          color: ColorsConstant.signintxt,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    AbsorbPointer(
                      absorbing: disableFields || checkingUserLoggedIn,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: _phoneError != null
                                ? Colors.red
                                : ColorsConstant.fieldborder,
                          ),
                        ),
                        width: ResponsiveSize.sizeWidth(context),
                        child: TextFormField(
                          cursorColor: ColorsConstant.primaryColor,
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          maxLength: 13,
                          decoration: InputDecoration(
                            hintText: 'Ex: +92xxxxxxxxxx',
                            hintStyle: TextStyle(
                                color: ColorsConstant.hinttxt, fontSize: 10),
                            prefixIcon: Icon(Icons.phone,
                                color: ColorsConstant.btnlogin),
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 20.0, 10.0),
                            border: InputBorder.none,
                            counterText: '',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _phoneError = null; // Clear error on change
                            });
                          },
                          validator: (value) {
                            final RegExp phoneNumberRegExp =
                                RegExp(r'^\+92\d{10}$');

                            if (value == null || value.isEmpty) {
                              setState(() {
                                _phoneError = 'Phone number is required';
                              });
                              return null;
                            }

                            if (!phoneNumberRegExp.hasMatch(value)) {
                              setState(() {
                                _phoneError = 'Incomplete ';
                              });
                              return null;
                            }

                            setState(() {
                              _phoneError = null;
                            });
                            return null;
                          },
                        ),
                      ),
                    ),
                    if (_phoneError != null)
                      Text(
                        _phoneError!,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontFamily: "PlusJakartaSans",
                        ),
                      ),
                    const SizedBox(height: 20),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "PlusJakartaSans",
                          color: ColorsConstant.signintxt,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    AbsorbPointer(
                      absorbing: disableFields || checkingUserLoggedIn,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: _passwordError != null
                                ? Colors.red
                                : ColorsConstant.fieldborder,
                          ),
                        ),
                        width: ResponsiveSize.sizeWidth(context),
                        child: TextFormField(
                          controller: _passwordController,
                          cursorColor: ColorsConstant.primaryColor,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                color: ColorsConstant.hinttxt, fontSize: 10),
                            prefixIcon: Icon(Icons.lock,
                                color: ColorsConstant.btnlogin),
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 20.0, 10.0),
                            border: InputBorder.none,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _flag = !_flag;
                                setState(() {});
                              },
                              child: _flag
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                          ),
                          obscureText: _flag,
                          onChanged: (value) {
                            setState(() {
                              _passwordError = null; // Clear error on change
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              setState(() {
                                _passwordError = 'Password is required';
                              });
                              return null;
                            }
                            setState(() {
                              _passwordError = null;
                            });
                            return null;
                          },
                        ),
                      ),
                    ),
                    if (_passwordError != null) // Display error below field
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          _passwordError!,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontFamily: "PlusJakartaSans",
                          ),
                        ),
                      ),
                    const SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () {
                        if (!checkingUserLoggedIn) {
                          Get.toNamed(AppRoutes.forgetPassword);
                        }
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "PlusJakartaSans",
                            color: ColorsConstant.btnlogin,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: ResponsiveSize.sizeWidth(context),
                      height: 45,
                      decoration: BoxDecoration(
                        color: loginProvider.isLoading || checkingUserLoggedIn
                            ? ColorsConstant.btnlogin.withOpacity(0.5)
                            : ColorsConstant.btnlogin,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CustomButton(
                        text: "Login",
                        backgroundColor: Colors.transparent,
                        textColor: Colors.white,
                        width: ResponsiveSize.sizeWidth(context),
                        height: 45,
                        fontFamily: 'PlusJakartaSans',
                        isLoginButton: true,
                        onPressed: (loginProvider.isLoading ||
                                checkingUserLoggedIn)
                            ? null
                            : () async {
                                setState(() {
                                  _phoneError = null;
                                  _passwordError = null;
                                });
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }

                                final isConnected =
                                    await InternetConnectionChecker()
                                        .hasConnection;
                                if (!isConnected) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "Please check your internet connection and try again"),
                                      backgroundColor: Color(0xFF0281C1),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                  return;
                                }

                                await loginProvider.loadingStart();
                                _login(GraphQLProvider.of(context).value);
                              },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (loginProvider.isLoading)
          Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0281C1)),
            ),
          ),
      ],
    );
  }
}
