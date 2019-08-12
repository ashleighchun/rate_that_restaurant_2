$(function (){
  console.log('restaurants.js is loaded...')
  listenForClick()
});

function listenForClick() {
  $('button#restaurants-data').on('click', function (event) {
    event.preventDefault()
    getRestaurants()
  })
}
