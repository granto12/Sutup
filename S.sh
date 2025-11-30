#!/bin/bash

# ============================
# Ubuntu 22 Python Dev Setup
# ============================

echo "Обновляем систему..."
sudo apt update && sudo apt upgrade -y

echo "📦 Устанавливаем базовые утилиты..."
sudo apt install -y software-properties-common build-essential curl wget git

# ----------------------------
# Установка Python
# ----------------------------

sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install -y python3 python3-pip python3-venv python3-dev


python3 --version
pip3 --version

# ----------------------------
# Настройка виртуальных окружений
# ----------------------------

python3 -m venv ~/python_venv
echo "Для активации: source ~/python_venv/bin/activate"

# ----------------------------
# Обновление pip и установка полезных пакетов
# ----------------------------

source ~/python_venv/bin/activate
pip install --upgrade pip setuptools wheel

pip install numpy pandas matplotlib seaborn scikit-learn jupyterlab
pip install requests beautifulsoup4 flask django fastapi uvicorn
pip install pytest black isort flake8 mypy

deactivate

# ----------------------------
# Установка JupyterLab
# ----------------------------

source ~/python_venv/bin/activate
pip install jupyterlab
deactivate

# ----------------------------
# Установка IDE (опционально)
# ----------------------------

sudo snap install code --classic
sudo snap install pycharm-community --classic

# ----------------------------
# Git и SSH
# ----------------------------
echo "Настройка Git..."
git config --global user.name "Ваше имя"
git config --global user.email "ваш@email.com"
echo " Создаём SSH ключ (если нужен)..."
ssh-keygen -t ed25519 -C "ваш@email.com"

# ----------------------------
# Pyenv (опционально)
# ----------------------------

curl https://pyenv.run | bash

echo 'Добавьте следующие строки в ~/.bashrc:'
echo 'export PATH="$HOME/.pyenv/bin:$PATH"'
echo 'eval "$(pyenv init -)"'
echo 'eval "$(pyenv virtualenv-init -)"'
echo 'Перезапустите терминал для применения pyenv'

# ----------------------------
# Зависимости для сборки Python
# ----------------------------

sudo apt install -y libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev \
  libreadline-dev libsqlite3-dev libgdbm-dev libdb5.3-dev libbz2-dev \
  libexpat1-dev liblzma-dev tk-dev


echo "mkdir myproject && cd myproject"
echo "python3 -m venv venv"
echo "source venv/bin/activate"
