import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:palette_generator/palette_generator.dart';
import 'modal/book.dart';

class BookDetail extends StatefulWidget {
final Book selectedBook;
const  BookDetail({required this.selectedBook, super.key});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  Color appBarColor=Colors.deepPurple;
 late PaletteGenerator generator;

  @override
  void initState() {
    
    super.initState();
    WidgetsBinding.instance. 
    addPostFrameCallback((_)=>findAppBarColor());
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            title: Text(widget.selectedBook.bookName + ' ' + 
            widget.selectedBook.bookAuthor),
            backgroundColor: appBarColor,
            flexibleSpace: FlexibleSpaceBar(
              background:Image.asset('assets/images/' + widget.selectedBook.bigImage ,
              fit: BoxFit.cover, ), ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Text(widget.selectedBook.bookDetail,
              style: Theme.of(context).textTheme.subtitle1,),
            ),
          )
        ],
      ),
      
    
    );
  
    
   
  }
  
  void findAppBarColor() async{
     generator= await PaletteGenerator.fromImageProvider(
      AssetImage('assets/images/' + widget.selectedBook.bigImage)
    );
    appBarColor=generator.dominantColor!.color;
    setState(() {
      
    });
  }
}
