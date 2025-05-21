# Welcome to LIN-DOS 🚀

Hello there! If you’ve spent ages in the comfy realms of Windows command line and are now facing the intriguing world of Linux, LIN-DOS is here to save your day or at least make it a heck of a lot easier!

## Why LIN-DOS?

Imagine you've been speaking English all your life and suddenly you need to order your coffee in Martian (okay, not Martian, but you get the drift).
That’s what switching from Windows to Linux can feel like. Scary, right? LIN-DOS is like your personal translator from Windows CLI to Linux CLI. It’s here to make sure you don’t miss your command line coffee!

## What's Cooking?

This repo is just getting started, and we plan to keep adding more commands and features gradually.
It's a work in progress, and the goal is to make it as comprehensive and helpful as possible. Stay tuned for updates and feel free to contribute your expertise!
The current implementation is focused on supporting **Windows CMD functionality on Ubuntu**.

## 🧾 Available Commands

| **Windows Command** | **What It Does**                 | **Implementation** |
| ------------------- | -------------------------------- | ------------------ |
| `cls`               | Clear screen                     | Full               |
| `rd`                | Remove directory (if empty)      | Partial            |
| `tree`              | Display directory tree structure | Partial            |
| `copy con`          | Create file from console input   | Partial            |
| `ver`               | Display OS version               | Partial            |
| `type`              | Display contents of a file       | Partial            |
| `md`                | Make directory                   | Partial            |
| `cd`                | Change directory / print cwd     | Partial            |




## Get Started in No Time!

Ready to dive in? Here’s how to get LIN-DOS up and running:

```bash
tfolder=~/src/bmja62/lin-dos/
mkdir -p $tfolder
git clone git@github.com:bmja62/lin-dos.git $tfolder || echo
cd $tfolder
./SETUP.EXE
```

That’s it! You’re ready to rock and roll with your new, familiar commands.

## Join the Party!

Got an idea? A brilliant command translation that we missed? Jump in!

* **Fork it**: Got a fix or a feature? Fork the repo, dive in, and hit us up with that pull request.
* **Issue Tracker**: Found a bug? Got a suggestion? Drop it like it’s hot in our issue tracker.

## License

Feel free to use and spread LIN-DOS as you like! It’s all yours under the MIT License. Check out the [LICENSE](LICENSE) file for more info.

## Shoutouts

* Big thanks to all the brave souls switching from Windows to Linux. We salute you!
* Shoutout to the open-source community, couldn’t do it without you!
