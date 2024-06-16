import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Главная',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'Inter-Medium',
          ),
        ),
        backgroundColor: Color.fromRGBO(27, 24, 24, 1.0),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: _buildBackgroundGradient(),
        child: Center(
          child: _buildContent(context),
        ),
      ),
    );
  }

  BoxDecoration _buildBackgroundGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(106, 17, 203, 1.0),
          Colors.black,
        ],
      ),
    );
  }


  Widget _buildContent(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.35 ,
        decoration: BoxDecoration(
          color: Color.fromRGBO(27, 24, 24, 1.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildMusicSection(context, 'Музыка дня'),
              _buildMusicSection(context, 'Новое от ваших авторов'),
              _buildMusicSection(context, 'Плейлисты других пользователей'),

            ],
          ),
        ),
        )
      );

  }



  Widget _buildMusicSection(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(height: 10),
          _buildHorizontalScroll(context),
        ],
      ),
    );
  }

  Widget _buildHorizontalScroll(BuildContext context) {
    return Container(
      height: 200, // Высота контейнера с горизонтальной прокруткой
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildMusicItem('assets/music1.jpg', 'Песня 1', 'Автор 1'),
          _buildMusicItem('assets/music2.jpg', 'Песня 2', 'Автор 2'),
          _buildMusicItem('assets/music3.jpg', 'Песня 3', 'Автор 3'),
          _buildMusicItem('assets/music4.jpg', 'Песня 4', 'Автор 4'),
          // Добавьте другие элементы песен по мере необходимости
        ],
      ),
    );
  }

  Widget _buildMusicItem(String imagePath, String songTitle, String artist) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Центрируем элементы по горизонтали
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text(
            songTitle,
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center, // Центрируем текст
          ),
          Text(
            artist,
            style: TextStyle(color: Colors.white70, fontSize: 14),
            textAlign: TextAlign.center, // Центрируем текст
          ),
        ],
      ),
    );
  }
}








