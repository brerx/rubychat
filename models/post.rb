require 'sequel'

POSTGRES_URL = 'postgres://postgres@192.168.250.253:5432/rubychat'.freeze
DB ||= Sequel.connect(POSTGRES_URL, max_connections: 10)

class Post < Sequel::Model(:posts)
end
