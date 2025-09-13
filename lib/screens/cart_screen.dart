// lib/screens/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trend_cart/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen to changes in the CartProvider
    final cart = Provider.of<CartProvider>(context);
    final cartItems = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text('Your cart is empty. Add some products!'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.itemCount,
                    itemBuilder: (ctx, i) {
                      final item = cartItems[i];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(item.product.imageUrl),
                            ),
                            title: Text(item.product.name),
                            subtitle: Text('Total: \$${(item.product.price * item.quantity).toStringAsFixed(2)}'),
                            trailing: Text('${item.quantity} x'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Summary and Checkout section
                Card(
                  margin: const EdgeInsets.all(15),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Chip(
                              label: Text(
                                '\$${cart.totalPrice.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              backgroundColor: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        FilledButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Checkout feature is not implemented yet.')),
                            );
                          },
                          child: const Text('CHECKOUT'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
