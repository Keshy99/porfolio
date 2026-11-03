import 'models/project.dart';

const _mobile = [ProjectPlatform.android, ProjectPlatform.ios];

List<String> _images(String folder, List<String> files) => [for (final f in files) 'assets/$folder/$f'];

/// Shown on the projects page in this order; the first three are featured on the home page.
final List<Project> projects = [
  Project(
    id: 'excelmindit',
    title: 'ExcelMindIT',
    description:
        'A SIWES (industrial training) management app for students. Students can find placements with companies verified by their institution, apply in a tap and get matched with companies looking for their course. It includes a daily logbook that works offline and syncs when back online with PDF export, plus a checklist that tracks every required form (SCAF, ITF Form 8) and notifications for placement offers.',
    images: _images('excelmindit', ['1.jpg', '2.jpg', '3.jpg', '4.jpg', '5.jpg', '6.jpg', '7.jpg']),
    link: 'https://play.google.com/store/apps/details?id=com.excelmindit.app',
    platforms: _mobile,
  ),
  Project(
    id: 'herssa',
    title: 'Herssa',
    description:
        'A real time Travel AI application where you can book flights and hotels both local and international by chatting with the AI bot, it books the flights and hotels for you based on your preferences. It also has other interesting features like language translation, live interactive voice sessions with the bot and many more.',
    images: _images('herssa', ['h.jpg', 'add.jpg', 'add2.jpg', 'add3.jpg', 'add4.jpg', 'add5.jpg', 'add6.jpg']),
    link: 'https://play.google.com/store/apps/details?id=com.hermextravels.herssa',
    platforms: _mobile,
  ),
  Project(
    id: 'hermex-travels',
    title: 'Hermex Travels',
    description:
        'A real time Travel application where you can book flights and hotels both local and international, with other interesting features.',
    images: _images('hermex', [for (var i = 1; i <= 14; i++) 'ss$i.png']),
    link: 'https://play.google.com/store/apps/details?id=com.hermex.hermex_travels',
    platforms: _mobile,
  ),
  Project(
    id: 'excel-mind',
    title: 'Excel Mind',
    description:
        'An Ed-Tech platform that delivers educational and learning solutions to school operations. It provides a platform for students, teachers, and parents to interact and manage academic activities effectively.',
    images: _images('excelmind', ['excel.png']),
    link: 'https://play.google.com/store/apps/details?id=com.avancier.excelminds.excel_minds',
    platforms: _mobile,
  ),
  Project(
    id: 'golden-credit',
    title: 'Golden Credit',
    description: 'A Fintech platform for sending and receiving money, and paying for every bill in real time.',
    images: _images('sdd', ['sdd.png']),
    link: 'https://play.google.com/store/apps/details?id=com.goldencredit.ng',
    platforms: _mobile,
  ),
  Project(
    id: 'blott',
    title: 'Blott',
    description:
        'A real time news application that fetches live streams from a database source, and when any news is clicked on the app it navigates to the news feed on chrome (or any default browser) where all the details are displayed. This was achieved by using a library called URL LAUNCHER.',
    images: _images('blott', ['1.jpg', '2.jpg', '3.jpg', '4.jpg', '5.jpg', '6.jpg', '7.jpg']),
    link:
        'https://firebasestorage.googleapis.com/v0/b/general-stuff-e3630.appspot.com/o/blott.zip?alt=media&token=61a80b01-194f-45f1-b828-ad325cc834f8',
    platforms: _mobile,
  ),
  Project(
    id: 'cardza',
    title: 'Cardza',
    description:
        'A real time gift card trading platform where users can trade their gift cards. Comes with an Admin panel. It was built with Flutter and Firebase as the backend.',
    images: _images('cardza', [for (var i = 1; i <= 11; i++) '$i.jpg']),
    link:
        'https://firebasestorage.googleapis.com/v0/b/general-stuff-e3630.appspot.com/o/cardZa.zip?alt=media&token=7aec28eb-9325-4df7-a310-96b10d550edb',
    platforms: _mobile,
  ),
  Project(
    id: 'k-chat',
    title: 'K Chat',
    description:
        'A real time chatting application that allows sending messages and images, with some basic features like OTP verification and reset password amongst others. It was built with Flutter and Firebase as the backend.',
    images: _images('chatapp', [
      '3.jpg', '4.jpg', '5.jpg', '1.jpg', '9.jpg', '13.jpg', '10.jpg', '7.jpg', //
      '8.jpg', '6.jpg', '2.jpg', '17.jpg', '14.jpg', '12.jpg', '11.jpg',
    ]),
    link:
        'https://firebasestorage.googleapis.com/v0/b/general-stuff-e3630.appspot.com/o/app-release.zip?alt=media&token=27c4ae12-48a5-4d52-8b07-6c0f7310c0c7',
    platforms: _mobile,
  ),
  Project(
    id: 'ticket-app',
    title: 'Ticket App',
    description:
        'This project is a basic user interface of a flight ticket booking application with hotel preview and bookings.',
    images: _images('ticketapp', ['2.jpg', '1.jpg', '3.jpg', '4.jpg', '5.jpg', '8.jpg', '6.jpg', '7.jpg']),
    link:
        'https://firebasestorage.googleapis.com/v0/b/general-stuff-e3630.appspot.com/o/ticketapp.zip?alt=media&token=a9f73c90-fef9-4b8b-8bbe-d600d31e1c2d',
    platforms: _mobile,
  ),
  Project(
    id: 'cookery-e-book',
    title: 'Cookery E-Book',
    description: 'A cookery E-book application.',
    images: _images('meals', ['1.jpg', '2.jpg', '3.jpg', '4.jpg', '5.jpg']),
    link:
        'https://firebasestorage.googleapis.com/v0/b/general-stuff-e3630.appspot.com/o/meals.zip?alt=media&token=2778702c-e735-4545-b820-838f219f3d5c',
    platforms: _mobile,
  ),
  Project(
    id: 'stripe-payment-gateway',
    title: 'Stripe Payment Gateway',
    description: 'A real time functioning implementation of Stripe payment gateway.',
    images: _images('stripe', ['1.jpg']),
    link:
        'https://firebasestorage.googleapis.com/v0/b/general-stuff-e3630.appspot.com/o/stripe.zip?alt=media&token=4dd26790-0502-42f3-8eb7-b2d4aad5e6e4',
    platforms: _mobile,
  ),
  Project(
    id: 'expense-tracker',
    title: 'Expense Tracker',
    description: 'This application keeps record of your budget for you to monitor your spendings.',
    images: _images('expensetracker', ['1.jpg', '2.jpg']),
    link:
        'https://firebasestorage.googleapis.com/v0/b/general-stuff-e3630.appspot.com/o/expense%20tracker.zip?alt=media&token=de1ccf06-a412-4940-a691-53b2c276ef77',
    platforms: [ProjectPlatform.web, ..._mobile],
  ),
];

Project? findProject(String id) {
  for (final p in projects) {
    if (p.id == id) return p;
  }
  return null;
}
