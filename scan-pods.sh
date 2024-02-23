#!/bin/bash

# Global variable for search third party SDK`s
# taken from here: https://developer.apple.com/support/third-party-SDK-requirements/
search_string=(#"Abseil"
                "AFNetworking"
                "Alamofire
                "AppAuth
                "BoringSSL / openssl_grpc"
                "Capacitor"
                "Charts"
                "connectivity_plus"
                "Cordova"
                "device_info_plus"
                "DKImagePickerController"
                "DKPhotoGallery"
                "FBAEMKit"
                "FBLPromises"
                "FBSDKCoreKit"
                "FBSDKCoreKit_Basics"
                "FBSDKLoginKit"
                "FBSDKShareKit"
                "file_picker"
                "FirebaseABTesting"
                "FirebaseAuth"
                "FirebaseCore"
                "FirebaseCoreDiagnostics"
                "FirebaseCoreExtension"
                "FirebaseCoreInternal"
                "FirebaseCrashlytics"
                "FirebaseDynamicLinks"
                "FirebaseFirestore"
                "FirebaseInstallations"
                "FirebaseMessaging"
                "FirebaseRemoteConfig"
                "Flutter"
                "flutter_inappwebview"
                "flutter_local_notifications"
                "fluttertoast"
                "FMDB"
                "geolocator_apple"
                "GoogleDataTransport"
                "GoogleSignIn"
                "GoogleToolboxForMac"
                "GoogleUtilities"
                "grpcpp"
                "GTMAppAuth"
                "GTMSessionFetcher"
                "hermes"
                "image_picker_ios"
                "IQKeyboardManager"
                "IQKeyboardManagerSwift"
                "Kingfisher"
                "leveldb"
                "Lottie"
                "MBProgressHUD"
                "nanopb"
                "OneSignal"
                "OneSignalCore"
                "OneSignalExtension"
                "OneSignalOutcomes"
                "OpenSSL"
                "OrderedSet"
                "package_info"
                "package_info_plus"
                "path_provider"
                "path_provider_ios"
                "Promises"
                "Protobuf"
                "Reachability"
                "RealmSwift"
                "RxCocoa"
                "RxRelay"
                "RxSwift"
                "SDWebImage"
                "share_plus"
                "shared_preferences_ios"
                "SnapKit"
                "sqflite"
                "Starscream"
                "SVProgressHUD"
                "SwiftyGif"
                "SwiftyJSON"
                "Toast"
                "UnityFramework"
                "url_launcher"
                "url_launcher_ios"
                "video_player_avfoundation"
                "wakelock"
                "webview_flutter_wkwebview"
               )

scanPods() {
    local dir="$1"

    echo ""
    echo "## STEP 1 - Scan Pods ##"
    echo ""

    cd $dir

    # Install pods
    pod install

    # Podfile.lock path
    file="./Podfile.lock"

    # Loop through each search string
    for string in "${search_string[@]}"; do
        lines=$(grep -n "$string" "$file" | cut -d ":" -f 1)
        if [ -n "$lines" ]; then
            echo ""
            echo "⚠️ Found potentially required reason API usage '$string' in '$file'"
            one_line_string=$(echo "$lines" | tr '\n' ' ')
            echo "Line numbers: $one_line_string"
        fi
    done
}

scan() {
    local dir="$1"
    
    scanPods $dir
}

# Check if a directory path is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <directory-path>"
    exit 1
fi

echo "Searching third party SDKs that need to be update"
echo "See https://developer.apple.com/support/third-party-SDK-requirements/"

# Start the search
scan $1