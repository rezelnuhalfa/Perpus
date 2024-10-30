import 'package:flutter/material.dart';
import 'package:flutter_application_1/book_controller.dart';
import 'package:flutter_application_1/book_model.dart';
import 'package:flutter_application_1/modal_widget.dart';

class BookView extends StatefulWidget {
  const BookView({super.key});

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  final formKey = GlobalKey<FormState>();
  final BookController bookController = BookController();
  TextEditingController judulController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController fotoBukuController = TextEditingController();
  TextEditingController penerbitController = TextEditingController();
  TextEditingController pengarangController = TextEditingController();

  List<BookModel> books = [];
  int? selectedBookId;

  @override
  void initState() {
    super.initState();
    books = bookController.books;
  }

  void showAddEditModal(int? bookIndex) {
    if (bookIndex != null) {
      selectedBookId = books[bookIndex].id;
      judulController.text = books[bookIndex].judul;
      deskripsiController.text = books[bookIndex].deskripsi;
      stokController.text = books[bookIndex].stok.toString();
      fotoBukuController.text = books[bookIndex].fotoBuku;
      penerbitController.text = books[bookIndex].penerbit;
      pengarangController.text = books[bookIndex].pengarang;
    } else {
      clearForm();
    }

    ModalWidget().showFullModal(context, buildForm(bookIndex));
  }

  void clearForm() {
    selectedBookId = null;
    judulController.clear();
    deskripsiController.clear();
    stokController.clear();
    fotoBukuController.clear();
    penerbitController.clear();
    pengarangController.clear();
  }

  Widget buildForm(int? bookIndex) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: judulController,
              decoration: const InputDecoration(labelText: "Judul"),
              validator: (value) => value!.isEmpty ? 'Harus diisi' : null,
            ),
            TextFormField(
              controller: deskripsiController,
              decoration: const InputDecoration(labelText: "Deskripsi"),
            ),
            TextFormField(
              controller: stokController,
              decoration: const InputDecoration(labelText: "Stok"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: fotoBukuController,
              decoration: const InputDecoration(labelText: "Foto Buku"),
            ),
            TextFormField(
              controller: penerbitController,
              decoration: const InputDecoration(labelText: "Penerbit"),
            ),
            TextFormField(
              controller: pengarangController,
              decoration: const InputDecoration(labelText: "Pengarang"),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (bookIndex != null) {
                    setState(() {
                      books[bookIndex] = BookModel(
                        id: selectedBookId!,
                        judul: judulController.text,
                        deskripsi: deskripsiController.text,
                        stok: int.parse(stokController.text),
                        fotoBuku: fotoBukuController.text,
                        penerbit: penerbitController.text,
                        pengarang: pengarangController.text,
                      );
                    });
                  } else {
                    setState(() {
                      books.add(
                        BookModel(
                          id: books.length + 1,
                          judul: judulController.text,
                          deskripsi: deskripsiController.text,
                          stok: int.parse(stokController.text),
                          fotoBuku: fotoBukuController.text,
                          penerbit: penerbitController.text,
                          pengarang: pengarangController.text,
                        ),
                      );
                    });
                  }
                  Navigator.pop(context);
                }
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Buku"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => showAddEditModal(null),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset(books[index].fotoBuku),
              title: Text(books[index].judul),
              subtitle: Text(books[index].penerbit),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == "Edit") {
                    showAddEditModal(index);
                  } else if (value == "Delete") {
                    setState(() {
                      books.removeAt(index);
                    });
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(value: "Edit", child: Text("Edit")),
                  const PopupMenuItem(value: "Delete", child: Text("Hapus")),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
