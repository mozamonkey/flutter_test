import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/restaurant.dart';
import '../query.dart';
import '../config/app_config.dart';

class RestaurantService {
  Future<RestaurantQueryResult?> getRestaurants({int offset = 0}) async {
    final headers = {
      'Authorization': 'Bearer ${AppConfig.yelpApiKey}',
      'Content-Type': 'application/graphql',
    };

    try {
      final response = await http.post(
        Uri.parse(AppConfig.yelpBaseUrl),
        headers: headers,
        body: query(offset),
      );

      // Detailed logging of the response
      // print('Response Status Code: ${response.statusCode}');
      // print('Response Headers: ${response.headers}');
      // print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        
        // Log the parsed JSON structure
        print('Parsed JSON Response: ${JsonEncoder.withIndent('  ').convert(jsonResponse)}');

        // Check for GraphQL errors with detailed logging
        if (jsonResponse['errors'] != null) {
          print('GraphQL Errors Found:');
          print(JsonEncoder.withIndent('  ').convert(jsonResponse['errors']));
          return null;
        }

        // Validate response structure with detailed logging
        if (jsonResponse['data'] == null) {
          print('Invalid response: Missing "data" field');
          return null;
        }
        
        if (jsonResponse['data']['search'] == null) {
          print('Invalid response: Missing "data.search" field');
          print('Available fields in data: ${jsonResponse['data'].keys.toList()}');
          return null;
        }
        
        if (jsonResponse['data']['search']['business'] == null) {
          print('Invalid response: Missing "data.search.business" field');
          print('Available fields in search: ${jsonResponse['data']['search'].keys.toList()}');
          return null;
        }

        return RestaurantQueryResult.fromJson(
          jsonResponse['data']['search'],
        );
      } else {
        print('HTTP Error: ${response.statusCode}');
        print('Error Response Body: ${response.body}');
        return null;
      }
    } catch (e, stackTrace) {
      print('Exception occurred while fetching restaurants:');
      print('Error: $e');
      print('Stack trace:');
      print(stackTrace);
      return null;
    }
  }

  Future<RestaurantQueryResult?> getRestaurantById(String id) async {
    final headers = {
      'Authorization': 'Bearer ${AppConfig.yelpApiKey}',
      'Content-Type': 'application/graphql',
    };


    try {
      final response = await http.post(
        Uri.parse(AppConfig.yelpBaseUrl),
        headers: headers,
        body: singleRestaurantQuery(id),
      );

      // Detailed logging of the response
      print('Single Restaurant Response Status Code: ${response.statusCode}');
      print('Single Restaurant Response Headers: ${response.headers}');
      print('Single Restaurant Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        
        // Log the parsed JSON structure
        print('Parsed Single Restaurant JSON Response: ${JsonEncoder.withIndent('  ').convert(jsonResponse)}');

        // Check for GraphQL errors
        if (jsonResponse['errors'] != null) {
          print('GraphQL Errors Found in Single Restaurant Query:');
          print(JsonEncoder.withIndent('  ').convert(jsonResponse['errors']));
          return null;
        }

        // Validate response structure
        if (jsonResponse['data'] == null) {
          print('Invalid response: Missing "data" field');
          return null;
        }
        
        if (jsonResponse['data']['business'] == null) {
          print('Invalid response: Missing "data.business" field');
          print('Available fields in data: ${jsonResponse['data'].keys.toList()}');
          return null;
        }

        // Convert the single business response to match the RestaurantQueryResult structure
        return RestaurantQueryResult(
          restaurants: [
            Restaurant.fromJson(jsonResponse['data']['business']),
          ],
        );
      } else {
        print('HTTP Error in Single Restaurant Query: ${response.statusCode}');
        print('Error Response Body: ${response.body}');
        return null;
      }
    } catch (e, stackTrace) {
      print('Exception occurred while fetching single restaurant:');
      print('Error: $e');
      print('Stack trace:');
      print(stackTrace);
      return null;
    }
  }
} 