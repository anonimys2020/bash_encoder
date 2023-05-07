#!/bin/bash
if [ -z "$@" ]; then
  echo "Usage: $0 <path_to_file.sh>"
  exit 1
fi
# Создание нового .sh файла и запись зашифрованной строки в переменную code_hex
code_hex=$(sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/;/g' -e 's/\(do\|then\|else\|fi\|done\|select\|time\|until\|while\|in\)\( *\)[;]*$/\1\n/g' -e 's/;;/;/g' -e 's/;/; /g' -e 's/do;/do/g' -e 's/then;/then/g' -e 's/else;/else/g' -e 's/\bfunction\b[[:space:]]*([^)]*)[[:space:]]*{[[:space:]]*/&\n/g' -e 's/time;/time/g' -e 's/until;/until/g' -e 's/while;/while/g' -e 's/\(\bif\b\|\belif\b\)\([^ ]\)/\1 \2/g' -e 's/\(\bif\b\)[ ]\{1,\}\(\[\)/\1 \2/g' -e 's/\[\([^ ]\)/\[ \1/g' -e 's/\b=\b/=/g' -e 's/\bfor\b\(.*;\)\([^ ]\)/for \1 \2/g' -e 's/\bwhile\b\([^ ]\)/while \1/g' -e 's/:/; /g' -e 's/break;/break; /g' -e 's/\<-lt\>/</g' -e 's/\([^ ]\);/\1; /g' -e 's/\(echo ".*"\);/\1 ;/g' -e 's/{;/{/g' < "$1" | xxd -p)
new_file="$1.enc.sh"
cat <<EOF >"$new_file"
#!/bin/bash
code_hex="$code_hex"
code_bytes=\$(echo \$code_hex | sed 's/..../& /g' | tr -d ' ' | xxd -r -p)
code_str=\$(echo \$code_bytes | tr -d '\n')
eval \$code_str
EOF
chmod +x "$new_file"
echo "Encrypted script saved to $new_file"