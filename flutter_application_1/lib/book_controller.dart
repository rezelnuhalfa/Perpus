import 'package:flutter_application_1/book_model.dart';

class BookController {
  final List<BookModel> books = [
    BookModel(
      id: 1,
      judul: "Buku A",
      deskripsi: "Deskripsi buku A",
      stok: 10,
      fotoBuku: "assets/img1.jpg",
      penerbit: "Penerbit A",
      pengarang: "Pengarang A",
    ),
    BookModel(
      id: 2,
      judul: "Buku B",
      deskripsi: "Deskripsi buku B",
      stok: 5,
      fotoBuku: "assets/img2.jpg",
      penerbit: "Penerbit B",
      pengarang: "Pengarang B",
    ),
  ];
}
