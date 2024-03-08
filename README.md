# [Empirica](https://github.com/empiricaly/empirica) Utils: Scripts for Self-Hosting on Any Machine

This repository contains a set of utility scripts to facilitate the self-hosting of Empirica apps on any machine using bash.
Prerequisites
- Bash shell
- Node.js (v14 or later)
- npm (Node Package Manager)
- Git
- ansible ( optional ), for deploying playbook on remote host

# Getting Started
Clone this repository to your local machine:
```bash
git clone git@github.com:ahmedrowaihi/ansible-empirica.git
```

Navigate to the cloned directory
```bash
cd ansible-empirica
```

Run the setup script to install the necessary dependencies:

```bash
chmod +x setup.sh
./setup.sh
```
### Start Empirica App:

After setting up the app, navigate to the app directory and start the Empirica app:

```bash
    cd ansible-empirica
    METEOR_ALLOW_SUPERUSER=1 meteor
```
Additional Configuration
Modify the settings in the ```local.json``` file according to your requirements.

Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, feel free to open an issue or create a pull request.
License

This project is licensed under the MIT License.
Acknowledgments

This project is inspired by the [Empirica](https://github.com/empiricaly/empirica) framework
