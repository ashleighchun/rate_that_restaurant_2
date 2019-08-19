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
      main.innerHTML += `
        <h3><b> Name:</b>  ${restaurant.name}</h3>
        <p><b>Location:</b>  ${restaurant.location}</p>
        <p><b>Cuisine: </b> ${restaurant.cuisine}</p>

        <button id="btn" data-id="${restaurant.id}">See Reviews</button>
      `

    if (restaurant.reviews.length === 0) {
      document.getElementById('btn').style.display = 'none'
    }else {
      document.getElementById('btn').addEventListener('click', getReviews)
    }
  })


} //button to 'See Reviews'

function getReviews(e) {
  e.preventDefault();
  let id = e.toElement.dataset.id
  let main = document.getElementById('main');
  main.innerHTML = '';
  fetch(BASE_URL + '/restaurants/' + id + '.json')
  .then(resp => resp.json())
  .then(restaurant => {
    main.innerHTML += restaurant.reviews.map(review => `
      <h4><b> Review Title:</b> ${review.title}</h4>
      <p><b>Customer Rating:</b>  ${review.rating}</p>
      <p><b>Price:</b>  ${review.price}</p>
      <p><b>Review: </b> ${review.content}</p>  <hr>
    `).join('')

  })

}

function createRestaurant() {
  let selector = document.getElementById('id_of_select'); //these two variables are defined to grab the select option value
  let value = selector[selector.selectedIndex].value;
  const restaurant = {
    name: document.getElementById('name').value,
    location: document.getElementById('location').value,
    cuisine: document.getElementById('id_of_select').value
  }
  fetch(BASE_URL + '/restaurants', {
    method: 'POST',
    body: JSON.stringify({ restaurant }),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  }).then(resp => resp.json())
  .then(restaurant => {
    console.log('restaurant',restaurant)
    if(restaurant.errors){
       document.querySelector("#main").innerHTML = restaurant.errors.join(' ');
       return
    }
    rest = new Restaurant_obj(restaurant)
    document.querySelector("#main").innerHTML += rest.renderRestaurant()
    let restaurantFormDiv = document.getElementById('restaurant-form');
    restaurantFormDiv.innerHTML = '';
  });
}

class Restaurant_obj {
    constructor(rest) {
      this.id = rest.id
      this.name = rest.name
      this.location = rest.location
      this.cuisine = rest.cuisine
    }
    renderRestaurant() {
      return `
        <h4>Restaurant Name: <a href="#" data-id="${this.id}">${this.name}</a></h4>
          <ul>
            <li>
              Location: ${this.location}
            </li>
            <li>
              Cuisine: ${this.cuisine}
            </li>
          </ul>
        `
    }

}

function attachClickToRestaurantLinks() {
  let restaurants = document.querySelectorAll('h4 a');
  for (let i = 0; i < restaurants.length; i++) {
    restaurants[i].addEventListener('click', displayRestaurant)
  }
}



window.addEventListener('load', function(){
  attachClickToRestaurantLinks();
})
