import 'package:test_app/models/user.dart';
import 'package:test_app/models/video.dart';

User currentUser = User('stackedList',
    'https://lh3.googleusercontent.com/a/AAcHTtf7fyEUA8CdL4pi-jK6z3okiDijfMDz9j_z4qU3rzZaGeg=s576-c-no');
User demoUser1 = User('user_1',
    'https://lh3.googleusercontent.com/a/AAcHTtf7fyEUA8CdL4pi-jK6z3okiDijfMDz9j_z4qU3rzZaGeg=s576-c-no');
User demoUser2 = User('user_2',
    'https://lh3.googleusercontent.com/a/AAcHTtf7fyEUA8CdL4pi-jK6z3okiDijfMDz9j_z4qU3rzZaGeg=s576-c-no');
User demoUser3 = User('user_3',
    'https://lh3.googleusercontent.com/a/AAcHTtf7fyEUA8CdL4pi-jK6z3okiDijfMDz9j_z4qU3rzZaGeg=s576-c-no');
User demoUser4 = User('user_4',
    'https://lh3.googleusercontent.com/a/AAcHTtf7fyEUA8CdL4pi-jK6z3okiDijfMDz9j_z4qU3rzZaGeg=s576-c-no');

final List<Video> videos = [
  Video('v1.mp4', demoUser1, 'caption', 'audioName', '12.5K', '123'),
  Video('v3.mp4', demoUser2, 'caption', 'audioName', '10.5K', '123'),
  Video('v1.mp4', demoUser3, 'caption', 'audioName', '9.5K', '123'),
  Video('v3.mp4', demoUser4, 'caption', 'audioName', '7.5K', '123'),
];
