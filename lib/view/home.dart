// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mau_kerja/bloc/blog/blog_bloc.dart';
import 'package:mau_kerja/bloc/candidate/candidate_bloc.dart';
import 'package:mau_kerja/common/gap.dart';
import 'package:mau_kerja/common/texts.dart';
import 'package:mau_kerja/view/blog_detail.dart';
import 'package:mau_kerja/view/detail_candidate.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CandidateBloc candidateBloc = CandidateBloc();
  BlogBloc blogBloc = BlogBloc();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => candidateBloc..getCandidate(''),
            ),
            BlocProvider(
              create: (context) => blogBloc..getBlog(''),
            )
          ],
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: searchController,
                    decoration: const InputDecoration(hintText: 'Search'),
                    onChanged: (v) {
                      candidateBloc.getCandidate(v);
                      blogBloc.getBlog(v);
                    },
                  ),
                  Texts.text('Candidates'),
                  candidate(),
                  Gap.v(15),
                  Texts.text('Blogs'),
                  blog(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget candidate() {
    return BlocBuilder<CandidateBloc, CandidateState>(
      builder: (context, state) {
        if (state is LoadingCandidateState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is FailureCandidateState) {
          return Text(state.error);
        }

        if (state is SuccessCandidateState) {
          if (state.data.isEmpty) {
            return Center(
              child: Texts.text('Data not found'),
            );
          }
          return Column(
            children: state.data
                .map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DetailCandidate(
                                        candidate: e,
                                      )));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 125,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        e.photo,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Texts.text(e.name,
                                        size: 28, fontWeight: FontWeight.bold),
                                    Texts.text(
                                      e.gender == 'm'
                                          ? 'Gender Male'
                                          : 'Gender Female',
                                    ),
                                    Texts.text('Birthday ' +
                                        DateFormat('dd-mm-yyyy').format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                e.birthday))),
                                    Texts.text('Expired ' +
                                        DateFormat('dd-mm-yyyy').format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                e.expired)))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget blog() {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (context, state) {
        if (state is LoadingBlogState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is FailureBlogState) {
          return Center(
            child: Texts.text(state.error),
          );
        }

        if (state is SuccessBlogState) {
          if (state.data.isEmpty) {
            return Center(
              child: Texts.text('Data not found'),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: state.data
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BlogDetail(blog: e)));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Texts.text(e.title,
                                  fontWeight: FontWeight.bold,
                                  size: 20,
                                  maxLine: null),
                              Texts.text(e.subTitle,
                                  fontWeight: FontWeight.normal, size: 16),
                              Row(
                                children: [
                                  Texts.text(e.author,
                                      fontWeight: FontWeight.bold),
                                  Gap.h(10),
                                  Texts.text(DateFormat('dd-mm-yyyy').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          e.createAt * 1000))),
                                ],
                              ),
                              Gap.v(15),
                              Image.network(
                                e.photo,
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: Texts.text('Cannot load image'),
                                  );
                                },
                              ),
                              Gap.v(10),
                              Texts.text(e.content,
                                  size: 14,
                                  maxLine: null,
                                  textAlign: TextAlign.justify),
                              Gap.v(20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
