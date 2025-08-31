#!/bin/bash

# Thiết lập biến môi trường Android
export ANDROID_SDK_ROOT=/home/phuochuy/Android/Sdk
export ANDROID_HOME=/home/phuochuy/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools

# Khởi chạy emulator với cấu hình tối ưu
echo "🚀 Khởi chạy emulator Medium Phone API 36.0 với cấu hình tối ưu..."

$ANDROID_HOME/emulator/emulator \
  -avd Medium_Phone_API_36.0 \
  -gpu swiftshader_indirect \
  -no-audio \
  -no-boot-anim \
  -memory 3072 \
  -cores 4 \
  -netfast \
  -no-snapshot-save \
  -no-snapshot-load \
  -wipe-data \
  -verbose
