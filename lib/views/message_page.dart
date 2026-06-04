import 'package:flowershop/data/messages.dart';
import 'package:flowershop/models/message.dart';
import 'package:flowershop/theme/app_text_styles.dart';
import 'package:flowershop/theme/app_theme.dart';
import 'package:flowershop/viewmodels/cart_view_model.dart';
import 'package:flowershop/widgets/message_card.dart';
import 'package:flowershop/widgets/page_title.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  final CartViewModel cartViewModel;
  const MessagePage({super.key, required this.cartViewModel});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  Message? selectedMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTitleBox(title: "Uw laatste woorden,...?"),

            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.mutedPurple, width: 1.5),
                  ),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: AppTheme.darkSlate,
                    backgroundImage: AssetImage('assets/images/thing.jpg'),
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  ' \'Thing\' voegt de gekozen boodschap toe...',
                  style: AppTextStyles.cardtitle(context),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];

                  return SizedBox(
                    height: 180,
                    child: MessageCard(
                      message: message,
                      isSelected:
                          selectedMessage?.messagecontent ==
                          message.messagecontent,
                      onAddMessage: () {
                        setState(() {
                          selectedMessage = message;
                          widget.cartViewModel.addMessage(message);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
