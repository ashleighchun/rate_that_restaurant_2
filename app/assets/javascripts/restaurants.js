const BASE_URL = 'http://localhost:3000'

function getRestaurants() {
  clearForm();
  let main = document.getElementById('main');
  main.innerHTML = '<ul>';
  fetch(BASE_URL + '/restaurants.json')     //routing to the index
  .then(resp => resp.json())              //turn it into real json
  .then(restaurants => {
    main.innerHTML += restaurants.map(restaurant => `<li>$(restaurant.name)</li>`).join('')
    main.innerHTML += '</ul>'

    //attachClickToRestaurantLinks();   ---come back to this
  })
}

function clearForm(){
  let restaurantFormDiv= document.getElementById('review-form');
  restaurantFormDiv.innerHTML = '';
}
