import '../models/restaurant.dart';

final mockRestaurants = [
  Restaurant(
    id: '1',
    name: 'The Gourmet Kitchen',
    price: '\$\$',
    rating: 4.5,
    photos: ['https://example.com/restaurant1.jpg'],
    reviews: [
      Review(
        id: 'r1',
        rating: 5,
        text: 'Amazing food and service!',
        user: User(
          id: 'u1',
          name: 'John Doe',
          imageUrl: 'https://example.com/user1.jpg',
        ),
      ),
    ],
    categories: [
      Category(
        title: 'American',
        alias: 'american',
      ),
    ],
    hours: [Hours(isOpenNow: true)],
    location: Location(
      formattedAddress: '123 Main St, Las Vegas, NV 89101',
    ),
  ),
  Restaurant(
    id: '2',
    name: 'Sushi Master',
    price: '\$\$\$',
    rating: 4.8,
    photos: ['https://example.com/restaurant2.jpg'],
    reviews: [
      Review(
        id: 'r2',
        rating: 5,
        text: 'Best sushi in town!',
        user: User(
          id: 'u2',
          name: 'Jane Smith',
          imageUrl: 'https://example.com/user2.jpg',
        ),
      ),
    ],
    categories: [
      Category(
        title: 'Japanese',
        alias: 'japanese',
      ),
      Category(
        title: 'Sushi',
        alias: 'sushi',
      ),
    ],
    hours: [Hours(isOpenNow: true)],
    location: Location(
      formattedAddress: '456 Sushi Ave, Las Vegas, NV 89102',
    ),
  ),
  Restaurant(
    id: '3',
    name: 'Pizza Paradise',
    price: '\$',
    rating: 4.2,
    photos: ['https://example.com/restaurant3.jpg'],
    reviews: [
      Review(
        id: 'r3',
        rating: 4,
        text: 'Great value for money!',
        user: User(
          id: 'u3',
          name: 'Mike Johnson',
          imageUrl: 'https://example.com/user3.jpg',
        ),
      ),
    ],
    categories: [
      Category(
        title: 'Italian',
        alias: 'italian',
      ),
      Category(
        title: 'Pizza',
        alias: 'pizza',
      ),
    ],
    hours: [Hours(isOpenNow: true)],
    location: Location(
      formattedAddress: '789 Pizza St, Las Vegas, NV 89103',
    ),
  ),
];

final mockRestaurantResult = RestaurantQueryResult(
  total: mockRestaurants.length,
  restaurants: mockRestaurants,
); 