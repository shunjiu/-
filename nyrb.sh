#!/bin/bash

target='http://epaper.01ny.cn/http_rb/page/1/'
date1=`date +%Y-%m`
date2=`date +%Y%m%d`
day=`date +%d`
if [ ! -d "${date2}" ]; then
    `mkdir ${date2}`
fi
for ((i=1;i<=8;i++))
do
    paper="A${i}"
    url="${target}${date1}/${day}/${paper}/${date2}${paper}_pdf.pdf"
    echo -e "Downloading ${paper}...\c"
    `wget -q ${url} -P ${date2}`
    echo -e "\t${paper} downloaded!"
done
echo "正在合并..."
`pdfunite ${date2}/*.pdf ${date2}_A.pdf`
`rm -rf ${date2}`
echo "Done!"