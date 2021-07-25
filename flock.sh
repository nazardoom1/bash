#!/bin/bash



## author: Mikhail Kost
## version: 0.1.4.1
## This script contains details in order to make the communication in Flock easier.
##
# Color  Variables
##
green='\e[32m'
blue='\e[94m'
red='\e[31m'
clear='\e[0m'

##
# Color Functions
##

ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}
ColorRed(){
	echo -ne $red$1$clear
}

##
# Default variables
##

defvalue="..."
domain="..."
chat="..."
username="..."

##
# Functions
##

function setValues() {
  for i in $1 $2 $3
  do
    dot="\."
    dotandslash="\.\-"
    if [[ $i =~ $dot ]] || [[ $i =~ $dotandslash ]]; then
        domain=${i:-$defvalue}
        break;
      else domain=$defvalue
     fi
  done
  for i in $1 $2 $3
  do
    slash="\-"
    dot="\."
    if [[ $i =~ $dot ]]; then
       chat=$defvalue
       elif [[ $i =~ $slash ]]; then
       chat=${i:-$defvalue}
       break
       else
         chat=$defvalue
     fi
  done
  for i in $1 $2 $3
    do
      if [[ $i =~ ^[a-zA-Z0-9]+$ ]]; then
         username=${i:-$defvalue}
         break;
       else username=$defvalue
       fi
    done

}

function syncTheDNS() {
  echo -ne "
$(ColorRed 'Please do not forget to mention the responsible person in the Flock room.')
---------------------------------------------------
@ Hello there! Please synchronize the DNS zone for the domain name:
# Chat ID: $chat
# Domain: $domain
# Username: $username (verified)
# Required server:
Thank you in advance!
---------------------------------------------------
$(ColorBlue 'Enter 0 to go back:')"
read b
if [[ $b == "0" ]]; then
  domains_hosting_menu "$chat" "$domain" "$username";
fi
}

function backupCheck() {
  echo -ne "
$(ColorRed 'Please do not forget to mention the responsible person in the Flock room.')
---------------------------------------------------
@ Hello there! Could you check if we have a backup for the hosting account?
# Chat ID: $chat
# Domain: $domain
# Username: $username (verified)
# Hosting: Shared/EasyWP
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  domains_hosting_menu "$chat" "$domain" "$username";
 fi
}

function askFu() {
  echo -ne "
$(ColorRed 'Please do not forget to mention the responsible person in the Flock room.')
---------------------------------------------------
@ Hello there! Please submit a FU for the client:
# Chat ID: $chat
# Description:
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  domains_hosting_menu "$chat" "$domain" "$username";
 fi
}

