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
    <select id="id_of_select">
      <option value="Breakfast and Brunch">Breakfast and Brunch</option>
      <option value="Cafe">Cafe</option>
      <option value="Comfort Food">Comfort Food</option>
      <option value="Diner">Diner</option>
      <option value="Fast Food">Fast Food</option>
      <option value="Formal">Formal</option>
      <option value="Gastropub">Gastropub</option>
      <option value="Specialty Food">Specialty Food</option>
      <option value="Steakhouse">Steakhouse</option>
      <option value="Tapa/Small Platess">Tapa/Small Platess</option>
      <option value="Vegan">Vegan</option>
      <option value="Vegetarian">Vegetarian</option>
    </select><br/>
    <input type="submit" value="Create Restaurant">
  </form>
  `
  restaurantFormDiv.innerHTML = html;
}


function getRestaurants() {
  //clearForm();
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
        </ul>
      `).join('')
    main.innerHTML += '</ul>'

    attachClickToRestaurantLinks();
  })
}

function clearForm(){
  let restaurantFormDiv = document.getElementById('restaurant-form');
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
      main.innerHTML += `<h3>${restaurant.name}</h3>`;
      main.innerHTML += `<p>${restaurant.location}</p>`;
      main.innerHTML += `<p>${restaurant.cuisine}</p>`
      main.innerHTML += `<p>${restaurant.reviews.average_rating}</p>`
    })
}

function createRestaurant() {
  let selector = document.getElementById('id_of_select');
  let value = selector[selector.selectedIndex].value;
  const restaurant = {
    name: document.getElementById('name').value,
    location: document.getElementById('location').value,
    cuisine: document.getElementById('id_of_select').value
  }
  debugger
  fetch(BASE_URL + '/restaurants', {
    method: 'POST',
    body: JSON.stringify({ restaurant }),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  }).then(resp => resp.json())
  .then(restaurant => {
    document.querySelector("#main").innerHTML += `
    <h4>Restaurant Name: <a href="#" data-id="${restaurant.id}">${restaurant.name}</a></h4>
    <li>
      Location: ${restaurant.location}
    </li>
    <li>
      Cuisine: ${restaurant.cuisine}
    </li>
    `
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
