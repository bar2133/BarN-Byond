#!/bin/bash -ex
# the script make sure that pipenv is installed on the machine via homebrew
# sync the required dependencies and run the server on localhost with port 8000
# it is recommended to use the script with nohup  

if [[ "$OSTYPE" == "darwin"* ]]; then # if the os is macos
    # installing pipenv with homebrew package manager
    brew install pipenv 
    # navaigate to the pipenv folder
    cd pipenv 
else
    sudo -n dnf install -y pipenv
    cd /pipenv
fi

# install dependencies with pipenv
pipenv sync --dev

# Run database migrations
pipenv run python manage.py migrate

# run the django server in background and save the log to runserver.log
pipenv run python manage.py runserver 0.0.0.0:8000 > runserver.log 

# print the server log to the console
tail -F runserver.log
