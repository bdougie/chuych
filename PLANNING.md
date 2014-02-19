#Planning

roadmap.md


Models:
Users
Churches
Reviews
Tweets
Churches
    Name
    Location => auto populate based on    zip code
Voting
Follow


Views:
Tweets(similar)
    Index
    Show
     Create: choose what church you attend 
Reviews
    Index show
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


----- similar sites
churchrater.com
churchfinder.com

