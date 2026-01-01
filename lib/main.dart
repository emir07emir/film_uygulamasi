import 'package:film_uygulamasi/Filmler.dart';
import 'package:film_uygulamasi/film_kirala_sayfasi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,secondary: Colors.deepOrange),
        //primaryColor: , uygulamanın genel temasında kullanılır mesela burada bir renk
        //tanımladığımızda bir buton oluşturduğumuzda varsayılan renk burda belirlediğimiz renk olur
        useMaterial3:true,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<List<Filmler>>verileriGetir() async{
    var filmlistesi=<Filmler>[];//Filmler sınıfından liste oluşturmak için
    var f1=Filmler(1, "Bir Zamanlar Anadoluda","anadoluda.png", 39);
    var f2=Filmler(2,"Django", "django.png", 30);
    var f3=Filmler(3,"İnception","inception.png", 45);
    var f4=Filmler(4, "Interstellar","interstellar.png", 55);
    var f5=Filmler(5,"The Hateful eight" ,"thehatefuleight.png", 15);
    var f6=Filmler(6, "The Pianist","thepianist.png", 25);
    filmlistesi.add(f1);
    filmlistesi.add(f2);
    filmlistesi.add(f3);
    filmlistesi.add(f4);
    filmlistesi.add(f5);
    filmlistesi.add(f6);
    return filmlistesi;

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Filmler"),
      ),
      body: FutureBuilder<List<Filmler>>
        (future: verileriGetir(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              var filmlistesi=snapshot.data;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2/3.5 //grid yapısının genişlik 2 yükseklik 3.5 olacak şekilde
                ),
                itemCount: filmlistesi?.length,
                itemBuilder: (context,index){//for döngüsü gibi çalışır liste uzunluğu kadar döner
                  var film=filmlistesi?[index];
                  return GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FilmKiralamaSayfasi(film_adi: film!.film_adi, film_resim:film.film_resim , film_fiyat: film.film_fiyat)));
                    },
                    child: Card(
                      child:Column(
                        children: [
                          SizedBox(
                            width: 250,
                              height: 300,
                              child: Image.asset("resimler/${film?.film_resim}")),
                          Text("${film?.film_adi}"),
                          Text("${film?.film_fiyat} ₺"),
                        ],
                      ) ,
                    ),
                  );
                },//itembuilder
              );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
