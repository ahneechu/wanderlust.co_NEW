# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Skill.destroy_all
Category.destroy_all
Mentor.destroy_all
Learner.destroy_all

ua = User.create(email:'sally@sally.com', salt: '$2a$10$WCTPJqaO6tR7ZXvf7o7WA.', hashed_password:'$2a$10$WCTPJqaO6tR7ZXvf7o7WA.P/tyViDUKbYceTPfmU7.Sjr3MJMgmI.')
ub = User.create(email:'theresa@theresa.com', salt: '$2a$10$j0gPSl7UGJEme28d5jehVe', hashed_password:'$2a$10$j0gPSl7UGJEme28d5jehVe6Z7JIl3SY8HknQzSgGc81fSb4.naaJy')
uc = User.create(email:'sam@sam.com', salt: '$2a$10$kLXjpnaS95/Xngmg1q.aGe', hashed_password:'$2a$10$kLXjpnaS95/Xngmg1q.aGeR.eBb7H99HuVwI/X2ehiyAwXYxgrYxO')
ud = User.create(email:'john@john.com', salt: '$2a$10$XymODwqeaF8.whAKxbXaB.', hashed_password:'$2a$10$XymODwqeaF8.whAKxbXaB.hauavwhZUrzoc6taAeReFgghyPwHwLG')
ue = User.create(email:'dan@dan.com', salt: '$2a$10$xi0Kq4Ji/XVgt3uFhqRndO', hashed_password:'$2a$10$xi0Kq4Ji/XVgt3uFhqRndOqRoFwypmdm9/F2vDLYnNjgyWBfrOMVO')
uf = User.create(email:'molly@molly.com', salt: '$2a$10$G2N0a3wPAZAIj3CQv6Xvh.', hashed_password:'$2a$10$G2N0a3wPAZAIj3CQv6Xvh.Xh7lhLLyBuzzCrTT6sS.z0C8WaxR1RC')


bs = Category.create(category_name: 'Business Skills')
as = Category.create(category_name: 'Academic Skills')
ls = Category.create(category_name: 'Life Skills')


bsm = bs.skills.create(skill_name: 'Marketing') 
bsc = bs.skills.create(skill_name: 'Contracts') 
bsp = bs.skills.create(skill_name: 'Presentation Techniques') 


lss = ls.skills.create(skill_name: 'Sewing') 
lsc = ls.skills.create(skill_name: 'Cooking') 
lsj = ls.skills.create(skill_name: 'Jewelry Making') 
lsp = ls.skills.create(skill_name: 'Photography') 


ase = as.skills.create(skill_name: 'English')
asm = as.skills.create(skill_name: 'Math') 
asc = as.skills.create(skill_name: 'Computer Training')

ma = Mentor.create!(user:ua, skills:[bsm], notes: 'i am a marketing pro! learn how to market yourself to get your dream job!')
mb = Mentor.create!(user:ub, skills:[lss], notes: 'i love sewing')
mc = Mentor.create!(user:uc, skills:[bsc], notes: 'i can teach you all about reading contracts')
md = Mentor.create!(user:ub, skills:[bsp], notes: 'learn how to make fun presentations')
me = Mentor.create!(user:uc, skills:[bsp], notes: 'i can show you some cool Photography tricks')

la = Learner.create!(user:ua, skills:[lsj], notes: 'i so interested in jewelry making!')
lb = Learner.create!(user:ud, skills:[bsm], notes: 'i want to learn marketing')
lc = Learner.create!(user:ue, skills:[asm], notes: 'i need help with my math homework')
ld = Learner.create!(user:uf, skills:[lsc], notes: 'i want to learn how to make a holiday meal')
le = Learner.create!(user:ub, skills:[lsc], notes: 'i want to learn how to bake a pie')
lf = Learner.create!(user:uf, skills:[asc], notes: 'i want to improve in my ms office skills')
lg = Learner.create!(user:ud, skills:[ase], notes: 'i like to improve in my English')

