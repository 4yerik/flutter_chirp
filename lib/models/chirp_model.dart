import 'package:flutterchirp/models/user_model.dart';

class Chirp {
  final User sender;
  final String time;
  final String message;
  final bool isLoved;
  final bool seen;

  Chirp({
    this.sender,
    this.time,
    this.message,
    this.isLoved,
    this.seen,
  });
}

final User currentUser = User (
  id: 0,
  name: 'Current User',
  imageURL: 'assets/images/channingTatum.jpg',
);

final User channingTatum = User(
  id: 1,
  name: 'Channing Tatum',
  imageURL: 'assets/images/channingTatum.jpg',
);

final User robertPattinson = User(
  id: 2,
  name: 'Robert',
  imageURL: 'assets/images/channingTatum.jpg',
);

final User giannis = User(
  id: 3,
  name: 'Giannis',
  imageURL: 'assets/images/channingTatum.jpg',
);


final User lebron = User(
  id: 4,
  name: 'Lebron',
  imageURL: 'assets/images/channingTatum.jpg',
);

final User kevin = User(
  id: 5,
  name: 'Kevin',
  imageURL: 'assets/images/channingTatum.jpg',
);

final User shaq = User(
  id: 6,
  name: 'Shaq',
  imageURL: 'assets/images/channingTatum.jpg',
);


List<User> best = [giannis, robertPattinson, lebron, kevin, shaq];

List<Chirp> chats = [
  Chirp(
    sender: giannis,
    time: '5:24 PM',
    message: 'Court at 9?',
    isLoved: false,
    seen: false,
  ),
  Chirp(
    sender: robertPattinson,
    time: '5:28 PM',
    message: 'Hey',
    isLoved: true,
    seen: true,
  ),
];

List<Chirp> chirps = [
  Chirp(
    sender: giannis,
    time: '5:24 PM',
    message: 'Court at 9?',
    isLoved: false,
    seen: false,
  ),
  Chirp(
    sender: robertPattinson,
    time: '5:28 PM',
    message: 'Hey',
    isLoved: true,
    seen: true,
  ),
  Chirp(
    sender: giannis,
    time: '5:24 PM',
    message: 'Court at 9?',
    isLoved: false,
    seen: true,
  ),
  Chirp(
    sender: robertPattinson,
    time: '5:28 PM',
    message: 'Hey',
    isLoved: true,
    seen: true,
  ),
];