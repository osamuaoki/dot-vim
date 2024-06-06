#!/bin/bash
# Copyright (c) 2024 Osamu Aoki <osamu@debian.org>
# GNU GPL 2+

# Conversion script to transform script to be used as a part of DR

FIN=.vimrc
FOUT=.vimrc-sgml

sed -e 's/\&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' <$FIN > $FOUT

# vim: set sts=2 sw=2 et si ai:
