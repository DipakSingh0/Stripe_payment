import 'package:flutter/material.dart';
import 'package:stripe/services/stripe_service.dart';
import 'package:stripe/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stripe Payment Demo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      drawer: const DrawerWidget(), 
      body: Center(
        child:
        MaterialButton(
        onPressed: () async {
          try {
            await StripeService.instance.makePayment();
            //  success snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Payment successful!')),
            );
          } catch (e) {
            //  error snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Payment failed: ${e.toString()}')),
            );
          }
        },
        child: Text("Purchase"),
      )
        //  MaterialButton(
        //   onPressed: () {
        //     StripeService.instance.makePayment();
        //   },
        //   color: Colors.green,
        //   child: const Text(
        //     "Purchase",
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
      ),
    );
  }
}
