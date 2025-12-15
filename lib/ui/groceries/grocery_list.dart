import 'package:flutter/material.dart';
import 'package:grocery_app/ui/groceries/grocery_form.dart';
import '../../data/mock_grocery_repository.dart';
import '../../data/models/grocery.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void onCreate() async {
    // TODO-4 - Navigate to the form screen using the Navigator push
    final newItem = await Navigator.of(
      context,
    ).push<Grocery>(MaterialPageRoute(builder: (context) => const NewItem()));
    if (newItem != null) {
      setState(() {
        dummyGroceryItems.add(newItem);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      // TODO-1 - Display groceries with an Item builder and  LIst Tile
      content = ReorderableListView.builder(
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final item = dummyGroceryItems.removeAt(oldIndex);
            dummyGroceryItems.insert(newIndex, item);
          });
        },
        itemCount: dummyGroceryItems.length,
        itemBuilder: (ctx, index) => GroceryTile(
          key: ValueKey(dummyGroceryItems[index].id),
          grocery: dummyGroceryItems[index],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    // TODO-2 - Display groceries with an Item builder and  LIst Tile
    return ListTile(
      key: ValueKey(grocery.id),
      leading: Container(color: grocery.category.color, width: 15, height: 15),
      title: Text(grocery.name),
      subtitle: Text(
        '${grocery.category.label} - Quantity: ${grocery.quantity}',
      ),
    );
  }
}
