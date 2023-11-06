import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController introduceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green.shade100,
            elevation: 0,
            leading: Image.asset(
              'assets/triceratops_icon.png',
              width: 32,
              height: 32,
            ),
            title: const Text(
              '안녕 나는 트리케라톱스야',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold),
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.all(16),
                  width: 370,
                  height: 400,
                  child: Image.asset(
                    'assets/triceratops_main.png',
                    // fit: BoxFit.cover,
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        '학명',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text('Triceratops'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        '생존시기',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text('백악기 후기'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        '발견되는 지역',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text('북아메리카'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        '발견되는 지층',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text('헬 크릭 지층'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        '몸길이',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text('8~9m'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        '몸무게',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text('5~9t'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  '자기소개',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: introduceController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.brown))),
                ),
              )
            ],
          ),
        ));
  }
}
