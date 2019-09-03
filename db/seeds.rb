puts 'seeding'

# users ##
dan = User.create(username:'Dan Theman', password: '123', email:'fyfedaniel@gmail.com', first_name: 'Dan', last_name: 'Fyfe', image:'https://i.imgur.com/KmHDi3Q.jpg'  )

meylin = User.create(username:'Meylin', password:'123', email:'meylinlopez08@gmail.com', first_name: 'Meylin', last_name: 'Lopez', image:'https://i.imgur.com/cvortXR.jpg')

## events ##
dan_birthday = Event.create(title:"Dan's Birthday", start:DateTime.new(2019,5,27,12,30), end:DateTime.new(2019,5,27,11,30), description:"Part for Dan's brithday! Bring stuff so he doesn't have to take care of all of you! Wooooooo! It will be fun! WOOO!", password:"123", owner_id: dan.id)

UserEvent.create(user_id: dan.id, event_id: dan_birthday.id)


big_party = Event.create(title:'Big Party!!', start:DateTime.new(2019,6,2,12,30), end:DateTime.new(2019,6,2,22,30), description:'Big ol party! Getting together to have fun. Blah, blah, blah, blah', password:'123', owner_id:  meylin.id)

UserEvent.create(user_id: meylin.id, event_id: big_party.id)





puts 'done seeding'