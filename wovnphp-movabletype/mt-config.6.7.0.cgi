## Movable Type Configuration File
##
## This file defines system-wide
## settings for Movable Type. In 
## total, there are over a hundred 
## options, but only those 
## critical for everyone are listed 
## below.
##
## Information on all others can be 
## found at:
##  http://www.movabletype.jp/documentation/config

#======== REQUIRED SETTINGS ==========

CGIPath        /cgi-bin/mt/
StaticWebPath  /cgi-bin/mt/mt-static/
StaticFilePath /var/www/cgi-bin/mt/mt-static

#======== DATABASE SETTINGS ==========

ObjectDriver DBI::mysql
Database mt
DBUser mt
DBPassword password
DBHost mysql

#======== MAIL =======================
EmailAddressMain iwai@wovn.io
MailTransfer smtp
SMTPServer smtp
SMTPPort 1025
    
DefaultLanguage ja

ImageDriver Imager
