json.prettify!

json.error do
  json.status "Request Not Acceptable"
  json.code 406
  json.message "Something went wrong with your request. Refresh and try again."
end