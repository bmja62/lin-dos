echo
echo "Starting LIN-DOS..."
echo 
echo 

source ./cd/cd.sh
source ./cls/cls.sh
source ./copy/copy.sh
source ./date/date.sh
source ./md/md.sh
source ./rd/rd.sh
source ./time/time.sh
source ./tree/tree.sh
source ./ver/ver.sh
source ./type/type.sh