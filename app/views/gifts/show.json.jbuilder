json.array! @gifts do |gift|
  json.gift_id gift.id
  json.amount gift.amount.to_i
  json.title gift.title
  json.charity gift.charity
  json.sent_time gift.sent_time.to_i
  json.sender User.where(email: gift.sender_id)
  json.receiver User.where(email: gift.receiver_id)
  if gift.claim_time
    json.claim_time gift.claim_time.to_i
  else
    json.claim_time gift.claim_time
  end
end