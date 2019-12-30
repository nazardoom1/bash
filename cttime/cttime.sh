cttime ()
{
    DOMNAME=$1;
    EXPYEARFLAG=$2;
    cmd_whois='/usr/bin/whois';
    if [[ $# -lt 1 ]]; then
        echo "There is no parameter for the 'cttime' command!";
        return 1;
    fi;
    if [[ -z "${EXPYEARFLAG}" ]]; then
        echo "There is no expiration date parameter for the 'cttime' command!";
        return 1;
    fi;
    EXPYEAR=$EXPYEARFLAG;
    CURRENTDATE=$( TZ=UTC date -I'seconds' |cut -b 1-10 );
    CURRENTTIME=$( TZ=UTC date -I'seconds' |cut -b 12-19 );
    EXPDATE=$( $cmd_whois "${DOMNAME}" | awk '/Registry Expiry Date:/ { print $4 }' | cut -b 5-10 );
    EXPTIME=$( $cmd_whois "${DOMNAME}" | awk '/Registry Expiry Date:/ { print $4 }' |cut -b 12-19 );
    Value2="${CURRENTDATE} ${CURRENTTIME}";
    Value1="${EXPYEAR}${EXPDATE} ${EXPTIME}";
    RES="$(($(date -d "${Value2}" '+%s') - $(date -d "${Value1}" '+%s')))";
    S=$((RES %60));
    M=$((RES /60 %60));
    H=$((RES /60 /60 %24));
    D=$((RES /60 /60 /24));
    printf "%-15s %s\n" "#title" ":cttime" "#description" ":This script calculates amount of time passed since domain expired." "#author" ":nazardumych" "#version" ":1.1 dec 11 2019";
    echo "==========disclaimer============";
    echo "1. Read manual before using || Manual: Using console commands";
    echo "2. Make sure domain expired;";
    echo "==========disclaimer============";
    echo -e "\e[96m Domain expiration (UTC) date: $Value1";
    echo -e "\e[96m Current (UTC) date:  $Value2";
    echo -e "\e[96m Domain expired $D days $H hours $M minutes $S seconds ago"
}
