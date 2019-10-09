User.create!(
  id: 1  
  email: 'test@test.com'
  password: 'password'
  password_confirmation: 'password'
  name: 'admin'
)

Artcile.create!(
  id: 1
  photo:
  comment: 'article_comment'
  user_id: 1
)