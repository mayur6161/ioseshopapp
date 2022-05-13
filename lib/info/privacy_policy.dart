import 'package:e_shop_app/widgets/colors.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

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
        title: const Text("Privacy Policy"),
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
              Text(
                "PRIVACY NOTICE ",
                style: TextStyle(fontSize: 16, fontFamily: "SFCMed"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Thank you for choosing to be part of our community at Go Green Plant Shop. We are committed to protecting your personal information and your right to privacy. If you have any questions or concerns about this privacy notice or our practices with regard to your personal information, please contact us at gogreenplantshop@gmail.com."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "This privacy notice describes how we might use your information if you:"),
              SizedBox(
                height: 10,
              ),
              Text(
                  " * Download and use our mobile application — Go Green Plant Shop"),
              SizedBox(
                height: 10,
              ),
              Text(
                  " * Engage with us in other related ways ― including any sales, marketing, or events"),
              SizedBox(
                height: 10,
              ),
              Text("In this privacy notice, if we refer to:"),
              SizedBox(
                height: 10,
              ),
              Text(
                  " * App, we are referring to any application of ours that references or links to this policy, including any listed above"),
              SizedBox(
                height: 10,
              ),
              Text(
                  " * Services, we are referring to our App, and other related services, including any sales, marketing, or events"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "The purpose of this privacy notice is to explain to you in the clearest way possible what information we collect, how we use it, and what rights you have in relation to it. If there are any terms in this privacy notice that you do not agree with, please discontinue use of our Services immediately."),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please read this privacy notice carefully, as it will help you understand what we do with the information that we collect.",
                style: TextStyle(fontFamily: "SFCMed"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "1. WHAT INFORMATION DO WE COLLECT?",
                style: TextStyle(fontFamily: "SFCMed", fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "In Short:  We collect personal information that you provide to us."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "We collect personal information that you voluntarily provide to us when you register on the App, express an interest in obtaining information about us or our products and Services, when you participate in activities on the App or otherwise when you contact us."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "The personal information that we collect depends on the context of your interactions with us and the App, the choices you make and the products and features you use. The personal information we collect may include the following:"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Personal Information Provided by You. We collect names; phone numbers; email addresses; mailing addresses; usernames; contact preferences; contact or authentication data; and other similar information."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Payment Data. We may collect data necessary to process your payment if you make purchases, such as your payment instrument number (such as a credit card number), and the security code associated with your payment instrument."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "All personal information that you provide to us must be true, complete and accurate, and you must notify us of any changes to such personal information."),
              SizedBox(
                height: 10,
              ),
              Text("Information collected through our App"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "In Short:  We collect information regarding your push notifications, when you use our App."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "If you use our App, we also collect the following information:"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Push Notifications. We may request to send you push notifications regarding your account or certain features of the App. If you wish to opt-out from receiving these types of communications, you may turn them off in your device's settings."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "This information is primarily needed to maintain the security and operation of our App, for troubleshooting and for our internal analytics and reporting purposes."),
              SizedBox(
                height: 10,
              ),
              Text(
                "2. HOW DO WE USE YOUR INFORMATION?",
                style: TextStyle(fontFamily: "SFCMed", fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "In Short:  We process your information for purposes based on legitimate business interests, the fulfillment of our contract with you, compliance with our legal obligations, and/or your consent."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "We use personal information collected via our App for a variety of business purposes described below. We process your personal information for these purposes in reliance on our legitimate business interests, in order to enter into or perform a contract with you, with your consent, and/or for compliance with our legal obligations. We indicate the specific processing grounds we rely on next to each purpose listed below."),
              SizedBox(
                height: 10,
              ),
              Text("We use the information we collect or receive:"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "To facilitate account creation and logon process. If you choose to link your account with us to a third-party account (such as your Google or Facebook account), we use the information you allowed us to collect from those third parties to facilitate account creation and logon process for the performance of the contract."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "To post testimonials. We post testimonials on our App that may contain personal information. Prior to posting a testimonial, we will obtain your consent to use your name and the content of the testimonial. If you wish to update, or delete your testimonial, please contact us at gogreenplantshop@gmail.com and be sure to include your name, testimonial location, and contact information."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Request feedback. We may use your information to request feedback and to contact you about your use of our App."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "To enable user-to-user communications. We may use your information in order to enable user-to-user communications with each user's consent."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "To manage user accounts. We may use your information for the purposes of managing our account and keeping it in working order."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "To send administrative information to you. We may use your personal information to send you product, service and new feature information and/or information about changes to our terms, conditions, and policies."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "To protect our Services. We may use your information as part of our efforts to keep our App safe and secure (for example, for fraud monitoring and prevention)."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "To enforce our terms, conditions and policies for business purposes, to comply with legal and regulatory requirements or in connection with our contract."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "To respond to legal requests and prevent harm. If we receive a subpoena or other legal request, we may need to inspect the data we hold to determine how to respond."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Fulfill and manage your orders. We may use your information to fulfill and manage your orders, payments, returns, and exchanges made through the App"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Administer prize draws and competitions. We may use your information to administer prize draws and competitions when you elect to participate in our competitions."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "To deliver and facilitate delivery of services to the user. We may use your information to provide you with the requested service."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "To respond to user inquiries/offer support to users. We may use your information to respond to your inquiries and solve any potential issues you might have with the use of our Services."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "To send you marketing and promotional communications. We and/or our third-party marketing partners may use the personal information you send to us for our marketing purposes, if this is in accordance with your marketing preferences. For example, when expressing an interest in obtaining information about us or our App, subscribing to marketing or otherwise contacting us, we will collect personal information from you."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Deliver targeted advertising to you. We may use your information to develop and display personalized content and advertising (and work with third parties who do so) tailored to your interests and/or location and to measure its effectiveness."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "For other business purposes. We may use your information for other business purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our App, products, marketing and your experience. We may use and store this information in aggregated and anonymized form so that it is not associated with individual end users and does not include personal information."),
              SizedBox(
                height: 10,
              ),
              Text(
                "3. WILL YOUR INFORMATION BE SHARED WITH ANYONE?",
                style: TextStyle(fontFamily: "SFCMed", fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "In Short:  We only share information with your consent, to comply with laws, to provide you with services, to protect your rights, or to fulfill business obligations."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "We may process or share your data that we hold based on the following legal basis:"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Consent: We may process your data if you have given us specific consent to use your personal information for a specific purpose."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Legitimate Interests: We may process your data when it is reasonably necessary to achieve our legitimate business interests."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Performance of a Contract: Where we have entered into a contract with you, we may process your personal information to fulfill the terms of our contract."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Legal Obligations: We may disclose your information where we are legally required to do so in order to comply with applicable law, governmental requests, a judicial proceeding, court order, or legal process, such as in response to a court order or a subpoena (including in response to public authorities to meet national security or law enforcement requirements)."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Vital Interests: We may disclose your information where we believe it is necessary to investigate, prevent, or take action regarding potential violations of our policies, suspected fraud, situations involving potential threats to the safety of any person and illegal activities, or as evidence in litigation in which we are involved."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "More specifically, we may need to process your data or share your personal information in the following situations:"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Business Transfers. We may share or transfer your information in connection with, or during negotiations of, any merger, sale of company assets, financing, or acquisition of all or a portion of our business to another company."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Offer Wall. Our App may display a third-party hosted offer wall. Such an offer wall allows third-party advertisers to offer virtual currency, gifts, or other items to users in return for the acceptance and completion of an advertisement offer. Such an offer wall may appear in our App and be displayed to you based on certain data, such as your geographic area or demographic information. When you click on an offer wall, you will be brought to an external website belonging to other persons and will leave our App. A unique identifier, such as your user ID, will be shared with the offer wall provider in order to prevent fraud and properly credit your account with the relevant reward. Please note that we do not control third-party websites and have no responsibility in relation to the content of such websites. The inclusion of a link towards a third-party website does not imply an endorsement by us of such website. Accordingly, we do not make any warranty regarding such third-party websites and we will not be liable for any loss or damage caused by the use of such websites. In addition, when you access any third-party website, please understand that your rights while accessing and using those websites will be governed by the privacy notice and terms of service relating to the use of those websites."),
              SizedBox(
                height: 10,
              ),
              Text(
                "4. HOW LONG DO WE KEEP YOUR INFORMATION?",
                style: TextStyle(fontFamily: "SFCMed", fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "In Short:  We keep your information for as long as necessary to fulfill the purposes outlined in this privacy notice unless otherwise required by law."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "We will only keep your personal information for as long as it is necessary for the purposes set out in this privacy notice, unless a longer retention period is required or permitted by law (such as tax, accounting or other legal requirements). No purpose in this notice will require us keeping your personal information for longer than the period of time in which users have an account with us."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "When we have no ongoing legitimate business need to process your personal information, we will either delete or anonymize such information, or, if this is not possible (for example, because your personal information has been stored in backup archives), then we will securely store your personal information and isolate it from any further processing until deletion is possible."),
              SizedBox(
                height: 10,
              ),
              Text(
                "5. HOW DO WE KEEP YOUR INFORMATION SAFE?",
                style: TextStyle(fontFamily: "SFCMed", fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "In Short:  We aim to protect your personal information through a system of organizational and technical security measures."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "We have implemented appropriate technical and organizational security measures designed to protect the security of any personal information we process. However, despite our safeguards and efforts to secure your information, no electronic transmission over the Internet or information storage technology can be guaranteed to be 100% secure, so we cannot promise or guarantee that hackers, cybercriminals, or other unauthorized third parties will not be able to defeat our security, and improperly collect, access, steal, or modify your information. Although we will do our best to protect your personal information, transmission of personal information to and from our App is at your own risk. You should only access the App within a secure environment."),
              SizedBox(
                height: 10,
              ),
              Text(
                "6. DO WE COLLECT INFORMATION FROM MINORS?",
                style: TextStyle(fontFamily: "SFCMed", fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "In Short:  We do not knowingly collect data from or market to children under 18 years of age."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "We do not knowingly solicit data from or market to children under 18 years of age. By using the App, you represent that you are at least 18 or that you are the parent or guardian of such a minor and consent to such minor dependent’s use of the App. If we learn that personal information from users less than 18 years of age has been collected, we will deactivate the account and take reasonable measures to promptly delete such data from our records. If you become aware of any data we may have collected from children under age 18, please contact us at gogreenplantshop@gmail.com."),
              SizedBox(
                height: 10,
              ),
              Text(
                "7. WHAT ARE YOUR PRIVACY RIGHTS?",
                style: TextStyle(fontFamily: "SFCMed", fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "In Short:  You may review, change, or terminate your account at any time."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "If you have questions or comments about your privacy rights, you may email us at gogreenplantshop@gmail.com."),
              SizedBox(
                height: 10,
              ),
              Text("Account Information"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "If you would at any time like to review or change the information in your account or terminate your account, you can:"),
              SizedBox(
                height: 10,
              ),
              Text("Contact us using the contact information provided."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Upon your request to terminate your account, we will deactivate or delete your account and information from our active databases. However, we may retain some information in our files to prevent fraud, troubleshoot problems, assist with any investigations, enforce our Terms of Use and/or comply with applicable legal requirements."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Opting out of email marketing: You can unsubscribe from our marketing email list at any time by clicking on the unsubscribe link in the emails that we send or by contacting us using the details provided below. You will then be removed from the marketing email list — however, we may still communicate with you, for example to send you service-related emails that are necessary for the administration and use of your account, to respond to service requests, or for other non-marketing purposes. To otherwise opt-out, you may:"),
              SizedBox(
                height: 10,
              ),
              Text("Contact us using the contact information provided."),
              SizedBox(
                height: 10,
              ),
              Text(
                "8. CONTROLS FOR DO-NOT-TRACK FEATURES",
                style: TextStyle(fontFamily: "SFCMed", fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Most web browsers and some mobile operating systems and mobile applications include a Do-Not-Track (DNT) feature or setting you can activate to signal your privacy preference not to have data about your online browsing activities monitored and collected. At this stage no uniform technology standard for recognizing and implementing DNT signals has been finalized. As such, we do not currently respond to DNT browser signals or any other mechanism that automatically communicates your choice not to be tracked online. If a standard for online tracking is adopted that we must follow in the future, we will inform you about that practice in a revised version of this privacy notice. "),
              SizedBox(
                height: 10,
              ),
              Text(
                "9. DO CALIFORNIA RESIDENTS HAVE SPECIFIC PRIVACY RIGHTS?",
                style: TextStyle(fontFamily: "SFCMed", fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "In Short:  Yes, if you are a resident of California, you are granted specific rights regarding access to your personal information."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "California Civil Code Section 1798.83, also known as the Shine The Light law, permits our users who are California residents to request and obtain from us, once a year and free of charge, information about categories of personal information (if any) we disclosed to third parties for direct marketing purposes and the names and addresses of all third parties with which we shared personal information in the immediately preceding calendar year. If you are a California resident and would like to make such a request, please submit your request in writing to us using the contact information provided below."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "If you are under 18 years of age and have a registered account with the App, you have the right to request removal of unwanted data that you publicly post on the App. To request removal of such data, please contact us using the contact information provided below, and include the email address associated with your account and a statement that you reside in California. We will make sure the data is not publicly displayed on the App, but please be aware that the data may not be completely or comprehensively removed from all our systems (e.g. backups, etc.)."),
              SizedBox(
                height: 10,
              ),
              Text(
                "10. DO WE MAKE UPDATES TO THIS NOTICE?",
                style: TextStyle(fontFamily: "SFCMed", fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "In Short:  Yes, we will update this notice as necessary to stay compliant with relevant laws."),
              SizedBox(
                height: 10,
              ),
              Text(
                  "We may update this privacy notice from time to time. The updated version will be indicated by an updated Revised date and the updated version will be effective as soon as it is accessible. If we make material changes to this privacy notice, we may notify you either by prominently posting a notice of such changes or by directly sending you a notification. We encourage you to review this privacy notice frequently to be informed of how we are protecting your information."),
              SizedBox(
                height: 10,
              ),
              Text(
                "11. HOW CAN YOU CONTACT US ABOUT THIS NOTICE? ",
                style: TextStyle(fontFamily: "SFCMed", fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "If you have questions or comments about this notice, you may email us at gogreenplantshop@gmail.com"),
              SizedBox(
                height: 10,
              ),
              Text(
                "12. HOW CAN YOU REVIEW, UPDATE, OR DELETE THE DATA WE COLLECT FROM YOU?",
                style: TextStyle(fontFamily: "SFCMed", fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Based on the applicable laws of your country, you may have the right to request access to the personal information we collect from you, change that information, or delete it in some circumstances. To request to review, update, or delete your personal information, Please submit your request at gogreenplantshop@gmail.com"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "We may update this privacy notice from time to time. The updated version will be indicated by an updated Revised date and the updated version will be effective as soon as it is accessible."),
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
