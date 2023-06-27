// ignore_for_file: non_constant_identifier_names

import 'package:gov_ser_flutter_app/utils/web_utils.dart';

List<Map<String, String>> AllGovWebList = [
  {
    "Name": "IRCTC",
    "Url": "https://www.irctc.co.in/nget/train-search",
    "Logo": "https://logos-world.net/wp-content/uploads/2020/11/IRCTC-Logo.png",
  },
  {
    "Name": "Aadhaar",
    "Url": "https://uidai.gov.in/",
    "Logo":
        "https://uxdt.nic.in/wp-content/uploads/2020/06/Aadhaar_Preview.png?x35530",
  },
  {
    "Name": "Employees Provident Fund",
    "Url": "https://www.epfindia.gov.in/site_en/index.php",
    "Logo": "https://www.epfindia.gov.in/images/EPFO_Logo.png",
  },
  {
    "Name": "Digital Gujarat",
    "Url":
        "https://www.digitalgujarat.gov.in/CitizenNew/CitizenServicesNew.aspx",
    "Logo":
        "https://play-lh.googleusercontent.com/qaX5s8NfLjYGP315O0tLlJiRuX0_58q1AkSKtNC1RjATjJrO6etSU4C4p7Ob4ODWkNIx",
  },
  {
    "Name": "Digital Locker",
    "Url": "https://www.digilocker.gov.in/",
    "Logo":
        "https://pbs.twimg.com/profile_images/1562399772258205699/hkkCWT7F_400x400.jpg",
  },
  {
    "Name": "Bharat BillPay",
    "Url": "https://www.bharatbillpay.com/bill-pay",
    "Logo":
        "https://media.umangapp.in/app/ico/service/D_1550212097071bbpsmin.png",
  },
  {
    "Name": "Health Authority",
    "Url": "https://www.abdm.gov.in/",
    "Logo":
        "https://logowik.com/content/uploads/images/national-health-authority6597.jpg",
  },
  {
    "Name": "CBSE",
    "Url": "https://www.cbse.gov.in/",
    "Logo":
        "https://upload.wikimedia.org/wikipedia/en/thumb/9/95/CBSE_new_logo.svg/1200px-CBSE_new_logo.svg.png",
  },
  {
    "Name": "Passport Seva",
    "Url": "https://passportindia.gov.in/AppOnlineProject/welcomeLink",
    "Logo":
        "https://media.umangapp.in/app/ico/service/D_1551942848737passportlogomin.png",
  },
  {
    "Name": "Bharat Post",
    "Url": "https://www.indiapost.gov.in/vas/Pages/IndiaPostHome.aspx",
    "Logo": "https://logosdownload.com/logo/india-post-logo-big.png",
  },
];

List<Web> AllWebside = AllGovWebList.map((e) => Web.fromMap(data: e)).toList();
