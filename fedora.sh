#!/bin/sh
#
#This is the Andrew Edwards "Tadisdef" Heroku toolbelt installer
#for fedora. This is a first version and horrbily built.
{
    echo "This script requires superuser access to install apt packages."
    echo "You will be prompted for your password by sudo."

    # clear any previous sudo permission
    sudo -k

    # run inside sudo
    sudo sh <<SCRIPT

  # add heroku repository to apt
  echo "deb http://toolbelt.heroku.com/ubuntu ./" > /etc/yum.repos.d/heroku.list

  # install heroku's release key for package verification
  wget -O- https://toolbelt.heroku.com/apt/release.key | ssh-add

  # update your sources
  yum update

  # install the toolbelt
  yum install -y heroku-toolbelt

  # install the rubygem-toolbelt
  yum install rubygem-heroku

  # To use heroku on Fedora you will need xclip and to add an ssh key to heroku.
  echo "Now just get xclip and generate an ssh key to add to your Heroku account to get started!"

SCRIPT
}
