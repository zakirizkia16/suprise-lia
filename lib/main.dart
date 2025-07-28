import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(BirthdayApp());
}

class BirthdayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Happy Birthday',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  final AudioPlayer player = AudioPlayer();

  void playMusic() async {
    await player.play(AssetSource('audio/The_Beauty_Of_Love.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    playMusic();
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/Happy_Birthday.json', width: 200),
            SizedBox(height: 20),
            Text(
              'Happy Birthday, Sayang! 🎉',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.pink[800],
                fontFamily: 'sans-serif',
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('Lihat Hadiah 💝',
              style: TextStyle(
                fontFamily: 'sans-serif'
              ),),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GiftScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GiftScreen extends StatefulWidget {
  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  final List<String> memories = [
    'Waktu pertama kita jalan bareng 💑',
    'Pas kamu pertama kali senyum ke aku 😍',
    'Ngobrol sampai larut malam ☕',
    'Dukung aku pas lagi down 🫂',
  ];

  final List<String> imagePaths = [
    'assets/images/1.jpg',
    'assets/images/2.jpeg',
    'assets/images/3.jpeg',
    'assets/images/4.jpeg'
  ];

  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text('Hadiah Untukmu'),
        backgroundColor: Colors.pink,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(
            'Surat Cinta ❤️',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.pink[700],
              fontFamily: 'sans-serif'
            ),
          ),
          SizedBox(height: 10),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'Sayang,\n\n'
                'Sejak pertama kali aku kenal kamu, semuanya berubah. Aku nggak pernah nyangka bisa seberarti ini sama seseorang. '
                'Kita udah sering banget ribut, dari hal kecil sampai hal yang bikin hati capek. Tapi setiap kali aku mau nyerah, '
                'aku inget senyum kamu, suara kamu, cara kamu peduli — dan semua itu bikin aku sadar kalau aku nggak mau kehilangan kamu.\n\n'
                'Mungkin aku bukan yang terbaik, dan kadang salah ngomong atau nyakitin tanpa sadar. Tapi dari semua yang pernah aku lewatin, '
                'cuma kamu yang selalu ada. Kamu bikin hari-hariku lebih hidup, lebih bermakna.\n\n'
                'Di hari ulang tahunmu ini, aku cuma pengen kamu tahu satu hal: aku sayang banget sama kamu. '
                'Bukan cuma karena kamu manis, lucu, atau perhatian, tapi karena kamu adalah rumah buat hati aku. '
                'Selamat ulang tahun, semoga semua impianmu pelan-pelan jadi kenyataan, dan aku pengen terus ada di samping kamu buat lihat semuanya terjadi.\n\n'
                'Aku cinta kamu, sekarang dan seterusnya. ❤️',
                textStyle: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'sans-serif'),
                speed: Duration(milliseconds: 40),
              ),
            ],
            isRepeatingAnimation: false,
            totalRepeatCount: 1,
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
          SizedBox(height: 30),
          Text(
            'Kenangan Kita 🥰',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.pink[700],
              fontFamily: 'sans-serif'
            ),
          ),
          ...memories.map(
            (m) => ListTile(
              leading: Icon(Icons.favorite, color: Colors.pink),
              title: Text(m),
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Galeri Foto 📸',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.pink[700],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(imagePaths[index], fit: BoxFit.cover, width: double.infinity,),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imagePaths.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: _currentIndex == index ? 12 : 8,
                  height: _currentIndex == index ? 12 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.pink
                        : Colors.pink[200],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                Text(
                  'Animasi Lucu 🐱',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[700],
                    fontFamily: 'sans-serif',
                  ),
                ),
                SizedBox(height: 10),
                Lottie.asset('assets/lottie/cat_animation.json', width: 150),
              ],
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Untuk Kamu 💖',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.pink[700],
              fontFamily: 'sans-serif',
            ),
          ),
          SizedBox(height: 10),
          Text(
            '''Aku tahu kita nggak sempurna. Kita sering beda pendapat, sering saling diam, bahkan kadang saling nyakitin tanpa sadar. Tapi semua itu justru bikin aku makin yakin kalau aku butuh kamu.

              Aku masih inget tiap tawa kamu, tiap kali kamu marah tapi akhirnya ngambek lucu. Dan jujur, semua hal tentang kamu bikin aku pengen terus bertahan.

              Aku nulis semua ini karena aku pengen kamu tahu — kamu adalah bagian penting dalam hidup aku. Terima kasih karena udah bertahan sama aku sampai hari ini. Aku harap aku bisa terus jadi alasan kamu senyum, hari ini dan seterusnya.''',
            style: TextStyle(fontSize: 18, fontFamily: 'sans-serif'),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Pesan Rahasia 🫶', style: TextStyle(fontFamily: 'sans-serif'),),
                    content: Text(
                      'Kalau kamu baca ini, berarti kamu udah tahan sejauh ini sama aku. Dan aku cuma mau bilang… kamu hebat. Kamu luar biasa. Dan aku… cinta banget sama kamu.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('❤️', style: TextStyle(fontSize: 20, fontFamily: 'sans-serif')),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              child: Text('Buka Pesan Rahasia 💌'),
            ),
          ),
        ],
      ),
    );
  }
}
