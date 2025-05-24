echo
echo "Starting LIN-DOS..."
echo 
echo 

source ./commands/cd.sh
source ./commands/cls.sh
source ./commands/copy.sh
source ./commands/md.sh
source ./commands/rd.sh
source ./commands/tree.sh
source ./commands/ver.sh