function resendHostingEmail() {
  echo -ne "
$(ColorRed 'Please do not forget to mention the responsible person in the Flock room.')
---------------------------------------------------
@ Hello there! Please resend Hosting Welcome email for the client:
# Chat ID: $chat
# Main Domain: $domain
# Username: $username (verified)
Thank you in advance!
---------------------------------------------------
$(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  domains_hosting_menu "$chat" "$domain"; "$username"
 fi
}

function createPeRecords() {
  echo -ne "
$(ColorRed 'Please do not forget to mention the responsible person in the Flock room.')
---------------------------------------------------
@ Hello there! Please create all necessary PE records for the domain name:
# Chat ID: $chat
# Domain: $domain
# Username: $username (verified)
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  domains_hosting_menu "$chat" "$domain"; "$username"
 fi
}

function createGoogleRecords() {
  echo -ne "
$(ColorRed 'Please do not forget to mention the responsible person in the Flock room.')
---------------------------------------------------
@ Hello there! Please create Google Workspace MX records for the domain name:
# Chat ID: $chat
# Domain: $domain
# Username: $username (verified)
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  domains_hosting_menu "$chat" "$domain"; "$username"
 fi
}

function createRecords() {

echo -ne "
$(ColorRed 'Please do not forget to mention the responsible person in the Flock room.')
---------------------------------------------------
@ Hello there! Please create host records for the domain name. It is pointed to our hosting nameservers:
# Chat ID: $chat
# Domain: $domain
# Username: $username (verified)
# Records that should be created:
Thank you in advance!
---------------------------------------------------
$(ColorBlue 'Enter 0 to go back:')"
   read b
   if [[ $b == "0" ]]; then
    domains_hosting_menu "$chat" "$domain"; "$username"
   fi
}

function checkIpAddress() {

echo -ne "
$(ColorRed 'Please do not forget to mention the responsible person in the Flock room.')
---------------------------------------------------
@ Hello there! Please check if there are any blocks for the IP address:
# Chat ID: $chat
# Domain: $domain
# Username: $username (verified)
# IP address:
Thank you in advance!
---------------------------------------------------
$(ColorBlue 'Enter 0 to go back:')"
     read b
     if [[ $b == "0" ]]; then
      domains_hosting_menu "$chat" "$domain"; "$username"
     fi
}

function suspendedHosting() {

  echo -ne "
$(ColorRed 'Please do not forget to mention the responsible person in the Flock room.')
---------------------------------------------------
@ Hello there! Could you check the reason of suspension for the hosting account?
# Chat ID: $chat
# Domain: $domain
# Username: $username (verified)
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  domains_hosting_menu "$chat" "$domain"; "$username"
 fi
}

function enableSSH() {
  echo -ne "
$(ColorRed 'Please do not forget to mention the responsible person in the Flock room.')
---------------------------------------------------
@ Hello there! Please enable the SSH access for the client:
# Chat ID: $chat
# Domain: $domain
# Username: $username (verified)
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  domains_hosting_menu "$chat" "$domain"; "$username"
 fi
}

function paypalInvoice() {
  echo -ne "
---------------------------------------------------
@online Hello there! Please check if the PayPal Invoice ID is a match with the Username provided below:
# Chat ID: $chat
# Username: $username
# PayPal Invoice ID:
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  billing_menu "$chat" "$domain"; "$username"
 fi
}

function phoneCall() {
  echo -ne "
$(ColorRed 'Please do not forget to mention the responsible person in the Flock room.')
---------------------------------------------------
@ Hello there! Please arrange a phone call in order to verify the client:
# Chat ID: $chat
# Username: $username
# Reason: Trusted device / Change email address
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  billing_menu "$chat" "$domain"; "$username"
 fi
}

function askBillingFu() {
  echo -ne "
---------------------------------------------------
@online Hello there! Please submit a FU for the client:
# Chat ID: $chat
# Description:
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  billing_menu "$chat" "$domain"; "$username"
 fi
}

function changeBillingCycle() {
  echo -ne "
---------------------------------------------------
@online Hello there! Client would like to change the billing cycle for the hosting account. Could you check?
# Chat ID: $chat
# Username: $username (verified)
# Main domain: $domain
# Desired plan:
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  billing_menu "$chat" "$domain"; "$username"
 fi
}

function postponePayment() {
  echo -ne "
---------------------------------------------------
@online Hello there! Client is asking for the postponement for their hosting plan. Could you check it?
# Chat ID: $chat
# Username: $username (verified)
# Main domain: $domain
# Reason for postponement:
# Requested period:
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  billing_menu "$chat" "$domain"; "$username"
 fi
}

function refundRequest() {
  echo -ne "
---------------------------------------------------
@online Hello there! Please withdraw the amount from the client's account to the source of payment.
# Chat ID: $chat
# Username: $username (verified)
# Amount to be refunded:
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  billing_menu "$chat" "$domain"; "$username"
 fi
}

function creditCardCharges() {
  echo -ne "
---------------------------------------------------
@online Hello there! Client claims that there are some credit card charges. However, I cannot locate it in the account. Could you check it?
# Chat ID: $chat
# Username: $username (verified)
# Last 4 digits of the credit card:
# Amount of charge:
# Date of charge:
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  billing_menu "$chat" "$domain"; "$username"
 fi
}

function paymentSourceChange() {
  echo -ne "
---------------------------------------------------
@online Hello there! Could you check if that is possible to change the source of payment for the recent transaction?
# Chat ID: $chat
# Username: $username (verified)
# Order ID:
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  billing_menu "$chat" "$domain"; "$username"
 fi
}

function creditCardExp() {
  echo -ne "
---------------------------------------------------
@online Hello there! Unfortunately, the expiration date is not shown in our Admin panel. Could you check if it is a match?
# Chat ID: $chat
# Username: $username
# Expiration date:
# Last 4 digits for the credit card:
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  billing_menu "$chat" "$domain"; "$username"
 fi
}

function greenFlag() {
  echo -ne "
$(ColorRed 'Please do not forget to mention the responsible person in the Flock room.')
---------------------------------------------------
@ Hello there! Client is asking to check the ticket with a green flag. Could you check?
# Chat ID: $chat
# Ticket ID:
# Username: $username
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  riskmanagement_menu "$chat" "$domain"; "$username"
 fi
}

function hackingClaim() {
  echo -ne "
$(ColorRed 'Please do not forget to mention the responsible person in the Flock room.')
---------------------------------------------------
@ Hello there! Client claims that the account was hacked. Here is a hacking claim ticket. Could you check?
# Chat ID: $chat
# Ticket ID:
# Username: $username
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  riskmanagement_menu "$chat" "$domain"; "$username"
 fi
}

function unauthorizedCharge() {
  echo -ne "
$(ColorRed 'Please do not forget to mention the responsible person in the Flock room.')
---------------------------------------------------
@ Hello there! Client claims that there are some unauthorzed charges from their account. Here is a ticket. Could you check?
# Chat ID: $chat
# Ticket ID:
# Username: $username
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  riskmanagement_menu "$chat" "$domain"; "$username"
 fi
}

function bigOrder() {
  echo -ne "
$(ColorRed 'Please do not forget to mention the responsible person in the Flock room.')
---------------------------------------------------
@ Hello there! Here is an order for more than \$1000 on our Marketplace. Could you check?
# Order ID:
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  riskmanagement_menu "$chat" "$domain"; "$username"
 fi
}

function askPeFu() {
  echo -ne "
---------------------------------------------------
@ Hello there! Please submit a FU for the client:
# Chat ID: $chat
# Description:
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  privateemail_menu "$chat" "$domain" "$username";
 fi
}

function russianChat() {
  echo -ne "
---------------------------------------------------
@online Hello there! Could someone accept Russian chat?
# Chat ID: $chat
# Domain: $domain
# Username: $username (verified)
# Desription:
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  generaldomains_menu "$chat" "$domain" "$username";
 fi
}

function transferIssues() {
  echo -ne "
---------------------------------------------------
@online Hello there L2 guys! Unfortunately, skillset is not working properly. Could someone accept the chat?
# Chat ID: $chat
# Domain: $domain
# Username: $username (verified)
# Desription:
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  generaldomains_menu "$chat" "$domain" "$username";
 fi
}

function shiftDelegation() {
  echo -ne "
---------------------------------------------------
@online Hello morning/evening/night, here is your shift delegation:
SL:
SMEs:
RR/BR: me
TR:
Wish you all a good one!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  generaldomains_menu "$chat" "$domain" "$username";
 fi
}

function exchangeDo() {
  echo -ne "
---------------------------------------------------
@all @online Hello guys, I need a DO on ... . I can offer my DOs on: ... . Feel free ro contact me anywhere.
L1/L2
ID:
Phone number:
TG:
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  shiftswap_menu "$chat" "$domain" "$username";
 fi
}

function exchangeShift() {
  echo -ne "
---------------------------------------------------
@all @online Hello guys, I need to change my morning/evening/night shift on ... to your morning/evening/night. Feel free ro contact me anywhere.
L1/L2
ID:
Phone number:
TG:
Thank you in advance!
---------------------------------------------------
 $(ColorBlue 'Enter 0 to go back:')"
 read b
 if [[ $b == "0" ]]; then
  shiftswap_menu "$chat" "$domain" "$username";
 fi
}

setValues "$1" "$2" "$3" "$defvalue"

menu(){
echo -ne "
# Hello $(ColorGreen "Domain's CS representative")
# This script is created in order to make the communication in Flock rooms easier and faster
# Contact me if you have any: feedbacks / ideas to implement / bug reports
# author: Mikhail Kost
# version: 0.1.5
$(ColorBlue 'Chat ID'): $chat , $(ColorBlue 'Domain'): $domain , $(ColorBlue 'Username'): $username
---------------------------------------------------
    $(ColorGreen 'Flock rooms:')
$(ColorGreen '1)') CS: Domains-Hosting
$(ColorGreen '2)') CS: Billing
$(ColorGreen '3)') CS: Risk Management
$(ColorGreen '4)') Private Email CS team
$(ColorGreen '5)') CS: Domains & General
$(ColorGreen '6)') CS: Domain Shifts Swap
$(ColorGreen '0)') Exit
$(ColorBlue 'Choose an option(0-6):')"
        read a
        case $a in
	        1) domains_hosting_menu "$chat" "$domain"; "$username" ;;
	        2) billing_menu "$chat" "$domain"; "$username" ;;
	        3) riskmanagement_menu "$chat" "$domain"; "$username" ;;
	        4) privateemail_menu "$chat" "$domain"; "$username" ;;
	        5) generaldomains_menu "$chat" "$domain"; "$username" ;;
					6) shiftswap_menu "$chat" "$domain"; "$username" ;;
		    	0) exit 0 ;;
			*) echo -e $red"Wrong option. Exit."$clear; exit 0;;
        esac
}

