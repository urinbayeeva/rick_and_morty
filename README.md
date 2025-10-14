# medion


build runner:
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter packages pub run build_runner watch --delete-conflicting-outputs


build ios:
flutter build ios --flavor prod --dart-define=FLAVOR=prod --target lib/main.dart
flutter build ios --flavor beta --dart-define=FLAVOR=beta --target lib/main_beta.dart
flutter build ios --flavor dev --dart-define=FLAVOR=dev --target lib/main_dev.dart

build android:
flutter build apk --flavor prod -t lib/main.dart
flutter build apk --flavor beta -t lib/main_beta.dart
flutter build apk --flavor dev -t lib/main_dev.dart


build android bundle:
flutter build appbundle --flavor prod -t lib/main.dart
flutter build appbundle --flavor beta -t lib/main_beta.dart
flutter build appbundle --flavor dev -t lib/main_dev.dart

generate_launcher_icon:
flutter pub run flutter_launcher_icons:main -f dev
flutter pub run flutter_launcher_icons:main -f prod
flutter pub run flutter_launcher_icons:main -f beta

generate_splash_icon:
dart run flutter_native_splash:create


show bottomnavbar
   context.read<BottomNavBarController>().changeNavBar(false);

hide bottomnavbar
   context.read<BottomNavBarController>().changeNavBar(true);


testflight
  flutter build ipa --build-name=1.0.1 --build-number=2 --release# rick_and_morty
