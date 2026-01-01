import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilmKiralamaSayfasi extends StatefulWidget {
  String film_adi;
  String film_resim;
  int film_fiyat;


  FilmKiralamaSayfasi({required this.film_adi,required this.film_resim,required this.film_fiyat});

  @override
  State<FilmKiralamaSayfasi> createState() => _FilmKiralamaSayfasiState();
}

class _FilmKiralamaSayfasiState extends State<FilmKiralamaSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.film_adi),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.film_resim}"),
            Text("${widget.film_fiyat} ₺",style:GoogleFonts.montserrat(fontSize: 30)),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  elevation: 15,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius:BorderRadiusGeometry.circular(15)
                  ),
                ), //stylefrom
                child: Text("Kirala",style: GoogleFonts.montserrat(fontSize: 25,fontWeight: FontWeight.bold),),
                onPressed: (){
                  print("${widget.film_adi} filmi Kiralandı");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
