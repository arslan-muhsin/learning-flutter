# Learning Flutter

![Flutter logo](https://storage.googleapis.com/cms-storage-bucket/ec64036b4eacc9f3fd73.svg)

[Flutter](https://flutter.dev/) is is Google's UI toolkit for building beautiful, natively compiled applications for mobile, web, desktop, and embedded devices from a single codebase.

During the learning period, I benefited from several resources.

## Udemy Courses
- [The Complete 2021 Flutter Development Bootcamp with Dart](https://www.udemy.com/course/flutter-bootcamp-with-dart/)
- [Flutter & Dart - The Complete Guide [2021 Edition]](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/)

## Books
- Flutter Cookbook by Simone Alessandria and Brian Kayfitz (**ISBN-13:** 978-1838823382)

## Solutions For Some Issues
**Issue #1: Apple Silicon Pod Install**

If the device in your Flutter development environment is a Mac with an M1 (Apple Silicon) processor, you will most likely get an error when running pod install for iOS.

**Solution**

First of all, we need install the ffi by running the following command line in x64_86 architecture;

```
sudo arch -x86_64 gem install ffi
```

Afterwards, the ```pod install``` or ```pod install --repo-update``` commands are can be run by going to the ios directory in the hierarchy in our Flutter project.
