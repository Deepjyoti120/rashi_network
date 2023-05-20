class AstrologerModel {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? isVerifyMobile;
  String? roleType;
  int? loginstatus;
  String? createdAt;
  String? updatedAt;
  String? gender;
  int? astrologerId;
  String? photo;
  String? dob;
  String? experience;
  String? categories;
  String? language;
  String? call;
  String? chat;
  String? callPrice;
  String? availableCall;
  String? isBusy;
  String? availableChat;
  String? isRecommended;
  String? isOnboard;
  String? accountNumber;
  String? ifsc;
  String? adharCard;
  String? panCard;
  String? longbio;

  AstrologerModel({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.isVerifyMobile,
    this.roleType,
    this.loginstatus,
    this.createdAt,
    this.updatedAt,
    this.gender,
    this.astrologerId,
    this.photo,
    this.dob,
    this.experience,
    this.categories,
    this.language,
    this.call,
    this.chat,
    this.callPrice,
    this.availableCall,
    this.isBusy,
    this.availableChat,
    this.isRecommended,
    this.isOnboard,
    this.accountNumber,
    this.ifsc,
    this.adharCard,
    this.panCard,
    this.longbio,
  });

  AstrologerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    isVerifyMobile = json['is_verify_mobile'];
    roleType = json['role_type'];
    loginstatus = json['loginstatus'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    gender = json['gender'];
    astrologerId = json['astrologer_id'];
    photo = json['photo'];
    dob = json['dob'];
    experience = json['experience'];
    categories = json['categories'];
    language = json['language'];
    call = json['call'];
    chat = json['chat'];
    callPrice = json['call_price'];
    availableCall = json['available_call'];
    isBusy = json['is_busy'];
    availableChat = json['available_chat'];
    isRecommended = json['is_recommended'];
    isOnboard = json['is_onboard'];
    accountNumber = json['account_number'];
    ifsc = json['ifsc'];
    adharCard = json['adhar_card'];
    panCard = json['pan_card'];
    longbio = json['long_bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['is_verify_mobile'] = isVerifyMobile;
    data['role_type'] = roleType;
    data['loginstatus'] = loginstatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['gender'] = gender;
    data['astrologer_id'] = astrologerId;
    data['photo'] = photo;
    data['dob'] = dob;
    data['experience'] = experience;
    data['categories'] = categories;
    data['language'] = language;
    data['call'] = call;
    data['chat'] = chat;
    data['call_price'] = callPrice;
    data['available_call'] = availableCall;
    data['is_busy'] = isBusy;
    data['available_chat'] = availableChat;
    data['is_recommended'] = isRecommended;
    data['is_onboard'] = isOnboard;
    data['account_number'] = accountNumber;
    data['ifsc'] = ifsc;
    data['adhar_card'] = adharCard;
    data['pan_card'] = panCard;
    data['long_bio'] = longbio;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}


// {
//     "status": true,
//     "data": {
//         "category": [
//             {
//                 "id": 2,
//                 "cat_name": "Vedic Astrology",
//                 "slug": "vedic-astrology",
//                 "description": "Jyotisha or Jyotishya is the traditional Hindu system of astrology, also known as Hindu astrology, Indian astrology and more recently Vedic astrology.",
//                 "image": "1674723172.png",
//                 "status": 1,
//                 "created_at": "2023-01-25T21:52:52.000000Z",
//                 "updated_at": "2023-01-25T21:52:52.000000Z"
//             }
//         ],
//         "languages": [
//             {
//                 "id": 1,
//                 "language_name": "English",
//                 "status": 1,
//                 "created_at": "2023-01-28T23:44:18.000000Z",
//                 "updated_at": "2023-01-28T23:44:18.000000Z"
//             }
//         ],
//         "astrologer": {
//             "current_page": 1,
//             "data": [
//                 {
//                     "id": 49,
//                     "name": "Astro Shivaa",
//                     "email": "shivaastrologer111@gmail.com",
//                     "mobile": "9670812431",
//                     "is_verify_mobile": "0",
//                     "role_type": "astrologer",
//                     "loginstatus": 1,
//                     "created_at": "2023-03-02 01:46:17",
//                     "updated_at": "2023-04-19 17:51:03",
//                     "gender": "Male",
//                     "astrologer_id": 56,
//                     "photo": "1678760031.jpg",
//                     "dob": "2023-03-01",
//                     "experience": "10",
//                     "categories": "2",
//                     "language": "1,2",
//                     "call": "Yes",
//                     "chat": "Yes",
//                     "call_price": "25",
//                     "available_call": "Yes",
//                     "is_busy": "no",
//                     "available_chat": "Yes",
//                     "is_recommended": "0",
//                     "is_onboard": "1",
//                     "account_number": "33298505847.00",
//                     "ifsc": "SBIN0006219",
//                     "adhar_card": "708560703879.00",
//                     "pan_card": "FECPS6070B"
//                 }
//             ],
//             "first_page_url": "https://www.thetaramandal.com/api/chat-with-astrologer?page=1",
//             "from": 1,
//             "last_page": 1,
//             "last_page_url": "https://www.thetaramandal.com/api/chat-with-astrologer?page=1",
//             "links": [
//                 {
//                     "url": "https://www.thetaramandal.com/api/chat-with-astrologer?page=1",
//                     "label": "1",
//                     "active": true
//                 }
//             ],
//             "path": "https://www.thetaramandal.com/api/chat-with-astrologer",
//             "per_page": 100000,
//             "to": 77,
//             "total": 77
//         },
//         "press_ress": [
//             {
//                 "id": 27,
//                 "heading": ".",
//                 "subheading": ".",
//                 "hreflink": "https://dailymailexpress.in/meet-ria-bhardwaj-and-mahendra-bhardwaj-brain-behind-the-taramandal-an-astrology-app-connecting-you-with-genuine-and-verified-astrologers-24x7/",
//                 "desktopimg": "1682775417.png",
//                 "mobileimg": "1682775417.png",
//                 "banner_type": "2",
//                 "status": 1,
//                 "created_at": "2023-03-11T08:39:12.000000Z",
//                 "updated_at": "2023-04-29T13:36:57.000000Z"
//             }
//         ],
//         "blog": [
//             {
//                 "id": 17,
//                 "user_id": 3,
//                 "title": "Financial Horoscope for Sagittarius 2023",
//                 "slug": "financial-horoscope-for-sagittarius-2023",
//                 "image": "1683364763.png",
//                 "body": "<p>\r\n\r\n<b></b></p><p></p><p>As a Sagittarius, you are known for your optimism, adventurous spirit, and love for travel. However, when it comes to finances, you may have had some ups and downs in the past. This is where astrology comes in handy. Your financial horoscope for 2023 can give you insight into what the stars have in store for you in terms of money and investments. In this article, we will explore the financial horoscope for Sagittarius 2023, including predictions for career, income, and investments.</p><p><br></p><p><b>Introduction</b></p><p><br></p><p>If you're a Sagittarius, you are probably familiar with your zodiac sign's strengths and weaknesses. However, you may not have considered how your astrological sign affects your finances. The year 2023 is predicted to be an exciting year for Sagittarius when it comes to money matters. According to astrologers, there will be many opportunities for growth and success in your career and financial life.</p><p><br></p><h1>Career</h1><p><br></p><p>Your career is expected to take off in 2023. You will be motivated to take on new challenges and make a name for yourself. Your hard work and dedication will pay off, and you will receive recognition and praise for your efforts. This could lead to a promotion or a new job offer that comes with a higher salary. However, don't let success get to your head, and stay humble and grounded to maintain long-term success.</p><h2>Income</h2><p><br></p><p>In 2023, your income will increase, thanks to your hard work and dedication. You may receive a raise or bonus, or you may be offered a higher-paying job. However, you should be careful not to overspend or indulge in unnecessary luxuries. Instead, focus on building your savings and investing in your future.</p><p><br></p><h3>Investments</h3><p>The stars are aligning for Sagittarius when it comes to investments in 2023. You will be presented with many opportunities to invest in stocks, real estate, or other assets that have the potential for high returns. However, be sure to do your due diligence and research thoroughly before making any investment decisions. It's also essential to diversify your investments and not put all your eggs in one basket.<br></p><h2><br></h2><h2>Financial Planning</h2><p><br></p><p>To make the most of the opportunities that come your way in 2023, it's essential to have a solid financial plan in place. This includes setting financial goals, creating a budget, and tracking your expenses. By doing so, you can avoid overspending, save money for emergencies, and invest in your future. Consider consulting with a financial advisor to help you develop a personalized financial plan that works for you.</p><h3><br></h3><h3>Risks and Challenges</h3><p><br></p><p>While the stars may be in your favor in 2023, there are always risks and challenges when it comes to finances. It's essential to be aware of these and take steps to mitigate them. For example, you may face unexpected expenses or market fluctuations that could affect your investments. Be sure to have an emergency fund and a diversified investment portfolio to help protect yourself against these risks.</p><p><br></p><h4>Conclusion</h4><p><br></p><p>In conclusion, 2023 is predicted to be a year of growth and success for Sagittarius when it comes to finances. Your hard work and dedication will pay off, and you will have many opportunities for career advancement and financial success. However, it's important to stay grounded, have a solid financial plan in place, and be prepared for any risks or challenges that may come your way.</p><h4><br></h4><h4>FAQs</h4><p><br></p><p>1. Will I receive a promotion in 2023?</p><p>&nbsp; &nbsp; - There is a good chance you will receive a promotion or job offer in 2023.</p><p>2. Is it a good time to invest in the stock market?</p><p>&nbsp; &nbsp;- According to astrologers, 2023 is a good time for investments, but it's essential to do your research and diversify your portfolio.</p><p>3. How can I create a financial plan?</p><p>&nbsp; &nbsp;- Creating a financial plan involves setting goals, creating a budget, and tracking expenses. Consider consulting with a financial advisor for personalized advice.</p><p>4. What should I do if I face unexpected expenses?</p><p>&nbsp; &nbsp;- It's essential to have an emergency fund to cover unexpected expenses. Consider creating a budget and cutting back on non-essential expenses to build up your savings.</p><p>5. How can I mitigate investment risks?</p><p>&nbsp; &nbsp;- Diversify your investment portfolio, do your research, and be prepared for market fluctuations. Consider consulting with a financial advisor for personalized advice.</p><p><br></p><p>In summary, 2023 is a promising year for Sagittarius when it comes to finances. With hard work and dedication, you can achieve success in your career and increase your income. However, it's essential to have a solid financial plan in place and be prepared for any risks or challenges that may arise. By staying grounded, following your intuition, and taking calculated risks, you can make the most of the opportunities that come your way. </p><br>\r\n\r\n<br><p></p>",
//                 "view_count": 43,
//                 "status": 1,
//                 "is_approved": 1,
//                 "type_post": "blog",
//                 "created_at": "2023-05-06T09:19:23.000000Z",
//                 "updated_at": "2023-05-16T15:38:37.000000Z"
//             }
//         ],
//         "faq": {
//             "current_page": 1,
//             "data": [
//                 {
//                     "id": 4,
//                     "question": "How does Taramandal work?",
//                     "answer": "<p><b></b></p><p><b></b></p><b><p></p></b><p>Our professional Vedic Astrologers, Tarot Readers, Numerologists, and Vastu Experts have been hand-picked to help you get familiar with the interconnection of stars and your zodiac sign. Taramandal provides a comprehensive report on your life. The accuracy and clarity of all predictions are based on the terrestrial events in your life and we can identify the causes and come up with quick solutions for you. Seek spiritual guidance from our astrologers to discover a new pathway to a healthy and wealthy life. This app promises to dispel myths about astrology and astrological practices and may provide some answers to this centuries-old hotly debated question.</p><br><br><p></p>",
//                     "created_at": "2023-03-04T08:02:25.000000Z",
//                     "updated_at": "2023-03-28T01:02:15.000000Z"
//                 },
//                 {
//                     "id": 9,
//                     "question": "Why Should You opt for Taramandal to get your horoscope?",
//                     "answer": "You get to talk personally with our astrologers via call and chat. There is a Numero Report where you need to fill in your birth date and time to get a detailed astrology birth chart. Vastu Shastra will help you with stability. We've got Healing crystals, Gemstones, and ceremonial items to perform your rituals. With free consultation for first-time users and Premium consultation on your life with beneficial services 24/7 Live chat and call with our Astrologers Buy Healing Crystals, Gemstones, Rudraksha, and Conch to perform rituals <br>Tarot Card Reading <br>Feng shui Free online Kundali Making <br>Monthly Numerology Predictions <br>Numero Report <br>Vastu Shastra",
//                     "created_at": "2023-03-11T08:45:39.000000Z",
//                     "updated_at": "2023-04-02T04:01:17.000000Z"
//                 },
//                 {
//                     "id": 10,
//                     "question": "Is Astrology Prediction by Taramandal True?",
//                     "answer": "<p><b></b></p><p><b></b><b></b>All astrologers available on Taramandal have years of experience in Vedic astrology, Jyotish Vigyanam, and Tarot. Not only are they qualified to predict your life but also guide you in every step of the healing process. There are many situations that every person is tackling right now. The financial crisis, longing for a partner, failed attempts for childbirth, Property dispute, personal issues between couples, and other issues can be solved here with the consultation of our astrologers. Free Kundli making premium call and chat benefits are available on this app. <b></b></p><br><br><p></p>",
//                     "created_at": "2023-03-11T08:46:01.000000Z",
//                     "updated_at": "2023-03-28T01:05:54.000000Z"
//                 },
//                 {
//                     "id": 11,
//                     "question": "Can I trust the reliability of Taramandal?",
//                     "answer": "From easy user access to direct chat and call with all astrologers available on Taramandal have years of experience in Vedic astrology, Jyotish Vigyanam, and Tarot. Not only are they qualified to predict your life but also guide you in every step of the healing process. You will be able to get various benefits of our premium consultation services which include: <br>24/7 Live chat and call with our Astrologers <br>Buy Healing Crystals, Gemstones, Rudraksha, and Conch to perform rituals <br>Tarot Card Reading <br>Feng shui <br>Free online Kundali Making <br>Monthly Numerology Predictions <br>Numero Report <br>Vastu Shastra",
//                     "created_at": "2023-03-11T08:46:29.000000Z",
//                     "updated_at": "2023-04-02T04:02:42.000000Z"
//                 },
//                 {
//                     "id": 12,
//                     "question": "Are Taramandal services budget-friendly or its cost is determined?",
//                     "answer": "<p><b></b></p><p><b></b>To use our app, you just have to fill in required details and ask whatever you want. From Rs.3 per minute to Rs.35, the astrological consultation services vary person to person. Every user will have a different type of query about his life and how much he wants to talk and know about it. This is why our services are flexible to meet the demands of every user. For an hour's talk, you can even go for premium options to get benefits with our services. Both astrologers and users have advantages on Taramandal. This app provides direct user access to the best astrologers with immense experience to meet your requirements. </p><b><br></b><br><p></p>",
//                     "created_at": "2023-03-11T08:46:54.000000Z",
//                     "updated_at": "2023-03-28T01:10:12.000000Z"
//                 }
//             ],
//             "first_page_url": "https://www.thetaramandal.com/api/chat-with-astrologer?page=1",
//             "from": 1,
//             "last_page": 2,
//             "last_page_url": "https://www.thetaramandal.com/api/chat-with-astrologer?page=2",
//             "links": [
//                 {
//                     "url": "https://www.thetaramandal.com/api/chat-with-astrologer?page=2",
//                     "label": "2",
//                     "active": false
//                 }
//             ],
//             "next_page_url": "https://www.thetaramandal.com/api/chat-with-astrologer?page=2",
//             "path": "https://www.thetaramandal.com/api/chat-with-astrologer",
//             "per_page": 5,
//             "to": 5,
//             "total": 8
//         },
//         "news": {
//             "current_page": 1,
//             "data": [
//                 {
//                     "id": 1,
//                     "heading": "Monthly Numerology Predictions for February 2023",
//                     "slug": "monthly-numerology-predictions-for-february-2023",
//                     "image": "1674990364.jpg",
//                     "miniimage": "1674990364.jpg",
//                     "subtext": "Numerology depends on the person’s name and birth date and significantly influences their characteristics, abilities, limitations, and emotional responses.",
//                     "description": "<p>\r\n\r\n</p><p>Numerology depends on the person’s name and birth date and significantly influences their characteristics, abilities, limitations, and emotional responses. It is intriguing to learn about the life path number, which acts as a characteristic that helps in the Numerology predictions for February 2023 and helps you understand how your entire month will be. </p><h2>Number 1 February horoscope</h2><p>For people with Number 1 in February, you need to have a strong sense of independence and the motivation to get a lot done. Moreover, you must perceive life as a straightforward road devoid of complicated feelings and abstract ideas. Moreover, the Numerology monthly prediction foretells that while accomplishing your goals, there might be some difficulties, but if you put forth your best effort, the results can exceed your hopes.</p>\r\n\r\n<br><p></p>",
//                     "created_at": "2023-01-29T00:06:04.000000Z",
//                     "updated_at": "2023-01-29T00:06:04.000000Z"
//                 }
//             ],
//             "first_page_url": "https://www.thetaramandal.com/api/chat-with-astrologer?page=1",
//             "from": 1,
//             "last_page": 1,
//             "last_page_url": "https://www.thetaramandal.com/api/chat-with-astrologer?page=1",
//             "links": [
//                 {
//                     "url": "https://www.thetaramandal.com/api/chat-with-astrologer?page=1",
//                     "label": "1",
//                     "active": true
//                 }
//             ],
//             "path": "https://www.thetaramandal.com/api/chat-with-astrologer",
//             "per_page": 4,
//             "to": 1,
//             "total": 1
//         }
//     }
// }
