#Planning

Models:
Users
Churches
Post(Reviews & Tweets)
Churches
    Name
    Location => auto populate based on    zip code
Voting
Follow


Views:
Post(similar) - index/welcome
    Index
    Show
     Create: choose what church you attend 

Users
Churches
    Name
    Location => auto populate based on    zip code
    
Login
Lead or sign up page.
    Have an approval system to allow new users.

Controllers:
Tweets
    CRUD
Reviews
    CRUD
Users
Churches
Voting 
Follow

Routes:
Reviews.belongs_to :users, :churches 
Tweets.belongs_to :users
Users can belong_to :churches bit not required.
Vote churches
Follow churches


    Roles:
Member
Moderator
Admin

Gems
Instagram API, receive pictures
Facebook API, login and share to
Twitter API, login and share to, receive tweet
CarrieWave, or something similar 
Minimagic
Rspec, test all models and pages, possibly controllers 


Searching:
Sun spot gem
http://railscasts.com/episodes/278-search-with-sunspot
custom searching using contolrollr
'''
 @churches = Church.where('name LIKE %', params[:q])
 params = {q: 'something'}
''''

Location 
http://www.rubygeocoder.com/
@churches = Church.where('name = %', params[:name]).near(params[:near])

----- similar sites
churchrater.com
churchfinder.com

extract tags with acts_as_taggable
http://stackoverflow.com/questions/5307331/implementing-twitter-like-hashtag-on-rails

***favorite 'church' but 'like' posts
reviews will be post and only short messages. church will have a rating later.

http://www.gothamcoworking.com/#/

foursquare

