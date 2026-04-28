#!/bin/bash

set -e

echo "Detecting OS..."

OS="$(uname)"


# macOS

if [[ "$OS" == "Darwin" ]]; then
    echo "Running on macOS"

    # Homebrew check
    if ! command -v brew &> /dev/null
    then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Homebrew already installed"
    fi

    # Docker
    if ! command -v docker &> /dev/null
    then
        echo "Please install Docker Desktop manually on macOS:"
        echo "https://www.docker.com/products/docker-desktop/"
    else
        echo "Docker already installed"
    fi

    # Python
    if ! command -v python3 &> /dev/null
    then
        echo "Installing Python via brew..."
        brew install python
    else
        echo "Python already installed"
    fi

    # Django
    if ! python3 -m django --version &> /dev/null
    then
        echo "Installing Django..."
        pip3 install django
    else
        echo "Django already installed"
    fi


# Linux (Ubuntu/Debian)

elif [[ "$OS" == "Linux" ]]; then
    echo "Running on Linux"

    sudo apt update

    # Docker
    if ! command -v docker &> /dev/null
    then
        echo "Installing Docker..."
        sudo apt install -y docker.io
        sudo systemctl start docker
        sudo systemctl enable docker
    else
        echo "Docker already installed"
    fi

    # Docker Compose
    if ! command -v docker-compose &> /dev/null
    then
        echo "Installing Docker Compose..."
        sudo apt install -y docker-compose
    else
        echo "Docker Compose already installed"
    fi

    # Python
    if ! command -v python3 &> /dev/null
    then
        echo "Installing Python..."
        sudo apt install -y python3 python3-pip
    else
        echo "Python already installed"
    fi

    # Django
    if ! python3 -m django --version &> /dev/null
    then
        echo "Installing Django..."
        pip3 install django
    else
        echo "Django already installed"
    fi

else
    echo "Unsupported OS"
    exit 1
fi

echo "All tools installed successfully!"