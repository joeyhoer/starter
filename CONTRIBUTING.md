# How to contribute

In addition to global, system level preferences, there are tons of great apps for macOS which have configurable preferences stored in property list (plist) files, editable by the defaults command and other tools. So many, in fact, that it would be difficult for any one person to compile them all. That's why we're relying on your help. If there is a tool that you'd like to see represented, help us out by opening a pull request!

There are a few guidelines that we need contributors to follow to keep the project clean and maintainable. To ensure your pull request is accepted, please review the following guidelines.

## Comments

This project relies heavily on the use of comments. Without comments, `defaults` commands can easily become cryptic. Because of this, each command should be commented with a description of what the command affects and the possible values corresponding to each command. Generally this can be a duplicate of the GUI labels for each preference.

### Multiple options

All GUI selectable values should be represented in comments.

If the preference is a range input, it is acceptable to note the minimum and maximum values.

## Locating defaults

The most common location for defaults is `~/Library/Preferences`, thought they may also be found in `~/Library/Containers` and at other locations throughout the system.

__Note:__ `NSGlobalDomain` defaults are located in `~/Library/Preferences/.GlobalPreferences.plist`.

### Application Domains

An application _domain_, also called _bundle identifier_, is used by macOS to associate various settings to an application. Generally, there preference files are located in the `~/Library/Preferences` directory. You can determine an application's domain using the following shell function:

    bundleid() {
      # Accept multiple forms of input
      osascript -e "id of app \"$*\"" 2>/dev/null || /usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' "$1/Contents/Info.plist"
    }

__Note:__ To learn more about application domains consult the `defaults` command's manual.

Another method of locating defaults is to navigate into the `~/Library/Preferences` directory on the command line, change the desired settings of an application, and run the following command:

    ls -1ta | head -8

This will return a list of plist files. Stripping the `.plist` extension from the filename will give the application's domain.

Once the applications domain has been acquired, store the current defaults into a variable with (where `$domain` is the application's domain):

    prev_defaults=$(defaults read $domain)

Then, change a setting within the application and run (again, where `$domain` is the application's domain):

    comm -13 <(echo "$prev_defaults") <(defaults read $domain)

This will return the current values of the settings that were changed changed.

Some applications and services, like the System Preferences application, may write to a number of domains; locating these domains can be difficult. To find these domains, `opensnoop` may be used to monitor file access:

    # Monitor any '.plist' access
    sudo opensnoop | grep '.plist'
    # Monitor any '.plist' access in any 'Preferences' directory
    sudo opensnoop | egrep '/Preferences/.*\.plist'

The use of `opensnoop` may be restricted by System Integrity Protection (SIP); to disable SIP, boot into the Recovery Partition and run the following commands:

    csrutil disable
    csrutil enable --without dtrace

**Note:** This is recommended only for advanced users.
