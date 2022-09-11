# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

utilisateur1 = User.create!(phone_number: "0633185717", name: "Marie", last_name: "Bernard")
utilisateur2 = User.create!(phone_number: "0633185711", name: "Laura", last_name: "Durand")
utilisateur3 = User.create!(phone_number: "0633185712", name: "Lucas", last_name: "Deville")
utilisateur4 = User.create!(phone_number: "0633185713", name: "Jean", last_name: "Junior")
utilisateur5 = User.create!(phone_number: "0633185736", name: "Laurent", last_name: "Perrin")
utilisateur6 = User.create!(phone_number: "0633185740", name: "Pierre", last_name: "Chemarin")



chat_1 = Chat.create!
user_chat_1 = UserChat.create!(chat: chat_1, user_id: 2)
user_chat_2 = UserChat.create!(chat: chat_1, user_id: 1)
conversation1 = Message.create!(text: "Salut toi comment tu vas?", sender_id: 1, chat:chat_1)
conversation2 = Message.create!(text: "Super bien, je passe un test technique pour Kinoba!", sender_id: 2, chat:chat_1)
conversation3 = Message.create!(text: "Ah ba super je suis contente pour toi! Bonne chance", sender_id: 1, chat:chat_1)
conversation4 = Message.create!(text: "Merci beaucoup !", sender_id: 2, chat:chat_1)

chat_2 = Chat.create!
user_chat_3 = UserChat.create!(chat: chat_2, user_id: 3)
user_chat_4 = UserChat.create!(chat: chat_2, user_id: 4)
conversation5 = Message.create!(text: "Salut toi comment tu vas? Tu as passé de bonnes vacances?", sender_id: 3, chat:chat_2)
conversation6 = Message.create!(text: "Ca va super bien et toi? Je reviens de Tahiti! C'était  incroyable ! Et toi tu es parti en vacances?", sender_id: 1, chat:chat_2)
conversation7 = Message.create!(text: "Wahou ! Ca devait être génial !! Et non, j'ai travaillé cet été", sender_id: 3, chat:chat_2)
conversation8 = Message.create!(text: "Ba j'espère que tu vas pouvoir prendre des congés bientot!", sender_id: 1, chat:chat_2)

chat_3 = Chat.create!
user_chat_5 = UserChat.create!(chat: chat_3, user_id: 5)
user_chat_6 = UserChat.create!(chat: chat_3, user_id: 6)
conversation9 = Message.create!(text: "Salut toi comment tu vas? Tu as quelque chose de prévu ce weekend?", sender_id: 1, chat:chat_3)
conversation10 = Message.create!(text: "Non rien de prévu pour l'instant, tu as une idée?", sender_id: 6, chat:chat_3)
conversation11 = Message.create!(text: "Oui ! Il y a le festival de jazz dans le vieux lyon à partir de jeudi soir !", sender_id: 1, chat:chat_3)
conversation12 = Message.create!(text: "Super ! Allons y!", sender_id: 6, chat:chat_3)
