function my_function() {
  echo "This is my function"
}
echo "Select an option:"
select option in "Option 1" "Option 2" "Option 3"; do
  case $option in
    "Option 1")
      echo "You selected Option 1"
      ;;
    "Option 2")
      echo "You selected Option 2"
      ;;
    "Option 3")
      echo "You selected Option 3"
      ;;
    *)
      echo "Invalid option"
      ;;
  esac
  if [[ $option == "Option 1" ]]; then
    echo "Option 1 was selected"
  elif [[ $option == "Option 2" ]]; then
    echo "Option 2 was selected"
  else
    echo "Option 3 was selected"
  fi
  for i in 1 2 3; do
    echo "Loop iteration $i"
  done
  j=0
  until [ $j -ge 3 ]; do
    echo "Until loop iteration $j"
    ((j++))
  done
  k=0
  while [ $k -lt 3 ]; do
    echo "While loop iteration $k"
    ((k++))
  done
  echo "This command took:"
  time sleep 1
  break
done
echo "End of script"