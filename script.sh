#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 <path_to_file.sh>"
  exit 1
fi
# Шифрование скрипта
code_hex=$(sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/;/g' -e 's/\(do\|then\|else\|fi\|done\)\( *\)$/\1\n/g' -e 's/;;/;/g' -e 's/;/; /g' -e 's/done;/done/g' -e 's/do;/do/g' < "$1" | xxd -p)
# Создание нового .sh файла и запись зашифрованной строки в переменную code_hex
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