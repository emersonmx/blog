---
title: "Difficulties in Building a Pygame Game for Android"
date: 2024-08-15T17:03:25-03:00
draft: true
---

Recently, I was taking an [Android][1] course and got the urge to port a game I
had made in [Python][2] to Android. It wasn't difficult to find articles on the
subject, but one common theme was that to run Python on Android, you needed
[Buildozer][3]. And so, my saga began.

I spent two days wrestling with Buildozer to generate an APK. On the first day,
I decided to create a simple example to test the build. After encountering
several errors, I realized it would be easier to run Buildozer in [Docker][4].
Luckily, there was already a Dockerfile in the Buildozer project for this
purpose. With a few adaptations, I had it up and running on my machine.

The next step was configuring Buildozer for the build, which led me to dive
deep into [Python for Android][4] (p4a). After spending a lot of time running
builds, reading documentation, and analyzing error logs, I concluded that it
would be better to create a p4a recipe for [pygame-ce][5] and see how it
worked.

In the end, the pygame-ce recipe worked, and the errors stopped. The next step
was to see if the generated APK would run on Android. So, I opened the Android
emulator, installed the APK, and... nothing. The game opened and then
immediately closed. Checking the [Logcat][7], I realized I needed to tweak the
Buildozer configuration to generate an APK for x86_64 and also set the correct
SDK version. After doing that, I reinstalled the APK, and the game finally
opened! 🤲

After all this struggle, I decided to [share the knowledge][8] I gained with
the Pygame community. However, I also concluded that it might not be worth
porting my Python game to Android 🙁.

[1]: https://developer.android.com/courses
[2]: https://www.python.org/
[3]: https://github.com/kivy/buildozer
[4]: https://www.docker.com/
[5]: https://github.com/kivy/python-for-android
[6]: https://pyga.me/
[7]: https://developer.android.com/tools/logcat
[8]: https://gist.github.com/emersonmx/c5bba202506e3c3d2d828ad278a8d5fe
