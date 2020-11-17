books_list = {
    "Slippery Creatures" => {
      :author => "KJ Charles"
    },
    "The Sugared Game" => {
        :author => "KJ Charles"
    },
    "The Magpie Lord" => {
        :author => "KJ Charles"
    },"A Case Of Posession" => {
        :author => "KJ Charles"
    },
    "Flight of Magpies" => {
        :author => "KJ Charles"
    },
    "Jackdaw" => {
        :author => "KJ Charles"
    },
    "A Queer Trade" => {
        :author => "KJ Charles"
    },
    "Rag and Bone" => {
        :author => "KJ Charles"
    }
  }

books_list.each do |title, book_hash|
  b = Book.new
  b.title = title
  book_hash.each do |attribute, value|
      b[attribute] = value
  end
  b.save
end

tag_list = {
    "hurt/comfort" => {
    },
    "historical" => {
    },
    "political" => {
    },
    "faerie politics" => { 
    }
  }

tag_list.each do |name, tag_hash|
  t = Tag.new
  t.name = name
  t.save
end


user_list = {
    "aroogula" => {
        :password => "password"
    },
    "jaloona" => {
        :password => "drowssap"
    }
  }

user_list.each do |username, user_hash|
  u = User.new
  u.username = username
  user_hash.each do |attribute, value|
    u[attribute] = value
    end
  u.save
end