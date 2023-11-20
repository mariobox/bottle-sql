# RSVP App with Bottle and SQLite

This is a simple web application that let's users rsvp for a party, indicating their name, number of people coming with them, and what will they bring. This information is captured in an HTML form.

The app implements routes using the [Bottle](https://bottlepy.org) web framework. 

## Routes

1. `/` (or index route): This route renders the entry point to the app, and presents the user a web form to fill with their information. All fields are required. If any field is not completed, the app will re-route the user to the same page to try again. If all input has been entered and is valid, the user will be directed to a confirmation page where a message will indicate that their rsvp was successful.

2. `/registered` (successful registration page): This route uses the HTTP method `POST` (as indicated in the route decorator) and will show a "success" message  summarizing the information entered by the user (e.g. 'Mario party of 4 will bring beer')

3. `/going` (list of people attending): This route displays a list of the people who have rsvp'ed, together with the number of people coming with them and what will they bring

## Database

The app uses a SQLite database to store the information. The database is accessed from the app via connections, as needed. The two main operations are: add a user to the database (INSERT), and retrieve (SELECT) users for display in the attendees list. Before the database can be used it needs to be created and initialized with a table. For that, we run the following command: `python3 create_db.py` prior to running our app.

## Templates

The app uses Bottle's default Simple Template Engine. The header and the footer are stored in their own templates, which can be called by any other template. That way, if there are any changes to the header or footer we only have to change those pages instead of every page of our site. Our `going.tpl` template shows an implementation of a python `for` loop, to generate the `<li>` elements on the list of attendees. `for` loops, as well as `while` loops and `if-else` statements, need to be preceded by `%` and closed with `% end` in order to work.