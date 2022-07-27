import 'dart:math';
import 'package:clubhouse_ui/data/models/user.dart';
import 'package:clubhouse_ui/data/models/room.dart';




Random random = Random();

List names_profileImages=[
  {'name': 'Alberto Fernández',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Mensaje_de_fin_de_a%C3%B1o_del_Presidente_Alberto_Fern%C3%A1ndez_%28cropped%29.jpg/220px-Mensaje_de_fin_de_a%C3%B1o_del_Presidente_Alberto_Fern%C3%A1ndez_%28cropped%29.jpg',
  },
  {'name': 'Anthony Albanese',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Anthony_Albanese_portrait_%28cropped%29.jpg/220px-Anthony_Albanese_portrait_%28cropped%29.jpg'
  },
  {'name': 'Jair Bolsonaro',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Jair_Bolsonaro_2021_%28cropped%29.jpg/220px-Jair_Bolsonaro_2021_%28cropped%29.jpg'
  },
  {'name': 'Justin Trudeau',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Justin_Trudeau_March_2022.jpg/220px-Justin_Trudeau_March_2022.jpg'
  },
  {'name': 'Xi Jinping',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Xi_Jinping_portrait_2019_%28cropped%29.jpg/220px-Xi_Jinping_portrait_2019_%28cropped%29.jpg'
  },
  {'name': 'Emmanuel Macron',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/%D0%97%D1%83%D1%81%D1%82%D1%80%D1%96%D1%87_%D0%9F%D1%80%D0%B5%D0%B7%D0%B8%D0%B4%D0%B5%D0%BD%D1%82%D0%B0_%D0%A3%D0%BA%D1%80%D0%B0%D1%97%D0%BD%D0%B8_%D0%B7_%D0%BF%D1%80%D0%B5%D0%B7%D0%B8%D0%B4%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%D0%B8_%D0%A4%D1%80%D0%B0%D0%BD%D1%86%D1%96%D1%97_%D1%82%D0%B0_%D0%A0%D1%83%D0%BC%D1%83%D0%BD%D1%96%D1%97%2C_%D0%B0_%D1%82%D0%B0%D0%BA%D0%BE%D0%B6_%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D0%B0%D0%BC%D0%B8_%D1%83%D1%80%D1%8F%D0%B4%D1%96%D0%B2_%D0%9D%D1%96%D0%BC%D0%B5%D1%87%D1%87%D0%B8%D0%BD%D0%B8_%D1%82%D0%B0_%D0%86%D1%82%D0%B0%D0%BB%D1%96%D1%97_76_%28cropped%29.jpg/220px-thumbnail.jpg'
  },
  {'name': 'Olaf Scholz',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Olaf_Scholz_In_March_2022.jpg/220px-Olaf_Scholz_In_March_2022.jpg'
  },
  {'name': 'Narendra Modi',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Official_Photograph_of_Prime_Minister_Narendra_Modi_Potrait.png/220px-Official_Photograph_of_Prime_Minister_Narendra_Modi_Potrait.png'
  },
  {'name': 'Joko Widodo',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Joko_Widodo_2019_official_portrait.jpg/220px-Joko_Widodo_2019_official_portrait.jpg'
  },
  {'name': 'Mario Draghi',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Mario_Draghi_2021_cropped.jpg/220px-Mario_Draghi_2021_cropped.jpg'
  },
  {'name': 'Fumio Kishida',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Fumio_Kishida_20211005.jpg/220px-Fumio_Kishida_20211005.jpg'
  },
  {'name': 'Yoon Suk-yeol',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Yoon_Suk-yeol_2022.jpg/220px-Yoon_Suk-yeol_2022.jpg'
  },
  {'name': 'Andrés Manuel López Obrador',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Reuni%C3%B3n_con_el_presidente_electo_y_equipos_de_trabajo_6_%28cropped%29.jpg/220px-Reuni%C3%B3n_con_el_presidente_electo_y_equipos_de_trabajo_6_%28cropped%29.jpg'
  },
  {'name': 'Vladimir Putin',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Vladimir_Putin_17-11-2021_%28cropped%29.jpg/220px-Vladimir_Putin_17-11-2021_%28cropped%29.jpg'
  },
  {'name': 'Salman bin Abdulaziz Al Saud',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Salman_of_Saudi_Arabia_-_2020_%2849563590728%29_%28cropped%29.jpg/220px-Salman_of_Saudi_Arabia_-_2020_%2849563590728%29_%28cropped%29.jpg'
  },
  {'name': 'Cyril Ramaphosa',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/2019_Sess%C3%A3o_Plen%C3%A1ria_da_XI_C%C3%BApula_de_L%C3%ADderes_do_BRICS_-_49065119826_%28cropped%29.jpg/220px-2019_Sess%C3%A3o_Plen%C3%A1ria_da_XI_C%C3%BApula_de_L%C3%ADderes_do_BRICS_-_49065119826_%28cropped%29.jpg'
  },
  {'name': 'Recep Tayyip Erdoğan',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Meeting_between_the_President_of_the_Republic_of_Turkey_and_President_of_Ukraine_in_2022_%287%29_%28cropped%29.jpg/220px-Meeting_between_the_President_of_the_Republic_of_Turkey_and_President_of_Ukraine_in_2022_%287%29_%28cropped%29.jpg'
  },
  {'name': 'Boris Johnson',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Boris_Johnson_official_portrait_%28cropped%29.jpg/220px-Boris_Johnson_official_portrait_%28cropped%29.jpg'
  },
  {'name': 'Joe Biden',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Joe_Biden_presidential_portrait.jpg/220px-Joe_Biden_presidential_portrait.jpg'
  },
  {'name': 'Charles Michel',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Charles_Michel_%2849467991288%29.jpg/220px-Charles_Michel_%2849467991288%29.jpg'
  },
  {'name': 'Ursula von der Leyen',
  'profileImage': 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Official_Portrait_of_Ursula_von_der_Leyen.jpg/220px-Official_Portrait_of_Ursula_von_der_Leyen.jpg'
  }
]; 

