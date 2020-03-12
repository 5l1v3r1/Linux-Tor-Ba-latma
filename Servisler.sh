##!/bin/bash
read -p "Tor Servisini Başlatmak İçin 1, Durdurmak İçin 2 > " cikti
if test "$cikti" = "1"
then
	## http_proxy ve https_proxy temizleme
	export http_proxy=''
	export https_proxy=''
	## Servisler Başlamadan Önce IP Adresimiz
	curl icanhazip.com
	## Tor ve Privoxy Başlatma
	service tor restart
	service privoxy restart
	## http_proxy ve https_proxy atama
	export http_proxy='127.0.0.1:8118'
	export https_proxy='127.0.0.1:8118'
	## Servisler Başladıktan Sonra IP ADresimiz
	curl icanhazip.com
elif test "$cikti" = "2"
then
	## http_proxy ve https_proxy temizleme
	export http_proxy=''
	export https_proxy=''
	## Tor ve Prixoy Durdurma
	service tor stop
	service privoxy stop
else
	## Hata Mesajı
	echo "Hata! Başlatmak için 1, durdurmak için 2 değerlerinden birini girmelisiniz.."
fi