function domains_hosting_menu() {
    echo -ne "---------------------------------------------------
    $(ColorGreen 'CS: Domains-Hosting')
$(ColorGreen '1)') Synchronize the DNS zone for $domain .
$(ColorGreen '2)') Ask for the FU.
$(ColorGreen '3)') Backup check for Shared/EasyWP.
$(ColorGreen '4)') Re-send the Hosting Welcome email.
$(ColorGreen '5)') Create host records for the $domain .
$(ColorGreen '6)') Create all necessary PE records.
$(ColorGreen '7)') Create Google Workspace MX records.
$(ColorGreen '8)') Check the IP address for blocks.
$(ColorGreen '9)') Check the reason of suspension for the hosting account.
$(ColorGreen '10)') Enable SSH.
$(ColorGreen '0)') Back
$(ColorBlue 'Choose an option(0-10):')"
    read a
    case $a in
      1) syncTheDNS ;;
      2) askFu ;;
      3) backupCheck ;;
      4) resendHostingEmail ;;
      5) createRecords ;;
      6) createPeRecords ;;
      7) createGoogleRecords ;;
      8) checkIpAddress ;;
      9) suspendedHosting ;;
      10) enableSSH ;;
      0) menu "$chat" "$domain" "$username";;
      *) echo -e $red"Wrong option. Exit."$clear; exit 0;;
    esac
}

