puts 'seeding'

# users ##
dan = User.create(username:'Dan Theman', password: '123', email:'fyfedaniel@gmail.com', first_name: 'Dan', last_name: 'Fyfe', image:'https://i.imgur.com/KmHDi3Q.jpg')

meylin = User.create(username:'Meylin', password:'123', email:'meylinlopez08@gmail.com', first_name: 'Meylin', last_name: 'Lopez', image:'https://i.imgur.com/cvortXR.jpg')

bob = User.create(username:'Bob', password:'123', email:'bob@bob.com', first_name: 'Bob', last_name: 'Also Bob')

kevin = User.create(username:'Kevin', password:'123', email:'kevin@kevin.com', first_name: 'Kevin', last_name: 'Also Kevin')
john = User.create(username:'John', password:'123', email:'john@john.com', first_name: 'John', last_name: 'Also John')
jane = User.create(username:'jane', password:'123', email:'jane@jane.com', first_name: 'Jane', last_name: 'Also Jane')

# requests
FollowRequest.create(user_id: dan.id, follower_id: meylin.id, accepted:false)
FollowRequest.create(user_id: dan.id, follower_id: bob.id, accepted:false)

## events ##
dan_birthday = Event.create(title:"Dan's Birthday", start:DateTime.new(2019,5,27,12,30), end:DateTime.new(2019,5,27,11,30), description:"Part for Dan's brithday! Bring stuff so he doesn't have to take care of all of you! Wooooooo! It will be fun! WOOO!", password:"123", owner_id: dan.id)

db_budget = Budget.create(event_id: dan_birthday.id)

cake = Cost.create(budget_id: db_budget.id, user_id: dan.id, name:'Cake', description: 'birthday cake', price:25)

UserEvent.create(user_id: dan.id, event_id: dan_birthday.id)


big_party = Event.create(title:'Big Party!!', start:DateTime.new(2019,6,2,12,30), end:DateTime.new(2019,6,2,22,30), description:'Big ol party! Getting together to have fun. Blah, blah, blah, blah', password:'123', owner_id:  meylin.id)

Budget.create(event_id: big_party.id)

UserEvent.create(user_id: meylin.id, event_id: big_party.id)

# invites #

Invite.create(user_id: dan.id, event_id: big_party.id)
Invite.create(user_id: bob.id, event_id: big_party.id)

Invite.create(user_id: bob.id, event_id: dan_birthday.id)

# messages #

message1 = Message.create(user_id: dan.id, event_id: dan_birthday.id, title:'Whatever!', content:'Placeholder message! WAAAA')

# replies #
Reply.create(user_id: meylin.id, message_id: message1.id, content: 'BLHASDFKKLSDFJ!')

puts 'done seeding'