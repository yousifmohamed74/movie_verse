import 'package:flutter/material.dart';
import 'package:movie_verse/features/home%20screen/logic/homescreen_provider.dart';
import 'package:movie_verse/features/home%20screen/ui/widgets/movie_shape1_wid.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomescreenProvider()..getTrendingMovies()
      ..getNowPlayingMovies()
      ..getTopRatedMovies()
      ..getUpcomingMovies(),
      child: Scaffold(

        appBar: AppBar(
          title: Row(
            spacing: 7,
            children: [
              Image.asset(
                "assets/images/sp4.png",
                width: 30,
                height: 30,
              ),
              Text("Movie Verse",style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold
              ),), 
            ],
          ),
          //centerTitle: true,
          actions: [
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.search,size: 30,))
          ],
        ), 

        body: Consumer<HomescreenProvider>(
          builder: (context,child,val) {
            var provider=context.read<HomescreenProvider>();
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 20,
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
                            height: 200,
                            child: ListView.separated(                          
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,                      
                              separatorBuilder: (context, index) => SizedBox(width: 15,), 
                              itemCount: provider.trendingmovies.length,
                              itemBuilder: (context, index) =>MovieShape1Wid(movie: provider.trendingmovies[index],), 
                            ),
                          ),
                        ],
                      ),

                      


                    ],
                  ),
                ),
              )
            );
          }
        ),
      ),
    );
  }
}