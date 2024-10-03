import 'package:flutter/material.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({super.key});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  List<Diamond> diamonds = [
    Diamond(price: 5000, carat: 1.2, discount: 10, color: "G", clarity: "VVS1"),
    Diamond(price: 3000, carat: 0.9, discount: 5, color: "H", clarity: "VS2"),
    Diamond(price: 7000, carat: 1.5, discount: 15, color: "D", clarity: "IF"),
    // Add more diamonds as needed
  ];
  final List<String> sortOptions = [
    "Price Low to High",
    "Price High to Low",
    "Carat Low to High",
    "Carat High to Low",
    "Disc% Low to High",
    "Disc% High to Low",
    "Color Low to High",
    "Color High to Low",
    "Clarity Low to High",
    "Clarity High to Low",
  ];
  List<String> selectedFilters = [];
  List<Diamond> filteredDiamonds = [];

  bool check = false;

  void _toggleFilter(String filter) {
    setState(() {
      if (selectedFilters.contains(filter)) {
        selectedFilters.remove(filter);
      } else {
        selectedFilters.add(filter);
      }
    });
  }

  void _applyFilters() {
    setState(() {
      filteredDiamonds = List.from(diamonds);

      for (var filter in selectedFilters) {
        switch (filter) {
          case 'Price Low to High':
            filteredDiamonds.sort((a, b) => a.price.compareTo(b.price));
            break;
          case 'Price High to Low':
            filteredDiamonds.sort((a, b) => b.price.compareTo(a.price));
            break;
          case 'Carat Low to High':
            filteredDiamonds.sort((a, b) => a.carat.compareTo(b.carat));
            break;
          case 'Carat High to Low':
            filteredDiamonds.sort((a, b) => b.carat.compareTo(a.carat));
            break;
          case 'Disc% Low to High':
            filteredDiamonds.sort((a, b) => a.discount.compareTo(b.discount));
            break;
          case 'Disc% High to Low':
            filteredDiamonds.sort((a, b) => b.discount.compareTo(a.discount));
            break;
          case 'Color Low to High':
            // Implement color sorting
            break;
          case 'Color High to Low':
            // Implement color sorting
            break;
          case 'Clarity Low to High':
            // Implement clarity sorting
            break;
          case 'Clarity High to Low':
            // Implement clarity sorting
            break;
        }
      }
    });
    Navigator.of(context).pop(); // Close the drawer after applying filters
  }

  void _clearFilters() {
    setState(() {
      selectedFilters.clear();
      filteredDiamonds = List.from(diamonds);
    });
    Navigator.of(context).pop(); // Close the drawer after clearing filters
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sort By',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: ListView(
              children: [
                SortOption(
                  'Price Low to High',
                  _toggleFilter,
                  selectedFilters,
                ),
                SortOption(
                  'Price High to Low',
                  _toggleFilter,
                  selectedFilters,
                ),
                SortOption(
                  'Carat Low to High',
                  _toggleFilter,
                  selectedFilters,
                ),
                SortOption(
                  'Carat High to Low',
                  _toggleFilter,
                  selectedFilters,
                ),
                SortOption(
                  'Disc% Low to High',
                  _toggleFilter,
                  selectedFilters,
                ),
                SortOption(
                  'Disc% High to Low',
                  _toggleFilter,
                  selectedFilters,
                ),
                SortOption(
                  'Color Low to High',
                  _toggleFilter,
                  selectedFilters,
                ),
                SortOption(
                  'Color High to Low',
                  _toggleFilter,
                  selectedFilters,
                ),
                SortOption(
                  'Clarity Low to High',
                  _toggleFilter,
                  selectedFilters,
                ),
                SortOption(
                  'Clarity High to Low',
                  _toggleFilter,
                  selectedFilters,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: _clearFilters,
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffE1E1E1)),
                    child: const Center(child: Text("Cancel")),
                  ),
                ),
                GestureDetector(
                  onTap: _applyFilters,
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffA47842),
                    ),
                    child: const Center(
                        child: Text(
                      "Done",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: ElevatedButton(
                //           onPressed: _clearFilters,
                //           child: Text('Clear Filters'),
                //         ),
                //       ),
                //       SizedBox(width: 8),
                //       Expanded(
                //         child: ElevatedButton(
                //           onPressed: _applyFilters,
                //           child: Text('Apply Filters'),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
    //   Drawer(
    //   child: Column(
    //     children: [
    //       AppBar(
    //         backgroundColor: Colors.white,
    //         elevation: 0,
    //         automaticallyImplyLeading: false,
    //         title: const Text(
    //           'Sort By',
    //           style: TextStyle(color: Colors.black),
    //         ),
    //         actions: [
    //           IconButton(
    //             icon: const Icon(Icons.close, color: Colors.black),
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //           )
    //         ],
    //       ),
    //       Expanded(
    //         child: ListView.builder(
    //           itemCount: sortOptions.length,
    //           itemBuilder: (context, index) {
    //             return ListTile(
    //               leading: const Icon(Icons.add, color: Colors.brown),
    //               title: Text(
    //                 sortOptions[index],
    //                 style: const TextStyle(fontSize: 16),
    //               ),
    //               onTap: () {},
    //             );
    //           },
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(16.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             GestureDetector(
    //               onTap: () {
    //                 Navigator.pop(context);
    //               },
    //               child: Container(
    //                 height: 50,
    //                 width: 100,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     color: const Color(0xffE1E1E1)),
    //                 child: const Center(child: Text("Cancel")),
    //               ),
    //             ),
    //             Container(
    //               height: 50,
    //               width: 100,
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(10),
    //                 color: const Color(0xffA47842),
    //               ),
    //               child: const Center(
    //                   child: Text(
    //                 "Done",
    //                 style: TextStyle(color: Colors.white),
    //               )),
    //             ),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}

class SortOption extends StatelessWidget {
  final String text;
  final Function(String) onToggle;
  final List<String> selectedFilters;

  bool isLoading = true;

  SortOption(
    this.text,
    this.onToggle,
    this.selectedFilters,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CheckboxListTile(
        //   title: Text(text),
        //   value: selectedFilters.contains(text),
        //   onChanged: (_) => onToggle(text),
        // ),
        ListTile(
          leading: isLoading ? Icon(Icons.add) : Icon(Icons.add),
          title: Text(text),
          onTap: () => onToggle(text),
        ),
        Divider(),
      ],
    );
  }
}

class Diamond {
  double price;
  double carat;
  double discount;
  String color;
  String clarity;

  Diamond({
    required this.price,
    required this.carat,
    required this.discount,
    required this.color,
    required this.clarity,
  });
}
