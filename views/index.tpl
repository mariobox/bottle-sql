% include('header.tpl')
  <p>
    This is an RSVP app written in Python, using the Bottle framework.
  </p> 
    
    <form action="/registered" method="post">
    <h2>Register here:</h2>
    <input autocomplete="off" required autofocus name="name" placeholder="Name" type="text">
    <select name="people">
        <option disabled required selected>No. of Guests</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
    </select>
    <h3>What will you bring?</h3>
    
    <p><input name="food" type="radio" required id="appetizers" value="appetizers"> <label for="appetizers">Appetizers</label></p>
    <p><input name="food" type="radio" id="salad" value="salad"> <label for="salad">Salad</label></p>
    <p><input name="food" type="radio" id="dessert" value="dessert"> <label for="dessert">Dessert</label></p>
    <p><input name="food" type="radio" id="beer" value="beer"> <label for="beer">Beer</label></p>
    <p><input name="food" type="radio" id="wine" value="wine"> <label for="wine">Wine</label></p>

    <p><button type="submit">Reserve</button></p>
</form>
 
% include('footer.tpl')