json.prettify!

json.error do
  json.status "Internal Server Error"
  json.code 500
  json.message "Uh oh! Something went wrong."
end