#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 <path_to_file.sh>"
  exit 1
fi
# Шифрование содержимого файла в кодировку Hexadecimal c использованием опции -c
code_hex=$(xxd -p -c 10000 "$1" | sed 's/\(..\)/\\x\1/g')
# Создание нового .sh файла и запись зашифрованной строки в переменную code_hex
new_file="$1.enc.sh"
cat <<EOF >"$new_file"
#!/bin/bash
code_hex="$code_hex"
code_bytes=\$(echo \$code_hex | sed 's/\\\\x//g' | xxd -r -p)
code_str=\$(echo \$code_bytes | tr -d '\n')
eval \$code_str
EOF
echo "Encrypted script saved to $new_file"
