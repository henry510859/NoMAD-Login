#!/bin/bash

domain="請輸入網域名稱"
#設定背景圖片
background_image="/Library/Desktop Pictures/Mojave Day.jpg"
#設定背景圖片透明度
background_image_alpha="0"
#設定登入LOGO
logo="/Library/Desktop Pictures/logo/black.png"
#是否將密碼加入Keychain
keychain_add="TRUE"
#是否啟用登入畫面
login_screen="false"

# Set default AD domain
defaults write /Library/Preferences/menu.nomad.login.ad.plist ADDomain "$domain"

# Set background image
defaults write /Library/Preferences/menu.nomad.login.ad.plist BackgroundImage "$background_image"

# Set background image transparency
defaults write /Library/Preferences/menu.nomad.login.ad.plist BackgroundImageAlpha -int "$background_image_alpha"

# Set login window logo
defaults write /Library/Preferences/menu.nomad.login.ad.plist LoginLogo "$logo"

# Enable or disable login screen
defaults write /Library/Preferences/menu.nomad.login.ad.plist LoginScreen -bool "$login_screen"

# Adds a NoMAD entry into the keychain
defaults write /Library/Preferences/menu.nomad.login.ad.plist KeychainAddNoMAD -bool "$keychain_add"

# Should NoLo create a Keychain if none exists
defaults write /Library/Preferences/menu.nomad.login.ad.plist KeychainCreate -bool "$keychain_add"


# Set security authorization database mechanisms with authchanger
/usr/local/bin/authchanger -reset -AD

# Kill loginwindow process to force NoMAD Login to launch
/usr/bin/killall -HUP loginwindow

exit 0
