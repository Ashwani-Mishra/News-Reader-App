import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/newsPage.dart';
void main(){
  runApp(myapp());
}
class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News Reader",
      home: HomePage(),
      
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Category> images = [
    Category("Health","assets/image/health.jpg"),
    Category("Business","assets/image/business.jpg"),
    Category("Technology","assets/image/it.jpg"),
    Category("Sports","assets/image/sports.jpg"),
    


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(  
        physics: ScrollPhysics(),
        child: Column( children: [

              Container( 
                margin: EdgeInsets.only(top:60.0),
                alignment: Alignment.center,
                child: RichText(  
                   
                   text: TextSpan(children: <TextSpan>[
                     TextSpan(text: "News",style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0,
                  color: Color(0xFFB22222),
                  
                ),),
                 TextSpan(text: "Reader",style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  fontSize: 25.0,
                  color: Color(0xFF00c853),
                  
                ),),
                   ]),
                ),
              ),
              GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,

              children: images.map((eachcategory)
              {
             return InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsPage(eachcategory.name)));
                },
             child: Container( 
                  height: 70,
                  padding: EdgeInsets.all(20),

                  decoration:  BoxDecoration(
                     borderRadius: BorderRadius.circular(10.0),

                        image: DecorationImage(   

                            image: AssetImage(eachcategory.image),
                            fit: BoxFit.cover,
                        ),
                  ),
             ) 

                );

              }).toList(),

              

              
              
              ),
              SizedBox(height: 20.0,),
          Container(  
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Image( 
                  
                  image: AssetImage('assets/image/entertainment.jpg',),
                  fit:BoxFit.cover,

                ),
          ),
         
         
        ],
        ),
      ),
      
    );
  }
}
class Category{
  final String name;
  final String image;
  Category(this.name,this.image);
}