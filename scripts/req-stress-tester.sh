# Receives a URL as a parameter and hits the endpoint with as many HTTP requests as possible for a short time
# Currently can not send anything in the request body

# Invoke the script like this
# sh req-stress-tester.sh ${endpoint}

# Validate an endpoint has been provided
if [[ ! -n $1 ]];
then 
  echo "No endpoint passed."
  exit 0
fi

# Ping the API endpoint as many times as possible for ten seconds
# TODO: Spawn a child process to send even more requests
endpoint=$1
end_time=$((SECONDS + 10))
while [ $SECONDS -lt $end_time ];
do
  curl --location --request GET "${endpoint}" >/dev/null 2>&1
done

# TODO: Log the count of requests sent
echo "Fin!"
