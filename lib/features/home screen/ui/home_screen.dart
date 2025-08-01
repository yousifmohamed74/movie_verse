import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:movie_verse/features/home%20screen/logic/homescreen_provider.dart';
import 'package:movie_verse/features/home%20screen/ui/widgets/movie_shape1_wid.dart';
import 'package:movie_verse/features/home%20screen/ui/widgets/movie_shape2_wid.dart';
import 'package:movie_verse/features/search/ui/search_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomescreenProvider>(
      builder: (context,val,child) {
        return Scaffold(        
          appBar: AppBar(
            title: Row(
              spacing: 7,
              children: [
                Image.asset(
                  "assets/images/sp4.png",
                  width: 30,
                  height: 30,
                ),
                Text("MovieVerse",style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold
                ),), 
              ],
            ),          
            actions: [
              Consumer<HomescreenProvider>(
                builder: (context, val, child) {
                  var provider=context.read<HomescreenProvider>();
                  return IconButton(
                    onPressed: () {
                      provider.changeDarkMode();
                      log('ISDARK: ${provider.iSDARK}');
                    },
                    icon: provider.iSDARK
                        ? const Icon(Icons.dark_mode, size: 30)
                        : const Icon(Icons.light_mode, size: 30),
                  );
                },
              ),
        
              IconButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context) => SearchScreen(),                   
                    )
                  );               
                }, 
                icon: Icon(Icons.search,size: 33,)
              ),            
            ],
          ), 
        
          body: Consumer<HomescreenProvider>(
            builder: (context,child,val) {
              var provider=context.read<HomescreenProvider>();            
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,top: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 11,
                      children: [
                        //1
                        Column(
                          spacing: 15,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text("Trending Movies",style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600
                                  ),),
                                ),
                                Icon(Icons.arrow_forward_ios,size: 20,),                          
                              ],
                            ),
                            SizedBox(
                              height: 180,
                              child: ListView.separated(                          
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,                      
                                separatorBuilder: (context, index) => SizedBox(width: 12,), 
                                itemCount: provider.trendingmovies.length,
                                itemBuilder: (context, index) =>MovieShape1Wid(movie: provider.trendingmovies[index],), 
                              ),
                            ),
                          ],
                        ),
                        
                        //2
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 15,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 4,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text("Now Playing",style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600
                                      ),),
                                    ),
                                    Icon(Icons.arrow_forward_ios,size: 20,),                          
                                  ],
                                ),
                                Text(                          
                                  "From  (${provider.nowplayingmoviesdates["minimum"]}) To  (${provider.nowplayingmoviesdates["maximum"]})",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300
                                ),),
                              ],
                            ),                        
                            SizedBox(
                              height: 180,
                              child: ListView.separated(                          
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,                      
                                separatorBuilder: (context, index) => SizedBox(width: 12,), 
                                itemCount: provider.nowplayingmovies.length,
                                itemBuilder: (context, index) =>MovieShape1Wid(movie: provider.nowplayingmovies[index],), 
                              ),
                            ),
                          ],
                        ),
                        //3
                        Column(
                          spacing: 15,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text("Top Rated",style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600
                                  ),),
                                ),
                                Icon(Icons.arrow_forward_ios,size: 20,),                          
                              ],
                            ),
                            SizedBox(
                              height: 180,
                              child: ListView.separated(                          
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,                      
                                separatorBuilder: (context, index) => SizedBox(width: 12,), 
                                itemCount: provider.topratedmovies.length,
                                itemBuilder: (context, index) =>MovieShape1Wid(movie: provider.topratedmovies[index],), 
                              ),
                            ),
                          ],
                        ),
                        
                        //4
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 15,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 4,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text("Upcoming",style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600
                                      ),),
                                    ),
                                    Icon(Icons.arrow_forward_ios,size: 20,),                          
                                  ],
                                ),
                                Text(                          
                                  "From  (${provider.upcomingmoviesdates["minimum"]}) To  (${provider.upcomingmoviesdates["maximum"]})",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300
                                ),),
                              ],
                            ),                        
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ListView.separated(                             
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,                      
                                separatorBuilder: (context, index) => SizedBox(height: 12,), 
                                itemCount: provider.upcomingmovies.length,
                                itemBuilder: (context, index) =>MovieShape2Wid(movie: provider.upcomingmovies[index],), 
                              ),
                            ),
                          ],
                        ),
        
        
                      ],
                    ),
                  ),
                ),
              );
            }
          ),
        );
      }
    );
  }
}