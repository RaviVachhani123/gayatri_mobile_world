
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gayatri_mobile_world/customfolder/custom_things.dart';
import 'package:lottie/lottie.dart';

class SoldProductPage extends StatefulWidget {
  const SoldProductPage({super.key});

  @override
  State<SoldProductPage> createState() => _SoldProductPageState();
}

class _SoldProductPageState extends State<SoldProductPage> {

  late PageController _pageController;

  @override

  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0); // Best practice
  }

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customstheam.icon_col),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Sold Products',
          style: TextStyle(fontSize: customstheam.h1),
        ),
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    _pageController.animateToPage(
                      0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    setState(() {
                      _currentPage = 0;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: _currentPage == 0
                                    ? customstheam.icon_col
                                    : Colors.grey.withOpacity(0.2),
                                width: 2))),
                    height: height * 0.05,
                    alignment: Alignment.center,
                    width: width * 0.5,
                    child: Text('Individual Product', style:TextStyle(fontSize: customstheam.h1,
                    fontWeight: customstheam.h1_weight,
                      color: _currentPage == 0
                          ? customstheam.icon_col
                          : Colors.black,)
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _pageController.animateToPage(
                      1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    setState(() {
                      _currentPage = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: _currentPage == 1
                                ? customstheam.icon_col
                                : Colors.grey.withOpacity(0.2),
                            width: 2),
                      ),
                    ),
                    height: height * 0.05,
                    alignment: Alignment.center,
                    width: width * 0.5,
                    child: Text('Bulk Sold', style:TextStyle(
                      fontWeight: customstheam.h1_weight,
                      fontSize: customstheam.h1,
                      color: _currentPage == 1
                          ? customstheam.icon_col
                          : Colors.black,
                    )

                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: PageView(
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  print(index);
                  _currentPage = index;
                });
              },
              controller: _pageController,
              children: [
                Individual_Product(),
                Bulk_Sold(),
              ],
            ),
            ),

          ],
        ),
      ),
    );
  }
}




class Individual_Product extends StatefulWidget {
  const Individual_Product({super.key});

  @override
  State<Individual_Product> createState() => _Individual_ProductState();
}

class _Individual_ProductState extends State<Individual_Product> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: customstheam.icon_col, width: 1),
                      borderRadius: BorderRadius.circular(16)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: customstheam.icon_col, width: 1),
                      borderRadius: BorderRadius.circular(16)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: customstheam.icon_col, width: 1),
                      borderRadius: BorderRadius.circular(16)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: customstheam.icon_col, width: 1),
                      borderRadius: BorderRadius.circular(16)),
                  hintText: 'Search By IMEI,Phone Number,Name',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize:14,
                  ),
                  suffixIcon: IconButton(onPressed: (){
                    ///TODO: Open The Camera in popup
                  }, icon: Icon(Icons.qr_code))
              ),
            ),
          ),


          ///if there is no data in individual product
          Column(
            children: [
              Container(

                alignment: Alignment.topCenter,
                child: Lottie.asset('assets/images/Emptybox.json',height: height*0.4),
              ),
              Text("No sold products found",style: TextStyle(fontSize: customstheam.h1,fontWeight: customstheam.h1_weight)),

              SizedBox(height: 14,),
              Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    
                    
                    color: Colors.black, // Border color
                    width: 1.0,         // Border width
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                children: [
                Icon(Icons.refresh , color: Colors.deepPurple,),
                SizedBox(width: 5,),
                Text('Refresh',style: TextStyle(color: Colors.deepPurple),),
                ],
              ),
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}






class Bulk_Sold extends StatefulWidget {
  const Bulk_Sold({super.key});

  @override
  State<Bulk_Sold> createState() => _Bulk_SoldState();
}

class _Bulk_SoldState extends State<Bulk_Sold> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ///if there is no data in bulk sold
          Column(
            children: [
              Container(

                alignment: Alignment.topCenter,
                child: Lottie.asset('assets/images/Emptybox.json',height: height*0.4),
              ),
              Text("No sold products found",style: TextStyle(fontSize: customstheam.h1,fontWeight: customstheam.h1_weight)),
              SizedBox(height: 14,),
              Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 1.0,         // Border width
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.refresh , color: Colors.deepPurple,),
                      SizedBox(width: 5,),
                      Text('Refresh',style: TextStyle(color: Colors.deepPurple),),
                    ],
                  ),
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}