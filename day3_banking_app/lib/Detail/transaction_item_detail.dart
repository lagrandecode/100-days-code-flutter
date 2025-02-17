import 'package:flutter/material.dart';

class TransactionItemDetail extends StatefulWidget {
  const TransactionItemDetail({super.key});

  @override
  State<TransactionItemDetail> createState() => _TransactionItemDetailState();
}

class _TransactionItemDetailState extends State<TransactionItemDetail> {
  int currentIndex = 0;
  final PageController _pageController = PageController(viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
            // Carousel slider menu
            sliderMenu(),
            const SizedBox(height: 40),
            totalIncomeExpense(),
          ],
        ),
      ),
    );
  }

  Widget sliderMenu() {
    return SizedBox(
      height: 100,
      child: PageView.builder(
        controller: _pageController,
        itemCount: 3,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return carouselItem(
            index: index,
            color: index == 0 ? Colors.blueAccent : index == 1 ? Colors.orange : Colors.red,
            icon: index == 0 ? Icons.flight_takeoff : index == 1 ? Icons.fastfood : Icons.directions_run,
          );
        },
      ),
    );
  }

  Widget carouselItem({required int index, required Color color, required IconData icon}) {
    Color backgroundColor = index == currentIndex ? color : Colors.transparent;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 100,
        decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(20)),
          child: Icon(icon, color: backgroundColor == color ? Colors.white : color, size: 35),
        ),
      ),
    );
  }

  Padding totalIncomeExpense() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("Total Income", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white60)),
              Text("\$2,500", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white)),
            ],
          ),
          SizedBox(height: 45, child: VerticalDivider(color: Colors.white54)),
          Column(
            children: [
              Text("Total Expense", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white60)),
              Text("\$1,200", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
