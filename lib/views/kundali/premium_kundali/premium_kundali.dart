import 'package:flutter/material.dart';
import 'package:rashi_network/ui/theme/buttons/buttons.dart';
import 'package:rashi_network/ui/theme/text.dart';
import 'package:rashi_network/ui/widgets/material_iconbtn.dart';
import 'package:rashi_network/utils/design_colors.dart';
import 'package:rashi_network/views/kundali/premium_kundali/kundali_detail.dart';

class PremiumKundali extends StatefulWidget {
  const PremiumKundali({super.key});

  @override
  State<PremiumKundali> createState() => _PremiumKundaliState();
}

class _PremiumKundaliState extends State<PremiumKundali>
    with SingleTickerProviderStateMixin {
  final text = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 24,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: DesignColor.darkTeal2,
        title: const DesignText(
          'Kundali Detail',
          color: Colors.white,
          fontSize: 20,
          fontWeight: 600,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: FloatingActionButton.extended(
              backgroundColor: DesignColor.darkTeal,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const KundaliPremiumDetails(),
                  ),
                );
              },
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              label: Container(
                margin: const EdgeInsets.only(left: 4),
                child: const DesignText(
                  "Buy now",
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: 600,
                ),
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const KundaliPremiumDetails(),
                    ),
                  );
                },
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 160,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                          color: DesignColor.lightGrey,
                        ),
                      ),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.network(
                          'https://www.ratanrashi.com/product_images/product_292_1260_thumb.jpg',
                          fit: BoxFit.cover,
                          height: 160,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const DesignText(
                                    'Premium Kundali',
                                    fontSize: 14,
                                    fontWeight: 700,
                                  ),
                                  Row(
                                    children: const [
                                      DesignText(
                                        'Rs.1800',
                                        fontSize: 14,
                                        fontWeight: 600,
                                      ),
                                      SizedBox(width: 6),
                                      DesignText(
                                        'Rs.2200',
                                        fontSize: 12,
                                        fontWeight: 600,
                                        decoration: TextDecoration.lineThrough,
                                        color: DesignColor.lightGrey1,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 34,
                              width: 70,
                              child: DesignButtons(
                                onPressed: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const KundaliPremiumDetails(),
                                    ),
                                  );
                                },
                                textLabel: 'Buy',
                                isTappedNotifier: ValueNotifier(false),
                                sideWidth: 1,
                                colorText: DesignColor.darkTeal1,
                                borderSide: true,
                                colorBorderSide: DesignColor.darkTeal1,
                                fontSize: 12,
                                fontWeight: 600,
                                color: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const DesignText(
                'Ask 1 free question',
                fontSize: 16,
                fontWeight: 500,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: text,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Field Required";
                  }
                  return null;
                },
                onTapOutside: (event) {
                  final currentFocus = FocusScope.of(context);
                  if (currentFocus.focusedChild != null) {
                    currentFocus.focusedChild!.unfocus();
                  }
                },
                onChanged: (value) {
                  if (text.text.trim().length == 1 ||
                      text.text.trim().isEmpty) {
                    // setState(() {});
                    text.text.trim().isNotEmpty
                        ? _controller.forward()
                        : _controller.reverse();
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Type question....',
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          width: _animation.value,
                          child: _animation.value == 0.0
                              ? null
                              : Material(
                                  borderRadius: BorderRadius.circular(60),
                                  clipBehavior: Clip.antiAlias,
                                  child: IconButton(
                                    constraints: const BoxConstraints(),
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const SuccessDialogCard(),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.send,
                                      color: Colors.black,
                                      size: _animation.value,
                                    ),
                                  ),
                                ),
                        );
                      }),
                  //if (text.text.trim().isNotEmpty)
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding: const EdgeInsets.all(16),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: DesignColor.darkGrey, width: 1.0),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: DesignColor.lightGrey3, width: 1.0),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: DesignColor.lightGrey3, width: 1.0),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: DesignColor.tapRed, width: 1.0),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                minLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessDialogCard extends StatelessWidget {
  const SuccessDialogCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                alignment: Alignment.topRight,
                child: MaterialIconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close))),
            const SizedBox(height: 10),
            const DesignText(
              'Thank you',
              fontSize: 16,
              fontWeight: 400,
              color: DesignColor.gold,
            ),
            const SizedBox(height: 6),
            const DesignText(
              'We will send our response for your questions in reports',
              fontSize: 14,
              fontWeight: 400,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
