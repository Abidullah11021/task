import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/common/extensions/num.dart';
import 'package:task/common/widgets/app_text.dart';
import 'package:task/features/home/presentation/providers/home_provider.dart';
import 'package:task/util/resource/r.dart';
import 'package:task/util/toast/toast.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AppText(
          text: "Salvati",
          fontWeight: FontWeight.bold,
          fontSize: 22.sp,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) => ListView.builder(
          itemCount: provider.items.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            final item = provider.items[index];

            return Dismissible(
              key: Key(item.id.toString()),
              background: Container(
                decoration: BoxDecoration(
                  color: R.colors.redFF0000,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: Icon(Icons.delete, color: R.colors.whiteFFFFFF),
              ),
              secondaryBackground: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: Icon(Icons.bookmark_remove, color: R.colors.whiteFFFFFF),
              ),
              onDismissed: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  showToast(msg: "${item.title} rimosso");
                } else {
                  showToast(msg: "${item.title} salvato altrove");
                }
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: R.colors.black000000.withValues(alpha: 0.05),
                      blurRadius: 5.r,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12)),
                      child: Image.asset(
                        item.image,
                        width: 120.w,
                        height: 100.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: item.title,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                            4.hb,
                            AppText(
                              text: item.location,
                              color: R.colors.grey8F959E,
                              fontSize: 13.sp,
                            ),
                            4.hb,
                            AppText(
                              text: item.price,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            4.hb,
                            Row(
                              children: [
                                Text(
                                  item.status,
                                  style: TextStyle(
                                    color: item.statusColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                6.wb,
                                Icon(
                                  Icons.circle,
                                  size: 10.sp,
                                  color: item.statusColor,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Ricerca"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Salvati"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Prenotazioni"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messaggi"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profilo"),
        ],
      ),
    );
  }
}
