class Book
  include Cut

  url "amazon.com"

  selector ".book"

  attribute :isbn, String, "p.isbn"

end

Book.all
