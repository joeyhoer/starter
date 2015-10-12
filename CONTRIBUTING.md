# How to contribute

In addition to global, system level preferences, there are tons of great apps for OS X which have configurable preferences stored in property list (plist) files, editable by the defaults command and other tools. So many, in fact, that it would be difficult for any one person to compile them all. That's why we're relying on your help. If there is a tool that you'd like to see represented, help us out by opening a pull request!

There are a few guidelines that we need contributors to follow to keep the project clean and maintainable. To ensure your pull request is accepted, please review the following guidelines.

## Comments

This project relies heavily on the use of comments. Without comments, `defaults` commands can easily become cryptic. Because of this, each command should be commented with a description of what the command affects and the possible values corresponding to each command. Generally this can be a duplicate of the GUI labels for each preference.

### Multiple options

All GUI selectible values should be represented in comments.

If the preference is a range input, it is acceptable to note the minimum and maximum values.

## Locating defaults

The most common location for defaults is `~/Library/Preferences`, thought they may also be found in `~/Library/Containers` and at other locations throughout the system.

__Note:__ `NSGlobalDomain` defaults are located in a `.GlobalPreferences.plist` file in the `~/Library/Preferences` directory.

One method of locating defaults is to navigate into the `~/Library/Preferences` directory on the command line, change the desired settings of an application, and run the following command:

    ls -1ta | head -8

This will return a list of plist files. Somewhere near the top of the list should be a plist file that corresponds to the application you are searching for. Stirpping the `.plist` extension from the filename will give the applications _domain_. To learn more about domains consult the `defaults` commannd's manual.

Once the applications domain has been acquired, run the following command to store the current defaults into a variable (where `$domain` is the application's domain):

    prev_defaults=$(defaults read $domain)

Next, change some settings within the application and run (again, where `$domain` is the application's domain):

    comm -13 <(echo "$prev_defaults") <(defaults read $domain)

This will return the current values of the settings you've changed.
