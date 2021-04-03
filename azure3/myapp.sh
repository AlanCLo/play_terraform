#!/bin/bash

sudo yum update -y --disablerepo='*' --enablerepo='*microsoft*'
sudo touch "/hello_there.txt"
