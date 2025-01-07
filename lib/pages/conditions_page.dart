import 'package:flutter/material.dart';
import 'package:your_global_trip/tiles/custom_appbar.dart';

class ConditionsPage extends StatelessWidget {
  const ConditionsPage({super.key});
  static const String conditionsText = '''
  Terms & Conditions
1. Booking Confirmation
Upon booking and payment of your booked excursions/trips, we will send a confirmation e-mail to your advised personal email address and mobile phone number.

Your ticket/booking confirmation will show your unique confirmation number, the excursions booked, the amount paid and your payment method.

Your ticket will also show your time and place for pick-up.

Please check that your ticket is correctly booked, and that your name is correctly spelled. Name change is allowed with more than 24 hours to trip start.
2. Payment of Your Excursion
You are required to pay for your excursion/trip immediately upon reservation. You will be able to make payment with credit cards (Visa or MasterCard) as well as a range of payment service such as GooglePay, Payconiq, Trustly, SEPA, Satispay, iDEAL, MobilePay, ApplePay and PayPal – depending on your country of residence.
3. VAT on Your Excursion
Your trip price includes local Egyptian taxes and VAT. No EU VAT is added.
4. Pick up and Timings of your Excursion
We will pick you up from your hotel’s reception area at the time advised in your booking confirmation. You will also be dropped off after the tour is finished at your hotel. Any changes to pick up time will be advised 1 or 2 days before the tour, if necessary.
5. Cancellation and Refunds
a. If your Excursion includes a Domestic Flight
Due to limited flight availability a trip containing domestic flights will not be confirmed until we get back to you with a flight confirmation.

If a domestic, scheduled flight is included in your excursion, it is not possible to cancel after the purchase has been completed. The excursion cannot be subsequently transferred to another person, cancelled or refunded, as personal domestic flight tickets are issued immediately after payment.

b. Cancellation and Refunds (no Flights included)
Cancellation with more than 24 hours to go:
You can cancel or reschedule your trip free of charge with more than 24 hours to trip start. You can cancel by contacting us via our 24-hour service phone or via our service on WhatsApp.

Your trip refund will be made by us a day after your cancellation. Please note it may take up to two weeks before your money is back in your account depending on payment method and bank / card issuer.

Cancellation with 24 hours or less to go:
Cancellation between 24 and 12 hours before start: 50 % refund.
Cancellation between 12 hours or less to start: No refund.
This also applies if you do not show up at designated start time.


c. Refund of Trips Cancelled by Us
If we cancel any of your booked trips, you will be notified either by phone or by message as quickly as possible, and you will receive a full refund. The refund will be returned through the same payment method as used by you.
6. Contact to Service Centre
Our selection of excursions and trips is based on many years of experience in the market in Egypt. We are keen to improve our products, and we are keen to maintain happy guests.

For every excursion or trip you can read in detail what is included before you book.

In the unfortunate event that an excursion does not live up to its description, we kindly ask you to please contact our 24-hour Service Contact, who will handle your complaint swiftly and fairly.

We offer a 24-hour service contact via telephone (also available on WhatsApp). Please see contact details on About.
7. Legal Entity
ATL Leisure A/S
Registered in Denmark as No. DK-18645343
Per Henrik Lings Allé 4, 2100 Copenhagen Ø, Denmark
''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Conditions",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(conditionsText),
        ),
      ),
    );
  }
}
