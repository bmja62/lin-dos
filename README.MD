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
| `date`              | Display current date             | Partial            |
| `time`              | Display current time             | Partial            |




## Installation (APT/Debian Package)

LIN-DOS is now packaged for Debian/Ubuntu systems.

Build a `.deb` package from source:

```bash
sudo apt update
sudo apt install -y build-essential devscripts debhelper
dpkg-buildpackage -us -uc
```

Install the generated package:

```bash
sudo apt install ../lin-dos_0.1.0-1_all.deb
```

After installation, open a new shell session (or run `source /etc/profile.d/lin-dos.sh`)
to load LIN-DOS commands.

## APT Publish Pipeline

This repository includes a GitHub Actions pipeline at `.github/workflows/publish-apt.yml`
that builds and publishes an APT repository to the `gh-pages` branch.

Trigger options:

- push a tag like `v0.1.0`
- run the workflow manually from GitHub Actions

Required repository secrets:

- `APT_GPG_PRIVATE_KEY`: ASCII-armored private key used to sign repository metadata
- `APT_GPG_KEY_ID`: key ID or fingerprint for the signing key

A separate validation workflow at `.github/workflows/validate-package.yml`
builds the Debian package on pull requests and pushes to `main` without publishing.

After first publish, users can install from GitHub Pages:

```bash
curl -fsSL "https://<owner>.github.io/<repo>/lin-dos-archive-keyring.asc" | gpg --dearmor | sudo tee /usr/share/keyrings/lin-dos-archive-keyring.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/lin-dos-archive-keyring.gpg] https://<owner>.github.io/<repo>/ stable main" | sudo tee /etc/apt/sources.list.d/lin-dos.list
sudo apt update
sudo apt install lin-dos
```

## Join the Party!

Got an idea? A brilliant command translation that we missed? Jump in!

* **Fork it**: Got a fix or a feature? Fork the repo, dive in, and hit us up with that pull request.
* **Issue Tracker**: Found a bug? Got a suggestion? Drop it like it’s hot in our issue tracker.

## License

Feel free to use and spread LIN-DOS as you like! It’s all yours under the MIT License. Check out the [LICENSE](LICENSE) file for more info.

## Shoutouts

* Big thanks to all the brave souls switching from Windows to Linux. We salute you!
* Shoutout to the open-source community, couldn’t do it without you!
