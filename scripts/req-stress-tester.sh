<<c
  Receives a URL as a parameter and hits the endpoint with as many HTTP requests as possible for a short time
  Currently can not send anything in the request body

  Invoke the script like this:
  sh req-stress-tester.sh ${endpoint}
c


# Set the API endpoint using the provided parameter
endpoint=$1

# Validate an API endpoint has been provided
if [[ ! -n $endpoint ]];
then 
  echo ""
  echo "No API endpoint provided"
  echo "Exiting script...\n"
  exit 0
fi

# Send a probing request to the targeted API endpoint to ensure it is valid
curl --fail --request GET "${endpoint}" >/dev/null 2>&1
if [ "$?" -ne 0 ];
  then
    echo ""
    echo 'API endpoint is not responding successfully'
    echo 'Exiting script...\n'
    exit 0
fi;

# If the API endpoint is valid, begin spamming it with requests
echo ""
echo "API endpoint successfully responding"
echo "Beginning attack..."

# Ping the API endpoint as many times as possible for ten seconds
# TODO: Spawn a child process to send even more requests
end_time=$((SECONDS + 10))
req_count=1
while [ $SECONDS -lt $end_time ];
do
  curl --request GET "${endpoint}" >/dev/null 2>&1
  req_count=$((req_count + 1))
done

# Log a short summary
echo "Sent \x1b[31m$req_count\x1b[0m requests in $end_time seconds to: $endpoint"
echo "Fin!\n"
