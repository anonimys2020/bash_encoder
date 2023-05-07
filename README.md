# BASH script encoder (EN)

This script is designed to encrypt a Bash script file and create a new encrypted file with the extension `.enc.sh`. The encrypted file can then be decrypted and executed as a Bash script.

## Usage

To use this script, provide the name of the Bash script file as an argument:

```./encrypt.sh myscript.sh```


This will create a new encrypted file called `myscript.sh.enc.sh`.

To execute the encrypted file, run:
```./myscript.sh.enc.sh```


The encrypted file will be decrypted and executed as a Bash script.

## How it works

The script reads the contents of the input file and converts it to hexadecimal format. It then creates a new Bash script file with a template for decryption. When the encrypted file is executed, the decryption script reads the hexadecimal code, converts it back to text, and executes it as a Bash script.

Note that this script should not be used for encrypting sensitive information, as it does not provide strong encryption and can be easily reverse-engineered. It is intended for basic obfuscation only.


# Шифровальщик BASH скриптов (RUS)

Этот скрипт предназначен для шифрования файла сценария Bash и создания нового зашифрованного файла с расширением `.enc.sh`. Затем зашифрованный файл может быть расшифрован и выполнен как сценарий Bash.

## Использование

Чтобы использовать этот сценарий, укажите имя файла сценария Bash в качестве аргумента:

```./encrypt.sh myscript.sh```


Это создаст новый зашифрованный файл с именем `myscript.sh.enc.sh`.

Чтобы выполнить зашифрованный файл, выполните:
```./myscript.sh.enc.sh```


Зашифрованный файл будет расшифрован и выполнен как сценарий Bash.

## Как это работает

Сценарий считывает содержимое входного файла и преобразует его в шестнадцатеричный формат. Затем он создает новый файл сценария Bash с шаблоном для расшифровки. Когда зашифрованный файл выполняется, сценарий расшифровки считывает шестнадцатеричный код, преобразует его обратно в текст и выполняет его как сценарий Bash.

Обратите внимание, что этот сценарий не следует использовать для шифрования конфиденциальной информации, поскольку он не обеспечивает надежного шифрования и легко поддается обратной обработке. Он предназначен только для базовой обфускации.