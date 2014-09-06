#Planning

Models:
Users - need their own pages
Churches - need
Post(Reviews & Tweets)
Churches
    Name
    Location => auto populate based on    zip code
Voting
Follow is now Connect

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

Routes:
# reviews need to be post
Reviews.belongs_to :users, :churches
Tweets.belongs_to :users
Users follow churches but not belong to them
Vote churches and for reviews
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

