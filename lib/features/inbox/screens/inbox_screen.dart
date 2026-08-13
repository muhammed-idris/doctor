import 'package:doctor/shared/back_app_bar.dart';
import 'package:doctor/shared/custom_search_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/chat_list.dart';
import '../widgets/create_chat.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: BackAppBar(
          appBarTitle: 'Message',
          showBackButton: false,
          button: Image.asset(
            "assets/icons/chat-alt-add.png",
            width: 25,
          ),
          onActionPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              barrierColor: Colors.black.withValues(alpha: 0.35),
              builder: (context) {
                return const CreateNewMessageBottomSheet();
              },
            );
          },
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSearchBar(
                  showFilter: false,
                ),
                const SizedBox(height: 10),
                const Expanded(
                  child: DoctorChatList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}