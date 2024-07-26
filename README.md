# cyb-env
Environment Setup for CodePath Cyber Courses

Refer to [Readme](../README.md) for instructions on updating, building and pushing the image.

Access the 👉 [CyberSecurity 101 environment setup links here](cyb-101/README.md) 👈

## Current Status
(What's working and what's not)

### Limitations
- Workspaces: IDX has a limit of 1 workspace per user. The students will get an error if trying to click the link to create a second environment, so we need to inform them to continue using the same environment for all units.
- GUI: Some labs and projects require a GUI (see below), and a GUI is not available in the current environment. We need to provide alternative instructions for these labs and projects.
  - 🔵 = No env necessary
  - 🟢 = Working
  - 🟡 = Limited functionality (works, but not exactly as currently in the coursework)
  - 🔴 = Not currently working

- Unit 1 - Working
  - 🔵 Lab: No env necessary (cyberchef)
  - 🔵 Project: No env necessary (cyberchef)
- Unit 2 - Working
  - 🟢 Lab: Working (ls, cd, pwd, mv, tree, cowsay, apt install)
  - 🟡 Project: Limited - git, ssh (can't ssh from externally, but can from within IDX)
- Unit 3 - Working 
  - 🟢 Lab: Working (Password cracking with John)
  - 🟢 Project: Working (Password cracking with John)
- Unit 4 - Limited
  - ❌ Lab: Can edit hosts file and use dig, but can't install firefox or do the DNS Tricks portion, since it's a GUI
  - 🟡 Project: Can run docker in a separate terminal (in IDX, but not the docker container) with `docker run --name metasploitable -d tleemcjr/metasploitable2:latest sh -c "/bin/services.sh"`
- Unit 5 - In progress
  - 🟢 Lab: Can run (vt-cli virus detection)
  - ❌ Project: Having issues with msfvenom (Install process can't find packages. I'll get it working though.)
- Unit 6 - Working
  - 🔵 Lab: No env necessary (cyberchef)
  - 🟢 Project: Working - Can run (Images with steghide - drag and drop image into idx folder volume to get access to the path in the docker container)
- Unit 7 - Working
  - 🔵 Lab: No env necessary (Uses shodan from local machine browser)
  - 🟢 Project: Can run (uses shodan from idx) `curl https://internetdb.shodan.io/45.33.123.209`
- Units 8 - Limited
  - ❌ Lab: Can run SET, but can't run RDP, since no GUI, so can't visit a page and harvest the login credentials
  - 🔵 Project: Phish Tank (open ended)
- Unit 9
  - 🔵 Lab: No env necessary (web trackers in browser)
  - 🔵 Project: Phish Tank (open ended)
- Unit 10
  - 🔵 Lab: No lab
  - 🔵 Project: Phish Tank (open ended)