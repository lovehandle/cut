# Cut

A DSL for Scraping Websites

## Installation

Add this line to your application's Gemfile:

    gem 'cut'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cut

## Usage

Search Google:

```ruby
class SearchResult

  include Cut

  url "http://google.com/search?q={{keywords}}"

  selector "li.g"

  map :title, String, to: "h3.r"

end
```

Return Results:

```ruby
SearchResult.all(keywords: "war and peace")
#=> [#<SearchResult:0x007fd18be96588 @title="War and Peace - Wikipedia, the free encyclopedia">, #<SearchResult:0x007fd18b97c098 @title="War and Peace (1956) - IMDb">, #<SearchResult:0x007fd18b986188 @title="War and Peace (Vintage Classics): Leo Tolstoy, Richard Pevear ...">, #<SearchResult:0x007fd18b874038 @title="War and Peace by graf Leo Tolstoy - Free Ebook - Project Gutenberg">, #<SearchResult:0x007fd18b8b46b0 @title="SparkNotes: War and Peace">, #<SearchResult:0x007fd18bc070d8 @title="War and Peace by Leo Tolstoy - Reviews, Discussion, Bookclubs, Lists">, #<SearchResult:0x007fd18bf7c8d0 @title="War and Peace - The Literature Network">, #<SearchResult:0x007fd18bf7a0f8 @title="War and Peace - graf Leo Tolstoy - Google Books">, #<SearchResult:0x007fd18bfc2d58 @title="Images for war and peace">, #<SearchResult:0x007fd189397be8 @title="War and Peace - Planet PDF">, #<SearchResult:0x007fd1893c6268 @title="War and Peace - Shmoop">, #<SearchResult:0x007fd1895fe0f8 @title="News for war and peace">]

SearchResult.first(keywords: "war and peace")
#=> #<SearchResult:0x007fd18be96588 @title="War and Peace - Wikipedia, the free encyclopedia">
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
