#!/bin/sh
mysql -u root -pmysql << EOF
# ---
# ---
# [201407]
# ---
# ---
# [201408]
# ---
# ---
# [201409] 
# ---
source ./../../sql/20140901-bookmanager.sql
# ---
# [201410] 
# ---
# ---
# [201411] 
# ---
source ./../../sql/20141101-attendance.sql
# ---
# [201412] 
# ---
# source ./../../sql/20141202-chikezon.sql
# ---
# [201501]
# ---
source ./../../sql/oden.sql
source ./../../sql/sakatike.sql
# source ./../../sql/uesto.sql
# ---
# [201502]
# ---
source ./../../sql/tourtike.sql
# source ./../../sql/solare.sql
# ---
# [201503]
# ---
source ./../../sql/worldtravel.sql
source ./../../sql/youjustjewelry.sql
source ./../../sql/gpscoffee.sql

# ---
# [201504]
# ---
# source ./../../sql/lapoupee.sql
source ./../../sql/ucycle.sql
# ---
# [201505]
# ---
# source ./../../sql/livetickets.sql
# source ./../../sql/baseballticket.sql
# source ./../../sql/ichigoichie.sql
# ---
# [201506]
# ---
source ./../../sql/releaseproject.sql
# source ./../../sql/gtickets.sql
source ./../../sql/movietickets.sql
# source ./../../sql/tbox.sql
# ---
# [201507]
# ---
# source ./../../sql/biggalaxy.sql
source ./../../sql/khome.sql
# ---
# [201508]
# ---
source ./../../sql/aquarium.sql
# ---
# [201509] 
# ---
source ./../../sql/lereve.sql
source ./../../sql/shizuku.sql
# ---
# [201510] 
# ---
source ./../../sql/footprinter.sql
source ./../../sql/pizzaseijin.sql
# ---
# [201511] 
# ---
# source ./../../sql/cinemajapan.sql
source ./../../sql/chocotime.sql
# ---
# [201512] 
# ---
source ./../../sql/rakuraku.sql
source ./../../sql/kinnosawa.sql
# ---
# [201601]
# ---
source ./../../sql/mackeypark.sql
source ./../../sql/kuruyama.sql
# ---
# [201603] 201602
# ---
source ./../../sql/gekidanroadshow.sql
# source ./../../sql/ichigoichie.sql
# ---
# [201604] 201603 
# ---
source ./../../sql/uesto.sql
source ./../../sql/solare.sql
# ---
# [201605] 201603 & 201604
# ---
source ./../../sql/lapoupee.sql
source ./../../sql/gtickets.sql
source ./../../sql/chikezon.sql
# ---
# [201606] 201604 & 201605
# ---
source ./../../sql/live.sql
source ./../../sql/baseballticket.sql
source ./../../sql/ichigoichie.sql
source ./../../sql/tbox.sql
source ./../../sql/biggalaxy.sql
source ./../../sql/cinemajapan.sql

# ---
# [201607] 201605 & 201606
# ---
# source ./../../sql/internousdev.sql
# source ./../../sql/openconnect.sql
source ./../../sql/visa.sql
# ---
# [201608] 201606 & 201607
# ---
# source ./../../sql/internousdev.sql
source ./../../sql/rewrite.sql
source ./../../sql/miramode.sql
# ---
# [201609] 201607 & 201608
# ---
source ./../../sql/internousdev.sql
source ./../../sql/openconnect.sql
source ./../../sql/mastercard.sql
source ./../../sql/americanexpress.sql
source ./../../sql/samurai.sql
# ---
# [201610] 201608 & 201609
# ---
source ./../../sql/nagomi.sql
# ---
# [201611] 201609 & 201610
# ---
source ./../../sql/noel.sql


EOF
