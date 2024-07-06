FROM ubuntu:20.04

# Install basic packages
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    wget \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Android SDK
RUN mkdir /opt/android-sdk && cd /opt/android-sdk \
    && wget https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip \
    && unzip commandlinetools-linux-7583922_latest.zip \
    && rm commandlinetools-linux-7583922_latest.zip

ENV ANDROID_SDK_ROOT /opt/android-sdk

# Install essential Android SDK packages
RUN yes | $ANDROID_SDK_ROOT/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_SDK_ROOT \
    "platform-tools" \
    "platforms;android-30" \
    "build-tools;30.0.3"

# Set environment variables
ENV PATH $PATH:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/cmdline-tools/bin:$ANDROID_SDK_ROOT/tools/bin
