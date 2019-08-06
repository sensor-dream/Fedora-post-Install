#!/bin/env sh

wget http://vault.centos.org/7.5.1804/os/Source/SPackages/webkitgtk3-2.4.11-2.el7.src.rpm;

sudo dnf builddep webkitgtk3-2.4.11-2.el7.src.rpm;

rpmbuild --rebuild webkitgtk3-2.4.11-2.el7.src.rpm;

sudo dnf install webkitgtk3-2.4.11-2.el7.src.rpm;
