json.extract! book, :id, :title, :author, :page_length, :rating, :created_at, :updated_at
json.url book_url(book, format: :json)
