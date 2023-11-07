import 'package:flutter/material.dart';
import "package:shared_preferences/shared_preferences.dart";

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController introduceController = TextEditingController();

  bool isEditMode = false;
  @override
  void initState() {
    super.initState();
    getIntroduceData();
  }

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
                  margin: const EdgeInsets.all(16),
                  width: 370,
                  height: 400,
                  child: Image.asset(
                    'assets/triceratops_main.png',
                    // fit: BoxFit.cover,
                  )),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: const Text(
                        '학명',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text('Triceratops'),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: const Text(
                        '생존시기',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text('백악기 후기'),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: const Text(
                        '발견되는 지역',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text('북아메리카'),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: const Text(
                        '발견되는 지층',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text('헬 크릭 지층'),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: const Text(
                        '몸길이',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text('8~9m'),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      child: const Text(
                        '몸무게',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text('5~9t'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16, top: 16),
                    child: const Text(
                      '자기소개',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (isEditMode == true) {
                        if (introduceController.text.isEmpty) {
                          var snackBar = SnackBar(
                            content: Text('자기소개 입력값이 비어있당..'),
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        }

                        var sharedPref = await SharedPreferences.getInstance();
                        sharedPref.setString(
                            'introduce', introduceController.text);
                      }
                      setState(() {
                        isEditMode = !isEditMode;
                      });
                    },
                    child: Container(
                        margin: const EdgeInsets.only(right: 16, top: 16),
                        child: Icon(Icons.mode_edit,
                            color: isEditMode
                                ? Colors.green.shade700
                                : Colors.black,
                            size: 24)),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: introduceController,
                  maxLines: 5,
                  enabled: isEditMode,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.brown))),
                ),
              )
            ],
          ),
        ));
  }

  Future<void> getIntroduceData() async {
    var sharedPref = await SharedPreferences.getInstance();
    String introduceMessage =
        sharedPref.getString('introduce')?.toString() ?? '';
    introduceController.text = introduceMessage;
  }
}
