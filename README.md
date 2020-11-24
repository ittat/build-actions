# build-actions

If you often need to build android source code and find that disk space is limited or the Internet environment is too poor,  
if you are familiar with how to build android, build-android-actions can easily solve the problem.  

build-android-actions uses github-action and gdrive (enterprise edition) to reduce the burden on your machine and disk space.  
## WHAT YOU NEED

Only gdrive - enterprise

## Usage

- Click the [fork](https://github.com/ittat/build-actions/fork) to create a new repository.
- Add the secrets of `GIT_ACCESS_TOKEN` in your new repository.
- Add rclone.conf as the secrets `RCLONE` to new repository and set gdrive's name as `itd`. For example：
   ```
   [itd]
   type = drive
   client_id = ...
   client_secret = ...
   scope = drive
   token = {"access_token":"...","token_type":"...","refresh_token":"...","expiry":"..."}
   team_drive = ...
   ```
- Open `./android/source/fix_soucre.sh`  
   Add relevant local_manifest about your target. For example:
   ```
   ## I want to build phh's gsi ROM so add relevant local_manifests
   git clone https://github.com/phhusson/treble_manifest .repo/local_manifests  -b android-10.0
   repo sync -c -j18 --force-sync --no-tags --no-clone-bundle
   ```
- Open `.github/workflows/template_config.yml`
   1. Add device_name: eg: `onyx`(oneplu x), `bacon`(oneplus one), `phhgsi_arm64_a`(phh's gsi) etc.
   2. Add build_device_tag: eg: `full-onyx-eng`, `full-bacon-userdebug` etc.
   3. Add repo_dispatches: `https://api.github.com/repos/(your-github-name)/(your-repo-name)/dispatches`
   4. Add android_source: remote soucre `"https://android.googlesource.com/platform/manifest"`
   5. Add android_branch: `"android-10.0.0_r41"`  
  For example：
   ```
   env:
     device_name: phhgsi_arm64_a
     build_device_tag: treble_arm64_avN-userdebug
     repo_dispatches: "https://api.github.com/repos/ittat/build-actions/dispatches"
     android_source: "https://android.googlesource.com/platform/manifest"
     android_branch: "android-10.0.0_r41"
   ```  
   NOTE: If everything done, Clike `actions`-`template_config`-`run workflow` to tagger flow.


## Qusetions?
#### 1. Why select macos environment nor ubuntu?  
   Because the limited disk space in ubuntu that can't repo back all sources you need.  
   
#### 2. Why need gdrive and enterprise edition?
   Github Actions only get each job for 360 min which naturally can't achieve source in time (Android10).
   So I want to use a huge storage(more than 150G and gdrive enterprise edition is perfect) to save all source temporarily after each jobs. 
   
#### 3. Why need GIT_ACCESS_TOKEN?
   Start a new job after timeout

#### 4. Have other options can replace it without gdrive?
   No, now. I will try to do it(Github-Actions-Artifacts? onedrive? and other what you tell me possible?)
