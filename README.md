# build-android-actions
if you need build android source and found that your disk are limited or the internet environment sooo bad,

if you profit how to build android, build-android-actions can easly to resolve it.

build-android-actions use github actions and gdrive (enterprise) to afford your machine and disk-space pressure.

## WHAT YOUR NEED  

   only gdrive - enterprise

## Usage
- Click the [Use this template](https://github.com/ /generate) button to create a new repository.
- Add the secrets of GIT_ACCESS_TOKEN in your new repository.
- Add rclone.conf as the secrets RCLONE to new repository.
- Open .github/workflows/template_config.yml
- Add device_name eg；`onyx`(oneplu x), `bacon`(oneplus one), `phhgsi_arm64_a`(phh's gsi) etc.
- Add build_device_tag: eg: `full-onyx-eng`, `full-bacon-userdebug` etc.
- Add repo_dispatches: `https://api.github.com/repos/(you id)/(you repo name)/dispatches`
- Add android_source: remote soucre address `"https://android.googlesource.com/platform/manifest -b android-10.0.0_r41"`
          
## for example:
```
env:
  device_name: phhgsi_arm64_a
  build_device_tag: treble_arm64_avN-userdebug
  repo_dispatches: "https://api.github.com/repos/ittat-store/build-android-actions/dispatches"
  android_source: "https://android.googlesource.com/platform/manifest -b android-10.0.0_r41"
```
