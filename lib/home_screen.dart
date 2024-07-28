import 'package:flutter/material.dart';
import 'package:instagram_user_following_screen/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List<User> _users = [
    User('Dipon Deb', '@dipondeb', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRHdcFb-AmCIji1yYxkjRnuCTqXvwWo3hbhw&s', false),
    User('Fokrul Islam', '@fokrulislam', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8LrGjiUDcvYjUMk7jUJJZo0kK4Y4NzKxmQ&s', false),
    User('Tayeba Akter', '@tayebaakter', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkNSBqVZJDr7Ukvr__JdnNQMiNsPHSqv-2RA&s', false),
    User('Safiya Akter', '@safiyaakter', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoImpG6ePmcPlFPMSikVNlsop4yB-CKoW1SQ&s', false),
    User('Oisy Rani Debi', '@oisyranidebi', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZys06GBNT_0i1IOJxkwTHzhKRFmS-EGAiMw&s', false),
    User('Mitu Das', '@mitudas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSO9MB8gQxsht-iokJEmwCpCvOf3CkKjVXW3A&s', false),
  ];
  
  @override
  Widget build(BuildContext context) {

    userComponents({required User user}){
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  height: 60,
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(user.image),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      user.username,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: const Color(0xffeeeeee))
              ),
              child: MaterialButton(
                elevation: 0,
                color: user.isFollowedByMe? const Color(0xffeeeeee) : const Color(0xffffffff),
                onPressed: () {
                  setState(() {
                    user.isFollowedByMe =! user.isFollowedByMe;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  user.isFollowedByMe? 'Unfollow' : 'Follow' ,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
            'Following',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: ListView.builder(
          itemCount: _users.length,
            itemBuilder: (context, index){
              return userComponents(user: _users[index]);
            }
        ),
      ),
    );
  }
}
