require_relative '../models/post'

module Posts
  def self.new_post(attributes)
    %i[user message].each do |attr|
      return "Missing attribute: #{attr}" if attributes[attr].nil?
    end

    Post.create(attributes.merge(created_at: Time.now))
    true
  end

  def self.all
    Post.all.map do |post|
      {
        user: post[:user],
        message: post[:message],
        created_at: post[:created_at]
      }
    end
  end
end
