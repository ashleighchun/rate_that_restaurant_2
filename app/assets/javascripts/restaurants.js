const BASE_URL = 'http://localhost:3000'

function getRestaurants() {
  clearForm();
  let main = document.getElementById('main');
  main.innerHTML = '<ul>';
  fetch(BASE_URL +'/restaurants.json')
  .then(resp => resp.json())
  .then(restaurants => {
    main.innerHTML += restaurants.map(restaurant => `<li><a href="#" data-id="$(restaurant.id)">$(restaurant.name)</a></li>`).join('')
    main.innerHTML += '</ul>'

    //attachClickToRestaurantLinks();   ---come back to this
  })
}

function clearForm(){
  let restaurantFormDiv= document.getElementById('review-form');
  restaurantFormDiv.innerHTML = '';
}
