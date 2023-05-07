echo "Enter password: "
read -s password

if [ ${#password} -lt 8 ] || [ ${#password} -gt 14 ]; then
	echo "Error! Your password has less than 8 symbols or more than 14."
	exit 1
fi

if [[ "$password" =~ [^[:ascii:]] ]]; then
	echo "Error! Your password must consist of only ASCII symbols(33-126)"
	exit 1
fi

lower=0
upper=0
digit=0
other=0

for ((i=0; i<${#password}; i++)); do
	char=${password:$i:1}
	if [[ "$char" =~ [[:lower:]] ]]; then
		lower=1
	elif [[ "$char" =~ [[:upper:]] ]]; then
		upper=1
	elif [[ "$char" =~ [[:digit:]] ]]; then
		digit=1
	else
		other=1
	fi
done

res=$(($lower+$upper+$digit+$other))

if [ $res -lt 3 ]; then
	echo "Error! Your password has less than 3 classes(Upper symbols, lower symbols, digits)"
	exit 1
fi

echo "Your password matches requirements!"