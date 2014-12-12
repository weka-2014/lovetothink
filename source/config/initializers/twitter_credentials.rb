require 'twitter'

CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key = '6CDqYWSwVmooFItZd01Be4WlG'
  config.consumer_secret = '0SzLI7qIAHYRNOiA2AbDqaP8grexZGcFpf3aTmxzAwQVOf4RDR'
  config.access_token = '172834819-5RRcpZCwNdQCpd8MjeAii29DqDzj6Enn6Utu4HIF'
  config.access_token_secret = 'j4XzDsuuuBRmzV6EwYKoKDYoDQN0DZYW9SCMzebPKxAq9'
end