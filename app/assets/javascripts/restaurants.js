const BASE_URL = 'http://localhost:3000'

function displayCreateForm(){
  let reviewFormDiv = document.getElementById('review-form');
  let html = `
  <form onsubmit="createReview(); return false;">
    <label>Title: </label>
    <input type="text" id="title"><br/>
    <label> Content: </label>
    <input type="text" id="content"><br/>
    <input type="submit" value="Submit Your Review">
  </form>
  `
  reviewFormDiv.innerHTML = html;
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

    //attachClickToRestaurantLinks();   ---come back to this
  })
}

function clearForm(){
  let restaurantFormDiv= document.getElementById('review-form');
  restaurantFormDiv.innerHTML = '';
}
