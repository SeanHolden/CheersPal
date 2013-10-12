# @gifts = Gift.all
json.array! @gifts do |gift|
  json.sender gift.sender
  json.receiver gift.receiver
  json.amount gift.amount.to_i
  json.title gift.title
  json.charity gift.charity
  json.sent_time gift.sent_time.to_i
  if gift.claim_time
    json.claim_time gift.claim_time.to_i
  else
    json.claim_time gift.claim_time
  end
end