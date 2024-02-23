# ThirdPartySDKScan

The very simple SDK scan on comparing string in the your Podfile.lock. This scan will show if your project using some SKD that require a privacy manifest and signature by Apple.

### How to use

`sh scan-pods ./ScanPodsExample`

### Output

`Found potentially required reason API usage 'FirebaseCore' in './Podfile.lock'`

![Screenshot 2024-02-23 at 10 37 24](https://github.com/didisouzacosta/ThirdPartySDKScan/assets/11352503/2f2cdbbd-ac13-4af0-a994-63afe2ef50c5)

### Special Thanks

An special thanks for [https://github.com/Wooder](https://github.com/Wooder) for the creating the main inpiration for this project.
Wooder to creating a special project for scan and seaching requiriment reason API inside your project, you can see more in [https://github.com/Wooder/ios_17_required_reason_api_scanner](https://github.com/Wooder/ios_17_required_reason_api_scanner)

### Workflow

- [x] Scan pods
- [ ] Scan carthage
- [ ] Scan SPM
- [ ] Check if SDK contains privacy manifest and signature
