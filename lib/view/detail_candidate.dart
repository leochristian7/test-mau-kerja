import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mau_kerja/bloc/detail_candidate/detail_candidate_bloc.dart';
import 'package:mau_kerja/common/texts.dart';
import 'package:mau_kerja/model/model_candidate.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailCandidate extends StatelessWidget {
  const DetailCandidate({super.key, required this.candidate});

  final ModelCandidate candidate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Texts.text('Detail', color: Colors.white),
        ),
        body: BlocProvider(
          create: (context) =>
              DetailCandidateBloc()..getDetailCandidate(candidate),
          child: body(),
        ),
      ),
    );
  }

  Widget body() {
    return BlocBuilder<DetailCandidateBloc, DetailCandidateState>(
      builder: (context, state) {
        if (state is LoadingDetailCandidateState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is FailureDetailCandidateState) {
          return Center(
            child: Texts.text(state.errror),
          );
        }

        if (state is SuccessDetailCandidateState) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 125,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        state.candidate.photo,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Texts.text(state.candidate.name,
                    size: 28, fontWeight: FontWeight.bold),
                Texts.text(
                  state.candidate.gender == 'm'
                      ? 'Gender Male'
                      : 'Gender Female',
                ),
                Texts.text(
                    'Birthday ${DateFormat('dd-mm-yyyy').format(DateTime.fromMillisecondsSinceEpoch(state.candidate.birthday))}'),
                Texts.text(
                    'Expired ${DateFormat('dd-mm-yyyy').format(DateTime.fromMillisecondsSinceEpoch(state.candidate.expired))}'),
                InkWell(
                    onTap: state.email?.email != null
                        ? () async {
                            String? encodeQueryParameters(
                                Map<String, String> params) {
                              return params.entries
                                  .map((MapEntry<String, String> e) =>
                                      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                  .join('&');
                            }

                            final Uri emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: '${state.email?.email}',
                              query: encodeQueryParameters(<String, String>{
                                'subject': 'Hi i am MK company',
                                'body': 'Hi i am MK company'
                              }),
                            );

                            await launchUrl(emailLaunchUri);
                          }
                        : null,
                    child: Texts.text(state.email?.email ?? '-',
                        color: Colors.blue)),
                InkWell(
                    onTap: () async {
                      var whatsapp = state.email?.phone; //+92xx enter like this
                      var whatsappURlAndroid = "whatsapp://send?phone=" +
                          whatsapp! +
                          "&text=Hi i am MK company";
                      var whatsappURLIos =
                          "https://wa.me/$whatsapp?text=${Uri.tryParse('Hi i am MK company')}";
                      if (Platform.isIOS) {
                        // for iOS phone only
                        if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
                          await launchUrl(Uri.parse(
                            whatsappURLIos,
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Whatsapp not installed")));
                        }
                      } else {
                        // android , web
                        await launchUrl(Uri.parse(whatsappURlAndroid));
                      }
                    },
                    child: Texts.text(state.email?.phone ?? '-',
                        color: Colors.blue)),
                Texts.text(state.address?.address ?? '-'),
                Texts.text(state.address?.city ?? '-'),
                Texts.text(state.address?.state ?? '-'),
                Texts.text(state.address?.zipCode.toString() ?? '-'),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
