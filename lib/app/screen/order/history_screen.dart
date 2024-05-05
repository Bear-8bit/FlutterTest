import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/style/shadow.dart';
import 'package:flutter_store/app/config/utils/appbar/appbar.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/data/api.dart';
import 'package:flutter_store/app/model/bill.dart';
import 'package:flutter_store/app/screen/order/history_detail.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({
    super.key,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  Future<List<BillModel>> _getBills() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
    return await APIRepository().getHistory(prefs.getString('token').toString());
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BillModel>>(
      future: _getBills(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: TAppBar(
            showBackArrow: true,
            title: Padding(padding: const EdgeInsets.only(left: 12), child: Text('Danh sách đơn hàng', style: Theme.of(context).textTheme.headlineMedium,)),
          ),
          body: Padding(
            padding: EdgeInsets.zero,
            child: ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final itemBill = snapshot.data![index];
                return _billWidget(itemBill, context);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 0),
            ),
          ),
        );
      },
    );
  }

  Widget _billWidget(BillModel bill, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [ShadowStyle.verticalProductShadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            var temp = await APIRepository().getHistoryDetail(bill.id, prefs.getString('token').toString());
            Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryDetail(bill: temp)));
          },
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const RoundedContainer(backgroundColor: Colors.black, child: Icon(Iconsax.shopping_bag, color: Colors.white)),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bill.fullName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    NumberFormat('#,##0 ' 'đ').format(bill.total),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    bill.dateCreated,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: RoundedContainer(
                  showBorder: true,
                  child: IconButton(
                    onPressed: () async {
                        SharedPreferences pref = await SharedPreferences.getInstance();
                      setState(() async {
                        await APIRepository().removeBill(bill.id, pref.getString('token').toString());
                      });
                    },
                    icon: const Icon(
                      Iconsax.trash,
                      color: Colors.black,
                    )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
