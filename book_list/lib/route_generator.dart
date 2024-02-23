
import 'package:book_list/bookDetail.dart';
import 'package:book_list/bookList.dart';
import 'package:book_list/modal/book.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  // ignore: body_might_complete_normally_nullable
  static Route<dynamic> ? routeGenerator(RouteSettings settings){
    switch(settings.name){
      case('/'):
      return MaterialPageRoute(
        builder: (context)=>BookList());
      case('/bookDetail'):
      final selectedBook= settings.arguments as Book;
      return MaterialPageRoute(
        builder: (context)=>BookDetail(selectedBook: selectedBook,));

    }
  }
}