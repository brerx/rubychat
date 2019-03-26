require 'sequel'

POSTGRES_URL = 'postgres://postgres@127.16.12.124:5432/rubychat'.freeze
DB ||= Sequel.connect(POSTGRES_URL, max_connections: 10)

class Post < Sequel::Model(:posts)
end
