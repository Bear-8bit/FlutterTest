import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/style/shadow.dart';
import 'package:flutter_store/app/config/utils/image_container/rounded_image_container.dart';
import 'package:flutter_store/app/model/bill.dart';
import 'package:intl/intl.dart';

class HistoryDetail extends StatefulWidget {
  final List<BillDetailModel> bill;
  const HistoryDetail({super.key, required this.bill});

  @override
  State<HistoryDetail> createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Padding(padding: EdgeInsets.only(left: 40), child: Text('Thông tin đơn hàng'))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView.separated(
          itemCount: widget.bill.length,
          itemBuilder: (context, index) {
            var data = widget.bill[index];
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: const [ShadowStyle.verticalProductShadow],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:  RoundedImage(imageUrl: data.imageUrl, isNetworkImage: true),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.productName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Số lượng: ${data.count.toString()}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Giá: ${NumberFormat('#,##0 '+ 'đ').format(data.price)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Tổng: ${NumberFormat('#,##0 ' + 'đ').format(data.total)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            );
          }, separatorBuilder: (context, index) => const SizedBox(height: 20),
        ),
      ),
    );
  }
}
