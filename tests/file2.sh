var=10
if [ $var -gt 5 ]; then
echo "The variable is greater than 5"
fi

for i in {1..5}; do
echo "Loop iteration $i"
done

j=0
until [ $j -eq 5 ]; do
echo "Until loop iteration $j"
((j++))
done

k=0
while [ $k -lt 5 ]; do
echo "While loop iteration $k"
((k++))
done

function greet() {
  echo "Hello, $1!"
}
greet "John"

echo "This is a test script"