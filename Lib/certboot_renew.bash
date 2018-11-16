#!/bin/sh

# Update "Let's Encrypt" certificates,
# make cert+key joined files and key pining hashes for Lighttpd
# (c)2016 by Max Kostikov http://kostikov.co e-mail: max@kostikov.co
#
# cat /etc/crontab | grep lerenew
# 0 0 * * 1 root /usr/local/etc/letsencrypt/lerenew.sh >/dev/null 2>&1

lepath="/usr/local/etc/letsencrypt"
log="/var/log/letsencrypt/lerenew.log"
pins="/usr/local/etc/lighttpd/pins.d"                   # where pins stored
joincrt="privandcert"                                   # joined file name
curpref="cur"                                           # current set postfix

echo "`date '+%Y-%m-%d %H:%M:%S'` --- Starting SSL certs renew..." >>$log

certbot renew -nv $* >>$log 2>&1

certs=`find ${lepath}/archive/*/cert*.pem -mtime -1d`

if [ "${certs}" ];
then
        for i in $certs;
        do
                dir=`dirname $i`                        # path to certs
                dom=`basename $dir`                     # domain name
                ind=`basename $i | tr -d '[:alpha:].'`  # latest cert index
                cur=`expr $ind - 1`                     # previous cert index

                # create new joined cert and symlink
                cat ${dir}/privkey${ind}.pem $i > ${dir}/${joincrt}${ind}.pem
                cd ${lepath}/live/${dom}
                ln -fs ../../archive/${dom}/${joincrt}${ind}.pem ${joincrt}.pem

                # create symlinks for previous certs set
                for j in `ls -d ../../archive/${dom}/*${cur}.*`;
                do
                        ln -fs $j `basename -s .pem $j | tr -d '[:digit:]'`.${curpref}.pem
                done

                # create cert pins
                conf="${pins}/${dom}.conf"              # pin config name
                echo '  setenv.add-response-header  = (' >$conf
                echo '          "Strict-Transport-Security" => "max-age=15768000",' >>$conf
                echo -n '               "Public-Key-Pins" => ' >>$conf
                echo -n '"pin-sha256=\"' >>$conf
                echo -n "`openssl x509 -in cert.${curpref}.pem -pubkey -noout | openssl rsa -pubin -outform der | openssl dgst -sha256 -binary | openssl enc -base64`" >>$conf
                echo -n '\"; pin-sha256=\"' >>$conf
                echo -n "`openssl x509 -in cert.pem -pubkey -noout | openssl rsa -pubin -outform der | openssl dgst -sha256 -binary | openssl enc -base64`" >>$conf
                echo '\"; max-age=5184000"' >>$conf
                echo '  )' >>$conf
        done
        service lighttpd restart
fi

echo "`date '+%Y-%m-%d %H:%M:%S'` --- SSL certs renew done!" >>$log
