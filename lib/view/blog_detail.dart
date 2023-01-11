import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mau_kerja/common/gap.dart';
import 'package:mau_kerja/common/texts.dart';
import 'package:mau_kerja/model/model_blog.dart';

class BlogDetail extends StatelessWidget {
  const BlogDetail({super.key, required this.blog});

  final ModelBlog blog;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Texts.text('Blog Detail', color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.text(blog.title,
                        fontWeight: FontWeight.bold, size: 20, maxLine: null),
                    Texts.text(blog.subTitle,
                        fontWeight: FontWeight.normal, size: 16),
                    Row(
                      children: [
                        Texts.text(blog.author, fontWeight: FontWeight.bold),
                        Gap.h(10),
                        Texts.text(DateFormat('dd-mm-yyyy').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                blog.createAt * 1000))),
                      ],
                    ),
                    Gap.v(15),
                    Image.network(
                      blog.photo,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Texts.text('Cannot load image'),
                        );
                      },
                    ),
                    Gap.v(10),
                    Texts.text(blog.content,
                        size: 14, maxLine: null, textAlign: TextAlign.justify),
                    Gap.v(20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
