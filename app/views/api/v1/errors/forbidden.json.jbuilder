json.prettify!

json.error do
  json.status "Access Denied"
  json.code 403
  json.message "You don't have access to this page. Please try again later."
end