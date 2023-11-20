from bottle import route, run, template, get, post, request
import sqlite3

@route('/')
def index():
    return template('index.tpl')


@post('/registered')
def registered():
    # capture information from user
    name = request.forms.get('name')
    number = request.forms.get('people')
    food = request.forms.get('food')
    if not name or not number or not food:
        return template('index.tpl')
    # insert captured information into database
    # group variables in parenthesis when passing them as values
    # don't forget to commit
    db = sqlite3.connect('rsvp.db')
    db.execute("INSERT INTO reserved (name,number,food) VALUES (?,?,?)", (name, number, food))
    db.commit()

    return template('registered.tpl', name=name, number=number, food=food)


@route('/going')
def going():
    db = sqlite3.connect('rsvp.db')
    # create cursor to run queries
    c = db.cursor()
    # capture data from the query
    c.execute("SELECT name,number,food FROM reserved")
    # data will be a list of tuples e.g. [('Mario', 2, 'beer'), ('Carlos', 3, 'appetizers')]
    data = c.fetchall()
    print(data)
    c.close()

    return template('going.tpl', data=data)

@route('/<food>')
def bring(food):
    db = sqlite3.connect('rsvp.db')
    c = db.cursor()
    # you have to pass the argument as a variable in a one-element tuple form, using a comma
    c.execute("SELECT name FROM reserved WHERE food=?", (food,))
    data =  c.fetchall()
    print(len(data))
    c.close()

    return template('going.tpl', data=data, food=food)


# run(host='localhost', reloader=True, port=8080)