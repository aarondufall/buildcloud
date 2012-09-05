#= require jquery.tokeninput.js

buildAutocompleteResult = (item) ->
  output = "<li>"
  if item.type?
    output += "<strong>#{item.type}:</strong> "
  output += item.name
  output + "</li>"

$ ->
  email_tokens_field = $ "#issue_email_tokens"
  email_tokens_field.tokenInput "/emails.json"
    theme: "facebook"
    prePopulate: email_tokens_field.data 'email-details'
    resultsFormatter: buildAutocompleteResult