#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors
# Feel free to reuse and adapt this script for your own projects

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'student', 'doctor'."
  exit 1
fi

case $1 in

  student)
    flutterfire config \
      --project=grad-proj-fab75 \
      --out=lib/firebase_options_student.dart \
      --android-package-name=com.grad.zaguni \
      --android-out=android/app/src/student/google-services.json
    ;;
  doctor)
    flutterfire config \
      --project=grad-proj-doctor \
      --out=lib/firebase_options_doctor.dart \
      --android-package-name=com.grad.zaguni.doctor \
      --android-out=android/app/src/doctor/google-services.json
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'student', 'doctor'."
    exit 1
    ;;
esac