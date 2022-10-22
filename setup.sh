#!/bin/bash -ex

# because i use macos with m1 chip i wrote another automation
# that install via homebrew pipenv to the machine, sync dependencies
# and run the django server on local host
# reccomanded to use with nohup


# install pipenv via homebrew package manager
brew install pipenv

# navigate to the pipenv folder
cd pipenv

# sync pipenv req
pipenv sync --dev 

# run the django server
pipenv run \
python manage.py runserver 0.0.0.0:8000 > runserver.log

tail -F runserver.log
