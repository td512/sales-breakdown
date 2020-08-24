json.prettify!

json.error do
  json.status "Not Found"
  json.code 404
  json.message "The page you're looking for has gone walkabouts. Try again later?"
end