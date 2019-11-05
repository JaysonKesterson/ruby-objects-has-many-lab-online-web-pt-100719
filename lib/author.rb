require 'pry'
class Author
  attr_accessor :name
  
  @@authors = []
  
  def initialize(name)
    @name = name
    @@authors << self
  end
  
  def add_post(post)
    post.author = self
  end
  
   def self.authors
    @@authors
  end
  
  def add_post_by_title(title)
    new_post = Post.new(title)
    add_post(new_post)
  end
  
  def posts
    Post.all.select{|post|post.author == self}
  end
  
  
  def self.post_count
   post_count = self.authors.collect{|author|author.posts}
   post_count.flatten.count
  end
  
end