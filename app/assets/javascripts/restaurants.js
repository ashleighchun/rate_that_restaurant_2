function getRestaurants() {
  let main = document.getElementById('main')
  main.innerHTML = '<ul>'
  fetch("/restaurants")
  .then(response => response.json())
  then(data => {
    main.innerHTML += data.map(restaurant => {
      const r = new Restaurant(restuarant)
      return r.render()
    }).join('')
    main.innerHTML += '<ul>'
  })
}


class Restaurant {
  constructor(restaurant) {
    this.id = restaurant.id
    this.name = restaurant.name
    this.location = restaurant.location
    this.cuisine = restaurant.cuisine
  }

  render() {
    return `
    <li><a href="/restaurants/${this.id}">${this.name}</a></li>
    `
  }
}

window.addEventListener('load', (e) => {
  getRestaurants()
})
