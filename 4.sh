BANLIST="banlist.txt"

format() {
	local file="$1"
	if [ ! -f "$file" ]; then
        	echo "Файл $file не найден" >&2
        	return 1
	fi
	sed '/^$/d; /^11_Steve_11 /d' "$file" > sort -u > tmp.txt
	mv tmp.txt "$file"
}

add() {
	local DATA="$*"
	local nickname=$(echo "$DATA" | cut -d' ' -f1)
	touch "$BANLIST"
	sed "/^$nickname /d" "$BANLIST" > tmp.txt
	mv tmp.txt "$BANLIST"
	echo "$DATA" >> "$BANLIST"
}

info() {
	sed -n "/^$1 /p" "$BANLIST"
}

remove() {
	sed "/^$1 /d" "$BANLIST" > tmp.txt
	mv tmp.txt "$BANLIST"
}

sort() {
	local key="$1"
	local file="$2"

	case "$key" in
		--name)
			command sort -k1,1 "$BANLIST" > "$file"
			;;
		--time)
			command sort -t':' -k3,3n -k2,2n -k1,1n "$BANLIST" > "$file"
			;;
		*)
        		echo "Unknown key: $1" >&2
        		exit 1
        		;;
	esac
}

main() {
	case "$1" in
		format) 
			format "$2" 
			;;
		add)    
			add "${@:2}" 
			;;
		info)   
			info "$2" 
			;;
		remove) 
			remove "$2" 
			;;
		sort)   
			sort "$2" "$3" 
			;;
	esac
}

main "$@"

