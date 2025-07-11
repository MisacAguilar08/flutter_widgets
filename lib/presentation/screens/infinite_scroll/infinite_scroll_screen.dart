import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_scroll_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final List<int> _items = [1, 2, 3, 4, 5];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  bool _isMounted = true;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels+500 >= _scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _isMounted = false;
    super.dispose();
  }

  void addFiveImages() {
    final lastId = _items.isNotEmpty ? _items.last : 0;

    _items.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  Future loadNextPage() async{
    if(_isLoading) return;
    _isLoading = true;
    setState((){});

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    _isLoading = false;

    if(!_isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  Future<void> onRefresh() async{
    _isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    if(!_isMounted) return;

    _isLoading = false;
    final lastId = _items.isNotEmpty ? _items.last : 0;
    _items.clear();
    _items.add(lastId+1);
    addFiveImages();

    setState(() {});

  }

  void moveScrollToBottom(){

    if(_scrollController.position.pixels + 100 <= _scrollController.position.maxScrollExtent) return;

    _scrollController.animateTo(
        _scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2.0,
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: const AssetImage("assets/images/jar-loading.gif"),
                image: NetworkImage(
                    'https://picsum.photos/id/${_items[index]}/500/300'),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: _isLoading? CircularProgressIndicator():Icon(Icons.arrow_back),
      ),
    );
  }
}
