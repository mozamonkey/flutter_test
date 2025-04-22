import '../models/restaurant.dart';

final mockRestaurants = [
  Restaurant(
    id: '1',
    name: 'The Gourmet Kitchen and Bar with a view',
    price: '\$\$',
    rating: 4.5,
    photos: ['https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=800'],
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
    photos: ['https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=800'],
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
      // Category(
      //   title: 'Sushi',
      //   alias: 'sushi',
      // ),
    ],
    hours: [Hours(isOpenNow: false)],
    location: Location(
      formattedAddress: '456 Sushi Ave, Las Vegas, NV 89102',
    ),
  ),
  Restaurant(
    id: '3',
    name: 'La Piazza',
    price: '\$\$\$',
    rating: 4.7,
    photos: ['https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=800'],
    reviews: [
      Review(
        id: 'r3',
        rating: 5,
        text: 'Authentic Italian flavors!',
        user: User(
          id: 'u3',
          name: 'Maria Garcia',
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
      formattedAddress: '789 Pizza Lane, Las Vegas, NV 89103',
    ),
  ),
  Restaurant(
    id: '4',
    name: 'Spice Garden',
    price: '\$\$',
    rating: 4.6,
    photos: ['https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=800'],
    reviews: [
      Review(
        id: 'r4',
        rating: 4,
        text: 'Delicious Indian cuisine with great vegetarian options',
        user: User(
          id: 'u4',
          name: 'Sarah Wilson',
          imageUrl: 'https://example.com/user4.jpg',
        ),
      ),
    ],
    categories: [
      Category(
        title: 'Indian',
        alias: 'indian',
      ),
      Category(
        title: 'Vegetarian',
        alias: 'vegetarian',
      ),
    ],
    hours: [Hours(isOpenNow: true)],
    location: Location(
      formattedAddress: '321 Curry Street, Las Vegas, NV 89104',
    ),
  ),
  Restaurant(
    id: '5',
    name: 'El Mariachi',
    price: '\$\$',
    rating: 4.4,
    photos: ['https://images.unsplash.com/photo-1615870216519-2f9fa575fa5c?w=800'],
    reviews: [
      Review(
        id: 'r5',
        rating: 4,
        text: 'Best tacos and margaritas in town!',
        user: User(
          id: 'u5',
          name: 'Carlos Rodriguez',
          imageUrl: 'https://example.com/user5.jpg',
        ),
      ),
    ],
    categories: [
      Category(
        title: 'Mexican',
        alias: 'mexican',
      ),
      Category(
        title: 'Tex-Mex',
        alias: 'texmex',
      ),
    ],
    hours: [Hours(isOpenNow: true)],
    location: Location(
      formattedAddress: '567 Taco Way, Las Vegas, NV 89105',
    ),
  ),
  Restaurant(
    id: '6',
    name: 'Golden Dragon',
    price: '\$\$',
    rating: 4.3,
    photos: ['https://images.unsplash.com/photo-1525755662778-989d0524087e?w=800'],
    reviews: [
      Review(
        id: 'r6',
        rating: 4,
        text: 'Excellent dim sum and friendly service',
        user: User(
          id: 'u6',
          name: 'Lucy Chang',
          imageUrl: 'https://example.com/user6.jpg',
        ),
      ),
    ],
    categories: [
      Category(
        title: 'Chinese',
        alias: 'chinese',
      ),
      Category(
        title: 'Dim Sum',
        alias: 'dimsum',
      ),
    ],
    hours: [Hours(isOpenNow: true)],
    location: Location(
      formattedAddress: '890 Dragon Street, Las Vegas, NV 89106',
    ),
  ),
];

final mockRestaurantResult = RestaurantQueryResult(
  total: mockRestaurants.length,
  restaurants: mockRestaurants,
); 