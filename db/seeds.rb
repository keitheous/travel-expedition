# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name:"Wolf",password:"apple");
User.create(name:"Emily",password:"apple");
User.create(name:"LJ",password:"apple");
User.create(name:"Keithy",password:"apple");
Card.create(title:"test0",user_id:1);
Card.create(title:"test1",user_id:1);
Card.create(title:"mountain",user_id:1);
Card.create(title:"waterfall",user_id:1);
Card.create(title:"test2",user_id:2);
Card.create(title:"test3",user_id:2);
Card.create(title:"test3",user_id:3);
Card.create(title:"test3",user_id:4);
Country.create(name:"Aussie");
Country.create(name:"US");
Country.create(name:"China");
CountryCard.create(country_id:1,card_id:1);
CountryCard.create(country_id:1,card_id:1);
CountryCard.create(country_id:2,card_id:2);
CountryCard.create(country_id:3,card_id:3);
CountryCard.create(country_id:3,card_id:4);
Tag.create(name:"food");
Tag.create(name:"activity");
Tag.create(name:"mountain");
Tag.create(name:"beach");
CardTag.create(card_id: 1, tag_id:1);
CardTag.create(card_id: 1, tag_id:2);
CardTag.create(card_id: 2, tag_id:1);
CardTag.create(card_id: 3, tag_id:3);
CardTag.create(card_id: 4, tag_id:4);

