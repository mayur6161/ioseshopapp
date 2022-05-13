import 'package:e_shop_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class ReturnPolicy extends StatelessWidget {
  const ReturnPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [kPrimaryColor, Colors.green],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: const Text("Return Policy"),
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 10,
              ),
              Text(
                "Returns & Refunds policy:",
                style: TextStyle(fontFamily: "SFCMed", fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "You are entitled to return your order within 5 hours with giving reason for doing so. The deadline for returning an order is 5 Hours from the date you received the goods or on which a third party you have appointed, who is not the carrier, takes possession of the product delivered. In order to exercise your right of cancellation, you must inform us of your decision by means of a clear statement. You can inform us of your decision by e-mail gogreenplantshop@gmail.com We will reimburse you no later than 30 days from the day on which we receive the returned goods. We will use the same means of payment as you used for the order, and you will not incur any fees for such reimbursement."),
              SizedBox(
                height: 10,
              ),
              Text("Conditions for returns:"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "In order for the goods to be eligible for a return, please make sure that: The goods were received in the last 5 Hours The goods are in the original packaging The following goods cannot be returned: The supply of goods made to your specifications or clearly personalized. The supply of goods which according to their nature are not suitable to be returned, for example goods which deteriorate rapidly or where the date of expiry is over. The supply of goods which are not suitable for return due to health protection or hygiene reasons and were unsealed after delivery. The supply of goods which are, after delivery, according to their nature, inseparably mixed with other items. We reserve the right to refuse returns of any merchandise that does not meet the above return conditions at our sole discretion."),
              SizedBox(
                height: 10,
              ),
              Text("Returning Goods"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "You are responsible for the cost and risk of returning the goods to us. You should send the mail on gogreenplantshop@gmail.com to return the goods. We cannot be held responsible for goods damaged or lost in return shipment. Therefore, we recommend an insured and trackable mail service. We are unable to issue a refund without actual receipt of the goods or proof of received return delivery."),
              SizedBox(
                height: 10,
              ),
              Text("Gifts:"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "If the goods were marked as a gift when purchased and then shipped directly to you, you'll receive a gift credit for the value of your return. Once the returned product is received. If the goods weren't marked as a gift when purchased, or the gift giver had the order shipped to themselves to give it to you later, We will send the refund to the gift giver."),
              SizedBox(
                height: 10,
              ),
              Text("Contact Us"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "If you have any questions about our Returns and Refunds Policy, please contact us by e-mail gogreenplantshop@gmail.com"),
              SizedBox(
                height: 10,
              ),
              Text(""),
              SizedBox(
                height: 10,
              ),
              Text(
                "",
                style: TextStyle(fontFamily: "SFCMed", fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
