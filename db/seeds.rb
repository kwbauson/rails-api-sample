user = User.create!(first_name: 'Colton', last_name: 'Nerd', age: 420)
post = user.posts.create!(title: 'i am')
user.posts.create!(title: 'a nerd')
user.memes.create!(content: 'alas, i am memed')
user.memes.create!(content: 'big oof')
user.memes.create!(content: 'admire you!!')

post.pages.create!(title: 'p1')
post.pages.create!(title: 'p2')
