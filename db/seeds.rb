# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

names = [
  { name: "App1" },
  { name: "App2" },
  { name: "App3" }
]

applications = []

names.each do |app_params|
  applications << Application.create!(app_params)
end

applications.each do |app|
  5.times do
    number = app.generate_next_chat_number
    app.chats.create(number:)
  end
end

applications.each do |app|
  app.chats.each do |chat|
    10.times do |i|
      number = chat.generate_next_message_number
      body = "This is a sample message for an #{number.even? ? 'even' : 'odd'} number."

      message = chat.messages.create!(number:, body:)
      
      message.__elasticsearch__.index_document
    end
  end
end
