User.create!(
             email: 'natsumi2004neko@gmail.com',
             password: '2004Natsumi',
             password_confirmation: '2004Natsumi',
             admin: true)

Tag.create([
  { name: 'タグ1' },  
  { name: 'タグ2' },
  { name: 'タグ3' },
  { name: 'タグ4' },
  { name: 'タグ5' }
])             