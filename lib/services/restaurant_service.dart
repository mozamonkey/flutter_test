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

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        
        // Check for GraphQL errors
        if (jsonResponse['errors'] != null) {
          print('GraphQL Errors: ${jsonResponse['errors']}');
          return null;
        }

        // Validate response structure
        if (jsonResponse['data'] == null || 
            jsonResponse['data']['search'] == null || 
            jsonResponse['data']['search']['businesses'] == null) {
          print('Invalid response structure: ${response.body}');
          return null;
        }

        return RestaurantQueryResult.fromJson(
          jsonResponse['data']['search'],
        );
      } else {
        print('Failed to load restaurants: ${response.statusCode}');
        print('Response body: ${response.body}');
        return null;
      }
    } catch (e, stackTrace) {
      print('Error fetching restaurants: $e');
      print('Stack trace: $stackTrace');
      return null;
    }
  }

  Future<RestaurantQueryResult?> getRestaurantById(String id) async {
    // TODO: Implement single restaurant fetch
    return null;
  }
} 