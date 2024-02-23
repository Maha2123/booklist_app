import 'package:book_list/bookItem.dart';
import 'package:book_list/data/listData.dart';
import 'package:book_list/modal/book.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BookList extends StatelessWidget {
  
  late List<Book> allBooks;
   BookList(){
    allBooks=prepareData();
    print(prepareData());
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Book List'),),
      body: Center(
      child:ListView.builder(
        itemCount: allBooks.length,
        itemBuilder:(context,index){
          return BookItem(listedBook: allBooks[index],);
        } ),
    ),
    );
    
    
  }
  
  List<Book> prepareData() {
    List<Book> tentativeList=[];
    for(int i=0;i<12;i++){
      var bookName=Strings.Books_Name[i];
      var bookAuthor=Strings.Books_Authors[i];
      var bookDetail=Strings.Books_Detail[i];
      var smallImage=Strings.Small_Images[i];
      var bigImage=Strings.Big_Images[i];
      
     


      Book addBook=Book(bookName,bookAuthor,bookDetail,smallImage,bigImage);
      tentativeList.add(addBook);
    }
    return tentativeList;
  }
}