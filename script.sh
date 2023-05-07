#!/bin/bash

# Проверка наличия аргумента
if [ -z "$1" ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

# Проверка существования файла
if [ ! -f "$1" ]; then
    echo "File not found: $1"
    exit 1
fi

# Чтение содержимого файла и замена символов новой строки на \n
code_str=$(awk '{printf "%s\\n", $0}' "$1")

# Преобразование строки в hexademical
code_hex=$(echo -n "$code_str" | xxd -p)

# Создание нового файла с расширением .enc.sh
new_file="$1.enc.sh"

# Запись шаблона для расшифровки в новый файл
cat <<EOF >"$new_file"
#!/bin/bash
code_hex="$code_hex"
code_bytes=\$(echo \$code_hex | sed 's/..../& /g' | tr -d ' ' | xxd -r -p)
code_str=\$(echo -e \$code_bytes)
eval "\$code_str"
EOF
chmod +x "$new_file"

echo "Encrypted file created: $new_file"
