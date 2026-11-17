if [ -z "$1" ] || [ ! -f "$1" ]; then
	echo "Error: file is blank or not found." >&2
	exit 1
fi

awk '
{
	seller= $1
	reciever= $3
 	items=$4
    	item_type=$5
    	loss[seller, item_type]+= items
    	gain[reciever, item_type]+= items
    	players[seller]= 1
}
END {
    	for (i in loss) {
        	if (loss[i] > gain[i]) {
            	split(i, arr, SUBSEP)
            	cheaters[arr[1]] = 1
        	}
    	}
    	for (x in cheaters) {
        	print x
    	}
}
' "$1"

