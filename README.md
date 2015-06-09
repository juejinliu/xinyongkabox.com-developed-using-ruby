# Final project for Web Development class 

Finished by Yuan Gao

This project is also deployed on www.xinyongkabox.com using heroku

This project has 5 database backed models, including the Deal, Bookmark, Comment, Like and User Model.

Deal model are the most inportant model here, which has three sub-models: Bookmark, Comment and Like Models. 

Bookmark model are used for support bookmarking deals on the homepage, these bookmarks can be then viewed in My Account page after loggin in.

Comment model are used for supporting comment function on each deal by different users. After going to a certain deal's show page, users can comment on these deals. Here I also support the anonymous comment, and comments can only be added.

Like model are used for recording the user's likes on each deal, on the index page the users can click like and the website will record that like through Like model.

Among these the Deal model and the User model are in a many-to-many association, connected by the Bookmark Model.

I included a little sample data in the deals.json file under /db folder, these data are extracted from website dealmoon.com using a simple python script. 

------------------------------------------

The Deal is a complete Restful database-backed resource.

-------------------------------------------




