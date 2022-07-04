import 'package:flutter/material.dart';
import 'package:make_own_workout/common/constants.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Cat-cow'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'tag',
                  child: Container(
                    height: 280,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://res.cloudinary.com/capstone-project-2022/image/upload/v1656836714/ugmzwaregbsgqpijda3v.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.red.shade700,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cat-cow',
                        style: kTextTheme.titleMedium!.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Description',
                    style: kTextTheme.titleMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Peregangan yang dinamis, seperti Cat-cow, menggerakkan kelompok otot dengan hari-hati melalui beberapa gerakan berikut.  Satukan jari-jari Anda, letakkan di atas lantai dengan telapak tangan menghadap ke depan. Rentangkan lengan ke depan sejauh yang Anda bisa. Turunkan kepala Anda sambil melengkungkan punggung ke atas. Ini adalah gerakan cat. Tahan hingga sekitar 10 detik. Perlahan-lahan lakukan gerakan yang berlawanan dengan mengangkat kepala Anda sambil melengkungkan punggung Anda ke bawah. Ini disebut gerakan cow. Tahan hingga sekitar 10 detik. Ulangi kembali gerakan yang sama cat-cow dengan repetisi 8 – 10 kali.',
                    style: kTextTheme.titleMedium!.copyWith(
                      fontSize: 13.5,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Previous',
                style: kTextTheme.titleMedium!.copyWith(
                  fontSize: 15,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Next',
                style: kTextTheme.titleMedium!.copyWith(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