//userData
List userData = List.generate(20, (index) =>{
    'name': names_profileImages[index]['name'],
    'username': '@${names_profileImages[index]['name'].toString().split(' ')[0].toLowerCase()}',
    'profileImage': names_profileImages[index]['profileImage'],
    'followers': random.nextInt(1000),
    'following': random.nextInt(20),
    'lastAccessTime': '${index + 10}m',
    'isNewUser': random.nextBool(),
} );

//myprofile 
dynamic myProfileUserData = {
    'name': 'Borat',
    'username': '@borat',
    'profileImage': 'https://www.bagimsizsinema.com/wp-content/uploads/2020/09/Borat.jpg',
    'followers': random.nextInt(1000),
    'following': random.nextInt(20),
    'lastAccessTime': '${random.nextInt(10) + 10}m',
    'isNewUser': random.nextBool(),


};

List headlines = [
  'Agriculture and Food Security',
  'Digitalisation and Innovation',
  'Anti-corruption',
  'Sustainability - Climate Sustainability and Energy',
  'Employment, Gender, Education and Social Policies',
  'Financial Markets and International Financial Architecture',
  'Global Health',
  'Infrastructure Investment',
  'Strong, Sustainable, Balanced and Inclusive Growth',
  'Trade and Investment'
];

extension RandomListItem<T> on List<T> {
  T randomItem() {
    return this[Random().nextInt(length)];
  }
}



List roomData = List.generate(
  10,
  (index) => {
    'title': headlines[index],
    "users": List.generate(20, (index) => User.fromJson(userData[index]))
      ..shuffle(),
    'speakerCount': 4,
  },
);

List<Room> rooms = List.generate(
  10,
  (index) => Room.fromJson(roomData[index]),
);

List lobbyBottomSheets = [
  {
    'image': 'assets/images/open.png',
    'text': 'Open',
    'selectedMessage': 'Start a room open to everyone',
  },
  {
    'image': 'assets/images/social.png',
    'text': 'Social',
    'selectedMessage': 'Start a room with people I follow',
  },
  {
    'image': 'assets/images/closed.png',
    'text': 'Closed',
    'selectedMessage': 'Start a room for people I choose',
  },
];


List<User> users = List.generate(20, (index) => User.fromJson(userData[index]));

User myProfile = User.fromJson(myProfileUserData);



