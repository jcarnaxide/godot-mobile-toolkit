# godot-mobile-toolkit
Godot Plugin for mobile development, supports Android and iOS

## AI Assistance
I have been working with Claude quite a bit to get this project up and running. It is possible there may be some mistakes in here, but I am taking my time to walk through each piece and make sure things are tested and function before proceeding.

## Android Devlopment

### Java Installation
Make sure you have Java installed on your PC (version 11 or newer is recommended)
``` bash
java -version
```

### Android Studio Installation
Make sure you have a relatively recent version of Android Studio Installed on your Machine. This should include the Android SDK. After installing, you will want to verify that your ANDROID_HOME environment variable is properly setup. You can verify this by launching a cmd prompt and typing:
``` bash
echo %ANDROID_HOME%
```
If this yields empty result, you will want to get this added to your windows Environment Variables. You want to point this variable to your installation of Android SDK. You can figure out where this installed via the Android Studio settings. Navgiate to the window below and add the `ANDROID_HOME` environment variable there.
```
This PC -> Properties -> Advanced System Settings -> Environment Variables -> System Variables
```
Once you have finished this, it will be convenient to add platform-tools to your System Path as well. In the same Environment Variables Window, edit your System Path Environment Variable. Add `%ANDROID_HOME%\platform-tools` to it. You can test out both of these changes by running the following:
``` bash
# Check ANDROID_HOME
echo %ANDROID_HOME%

# Check if adb (Android Debug Bridge) is accessible
adb --version
```

### Setup gradle
First off, I didn't even have gradle installed, so I had to get that done. I did it via Choclatey, which also was not installed.

Install Choclately in an Admin Powershell
``` bash
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Restart your powershell, then:
``` bash
choco install gradle
```