import 'package:flutter/material.dart';
import 'package:tokoonline/constans.dart';
import 'package:tokoonline/users/depanpage.dart';
import 'package:tokoonline/users/kategoripage.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // ignore: unused_field
  late int _activeTabIndex;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_setActiveTabIndex);
  }

  void _setActiveTabIndex() {
    _activeTabIndex = _tabController.index;
  }

  @override
  // ignore: unnecessary_overrides
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: TextField(
            onTap: () {},
            readOnly: true,
            style: const TextStyle(fontSize: 15),
            decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search, color: Palette.Orange),
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                fillColor: const Color(0xfff3f3f4),
                filled: true),
          ),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Palette.Orange,
            labelColor: Palette.Orange,
            unselectedLabelColor: Colors.grey,
            labelPadding: const EdgeInsets.all(0),
            tabs: const [
              Tab(text: 'Beranda'),
              Tab(text: 'Kategori'),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(), 
          controller: _tabController,
          children: const [
            DepanPage(),
            KategoriPage(),
          ],
        )
        );
  }
}
