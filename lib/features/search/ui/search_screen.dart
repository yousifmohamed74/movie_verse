import 'package:flutter/material.dart';
import 'package:movie_verse/core/styles/colors.dart';
import 'package:movie_verse/features/home%20screen/ui/widgets/movie_shape2_wid.dart';
import 'package:movie_verse/features/search/logic/search_screen_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchScreenProvider(),      
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
        
          appBar: AppBar(
            title: Text("Search",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),
            centerTitle: true,
            iconTheme: IconThemeData(
              size: 30
            ),
          ),
        
          body: Consumer<SearchScreenProvider>(
            builder: (context,child,val) {
              var provider=context.read<SearchScreenProvider>();
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 20,
                      children: [
                        
                        //1
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 75,                      
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: SemiDarkThemeColors.searchBarBackground
                          ),
                          child: Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.search,size: 30,),
                              Expanded(
                                child: TextFormField(
                                  controller: provider.searchcontroller,
                                  cursorColor: Colors.white,
                                  cursorHeight: 30,
                                  decoration: InputDecoration(
                                    
                                  ),                                  
                                  onChanged: (value) {                                    
                                    provider.getSearchedMovies();
                                    print(provider.searchedmovies.length);
                                    print(provider.searchcontroller.text);
                                    print(value);
                                  },
                                  
                                ),
                              ),                    
                            ],
                          ),                    
                        ),

                        //2
                        provider.searchedmovies.isEmpty?
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SizedBox(
                            height: 550,                            
                            child: Center(child: Text("Search Result Appear Here !",
                              maxLines: 2,
                              textAlign:TextAlign.center ,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),)),
                          ),
                        ):
                        ListView.separated(                             
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,                      
                          separatorBuilder: (context, index) => SizedBox(height: 12,), 
                          itemCount: provider.searchedmovies.length,
                          itemBuilder: (context, index) =>MovieShape2Wid(movie: provider.searchedmovies[index],), 
                        ),
                    
                      ],
                    ),
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}