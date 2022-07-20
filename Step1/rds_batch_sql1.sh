echo "This is a test SQL Script written in shell!."
echo on
echo `date`
#The below line extracts the Database credentials from the Secret Store
data=$(aws secretsmanager get-secret-value --secret-id rds-secret --query SecretString --output text --region=us-west-2 ) 
host=$(echo $data | awk -F"," '{print $1}' | awk -F":" '{print $2}' |  tr -d '"')
sid=$(echo $data | awk -F"," '{print $2}' | awk -F":" '{print $2}' |  tr -d '"')
port=$(echo $data | awk -F"," '{print $3}' | awk -F":" '{print $2}' |  tr -d '"')
username=$(echo $data | awk -F"," '{print $4}' | awk -F":" '{print $2}' |  tr -d '"')
password=$((echo $data) | awk -F "," '{print $5}' | awk -F":" '{print $2}' |  tr -d '"' |  tr -d '}') 
dbconnection="$username/$password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=$host)(PORT=$port))(CONNECT_DATA=(SID=$sid)))"

sqlplus "$dbconnection" <<< "select current_date from dual;"