function billing_menu() {
    echo -ne "---------------------------------------------------
    $(ColorGreen 'CS: Billing')
$(ColorGreen '1)') Check the PayPal Invoice ID for matches.
$(ColorGreen '2)') Phone call.
$(ColorGreen '3)') Ask for the FU.
$(ColorGreen '4)') Change the Billing Cycle for the hosting account.
$(ColorGreen '5)') Payment postponement request.
$(ColorGreen '6)') Deposit/Refund withdrawal request.
$(ColorGreen '7)') Lost credit card charges.
$(ColorGreen '8)') Change of the payment source.
$(ColorGreen '9)') Check the credit card expiration date for matches.
$(ColorGreen '0)') Back
$(ColorBlue 'Choose an option(0-9):')"
    read a
    case $a in
      1) paypalInvoice ;;
      2) phoneCall ;;
      3) askBillingFu ;;
      4) changeBillingCycle ;;
      5) postponePayment ;;
      6) refundRequest ;;
      7) creditCardCharges ;;
      8) paymentSourceChange ;;
      9) creditCardExp ;;
      0) menu "$chat" "$domain" "$username";;
      *) echo -e $red"Wrong option. Exit."$clear; exit 0;;
    esac
}

function riskmanagement_menu() {
    echo -ne "---------------------------------------------------
    $(ColorGreen 'CS: Risk Management')
$(ColorGreen '1)') Client came with a green-flag ticket.
$(ColorGreen '2)') Hacking claim.
$(ColorGreen '3)') Unauthorized charge.
$(ColorGreen '4)') More than \$1000 Marketplace order. (For Domains RR).
$(ColorGreen '0)') Back
$(ColorBlue 'Choose an option(0-4):')"
    read a
    case $a in
      1) greenFlag ;;
      2) hackingClaim ;;
      3) unauthorizedCharge ;;
      4) bigOrder ;;
      0) menu "$chat" "$domain" "$username";;
      *) echo -e $red"Wrong option. Exit."$clear; exit 0;;
    esac
}

function privateemail_menu() {
    echo -ne "---------------------------------------------------
    $(ColorGreen 'Private Email CS team')
$(ColorGreen '1)') Ask for the FU.
$(ColorGreen '0)') Back
$(ColorBlue 'Choose an option(0-1):')"
    read a
    case $a in
      1) askPeFu ;;
      0) menu "$chat" "$domain" "$username";;
      *) echo -e $red"Wrong option. Exit."$clear; exit 0;;
    esac
}

function generaldomains_menu() {
    echo -ne "---------------------------------------------------
    $(ColorGreen 'CS: Domains & General')
$(ColorGreen '1)') Russian chat.
$(ColorGreen '2)') L2 chat transfer issues.
$(ColorGreen '3)') Shift delegation (For Domain's RR).
$(ColorGreen '0)') Back
$(ColorBlue 'Choose an option(0-3):')"
    read a
    case $a in
      1) russianChat ;;
			2) transferIssues ;;
			3) shiftDelegation ;;
      0) menu "$chat" "$domain" "$username";;
      *) echo -e $red"Wrong option. Exit."$clear; exit 0;;
    esac
}

function shiftswap_menu() {
    echo -ne "---------------------------------------------------
    $(ColorGreen 'CS: Domain Shifts Swap')
$(ColorGreen '1)') Exchange DO.
$(ColorGreen '2)') Exchange Shift.
$(ColorGreen '0)') Back
$(ColorBlue 'Choose an option(0-2):')"
    read a
    case $a in
      1) exchangeDo ;;
			2) exchangeShift ;;
      0) menu "$chat" "$domain" "$username";;
      *) echo -e $red"Wrong option. Exit."$clear; exit 0;;
    esac
}


menu "$chat" "$domain" "$username"
