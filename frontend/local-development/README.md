# Local Development using Containers

Here we will outline the process to setup a local development environment using containerization.

## Prerequisites

Install the following packages:

1.  [Docker](https://docs.docker.com/engine/install/)
    - Windows, use **Docker Desktop**
    - Mac, use **Docker Desktop**
    - Linux, use **Docker Engine**
      > If on RHEL, Fedora, CentOS or Rocky Linux you may use Podman which is already installed. Though you will need to also install [podman-compose](https://github.com/containers/podman-compose).
2.  [Git](https://github.com/git-guides/install-git)
    > Only required on Linux and Mac. For Windows see _step 4_ below.
3.  [Visual Studio Code](https://code.visualstudio.com/download)
4.  [WSL2 Linux Distribution](https://docs.microsoft.com/en-us/windows/wsl/install)
    > _(Windows only)_ Due to a limitations in WSL2 (leveraged by Docker Desktop), _inotify events_ are not pushed to the Docker container when mounted volumes are in use. For more details, recommend review of the [this](https://docs.docker.com/desktop/windows/wsl/#best-practices) article.<br />
    > Since mounted volumes are the key to our success, it is therefore required to develop from the Linux terminal rather than the Windows command line, PowerShell or any other shells (like _GitBash_).<br />
    > Once installed [enable Docker](https://docs.docker.com/desktop/windows/wsl/#enabling-docker-support-in-wsl-2-distros) in the chosen Linux distribution then open the Linux terminal. The **Git** package comes preinstalled in the Linux distribution.

## Run

1.  Clone the Git repository.
    ```
    git clone https://github.com/Call-for-Code/React-Carbon-Dashboard.git
    ```
2.  Change to the `ui` folder under **Five Fifth Voter** repository.
    ```
    cd React-Carbon-Dashboard
    ```
3.  Start the application
    > Add `--build` if a rebuild the base image is necessary. The first run will build the image.<br />A restart of the container is necessary to pick up changes outside the `src` directory.
    - Docker
      ```
      docker compose -f local-development/docker-compose.yaml up
      ```
    - Podman
      ```
      podman-compose -f local-development/docker-compose.yaml up
      ```
4.  Open Visual Studio Code by running the following command:
    ```
    code .
    ```

## View the application

In your browser, navigate to the following URL:

```
http://localhost:3000
```

## What the value?

There are several advantages of using this method of local development. Here are a few:

- Quickly bring up environments.
- No need to bother with installation of correct package versions.
- Consistency throughout the development process.
