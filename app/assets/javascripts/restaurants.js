const BASE_URL = 'http://localhost:3000'

function displayCreateForm(){
  let restaurantFormDiv = document.getElementById('restaurant-form');
  let html = `
  <form onsubmit="createRestaurant(); return false;">
    <label>Restaurant Name: </label>
    <input type="text" id="name"><br/>
    <label> Location: </label>
    <input type="text" id="location"><br/>
    <label> Cuisine: </label>
    <select>
      <option value="breakfastBrunch">Breakfast & Brunch</option>
      <option value="cafe">Cafe</option>
      <option value="comfortFood">Comfort Food</option>
      <option value="diner">Diner</option>
      <option value="fastFood">Fast Food</option>
      <option value="formal">Formal</option>
      <option value="gastropub">Gastropub</option>
      <option value="specialtyFood">Specialty Food</option>
      <option value="steakhouse">Steakhouse</option>
      <option value="tapas">Tapa/Small Platess</option>
      <option value="vegan" selected>Vegan</option>
      <option value="vegetarian" selected>Vegetarian</option>
    </select><br/>
    <input type="submit" value="Create Restaurant">
  </form>
  `
  restaurantFormDiv.innerHTML = html;
}


function getRestaurants() {
  clearForm();
  let main = document.getElementById('main');
  main.innerHTML = '<ul>';
  fetch(BASE_URL + '/restaurants.json')     //routing to the index
  .then(resp => resp.json())              //turn it into real json
  .then(restaurants => {
    main.innerHTML += restaurants.map(restaurant => `
      <h4>Restaurant Name: <a href="#" data-id="${restaurant.id}">${restaurant.name}</a></h4>
        <ul>
          <li>
            Location: ${restaurant.location}
          </li>
          <li>
            Cuisine: ${restaurant.cuisine}
          </li>
          <li>
            Average Rating: ${restaurant.reviews.average_rating} Stars
          </li>
        </ul>
      `).join('')
    main.innerHTML += '</ul>'

    attachClickToRestaurantLinks();
  })
}

function clearForm(){
  let restaurantFormDiv= document.getElementById('restaurant-form');
  restaurantFormDiv.innerHTML = '';
}

function displayRestaurant(e) {
  e.preventDefault();
  clearForm();
  let id = this.dataset.id;
  let main = document.getElementById('main');
  main.innerHTML = '';

  fetch(BASE_URL + '/restaurants/' + id + '.json')
    .then(resp => resp.json())
    .then(restaurant => {
      main.innerHTML += ``;
      main.innerHTML += ``
    })
}

function createRestaurant() {
  const restaurant = {
    name: document.getElementById('name').value,
    location: document.getElementById('location').value,
    cuisine: document.getElementById('cuisine').value
  }
  fetch(BASE_URL +'/todos', {
    method: 'POST',
    body: JSON.stringify({ restaurant }),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  }).then(resp => resp.json())
  .then(restaurant => {
    document.querySelector("#main ul").innerHTML += `<li>${todo.title} </li>`
    let restaurantFormDiv = document.getElementById('restaurant-form');
    restaurantFormDiv.innerHTML = '';
  })
}

function attachClickToRestaurantLinks() {
  let restaurants = document.querySelectorAll('li a');
  for (let i = 0; i < restaurants.length; i++) {
    restaurants[i].addEventListener('click', displayRestaurant)
  }
}

window.addEventListener('load', function(){
  attachClickToRestaurantLinks();
})
