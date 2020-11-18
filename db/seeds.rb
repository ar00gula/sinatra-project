books_list = {
    "Slippery Creatures" => {
      :author => "KJ Charles",
      :summary => "Will Darling came back from the Great War with a few scars, a lot of medals, and no idea what to do next. Inheriting his uncle’s chaotic second-hand bookshop is a blessing…until strange visitors start making threats. First a criminal gang, then the War Office, both telling Will to give them the information they want, or else.<br><br>

        Will has no idea what that information is, and nobody to turn to, until Kim Secretan—charming, cultured, oddly attractive—steps in to offer help. As Kim and Will try to find answers and outrun trouble, mutual desire grows along with the danger.<br><br>
        
        And then Will discovers the truth about Kim. His identity, his past, his real intentions. Enraged and betrayed, Will never wants to see him again. <br><br>
        
        But Will possesses knowledge that could cost thousands of lives. Enemies are closing in on him from all sides—and Kim is the only man who can help.<br><br>
        
        <i>A 1920s m/m romance trilogy in the spirit of Golden Age pulp fiction.</i>",
      :img_url => "../images/slippery-creatures.png"
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

admin = {
  "username" => "admin",
  "password" => "password"
}

user = User.create(admin)

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