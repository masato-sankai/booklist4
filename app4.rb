require 'sinatra'
require 'mysql2'

get '/' do
  client = Mysql2::Client.new(host: 'localhost', username: 'root', database: 'booklist4', encoding: 'utf8')
  @records = client.query("SELECT * FROM booklist4.books4 ORDER BY id")
  erb :booklist4
end

post '/' do
  client = Mysql2::Client.new(host: 'localhost', username: 'root', database: 'booklist4', encoding: 'utf8')
  
  # 書籍タイトルの保存
  book_title = params['book_title']
  statement = client.prepare('INSERT INTO books4 (book_title) VALUES(?)')
  statement.execute(book_title)
  
  #書籍タイトルの一覧取得
  @records = client.query("SELECT * FROM booklist4.books4 ORDER BY id")
  
  erb :booklist4
end