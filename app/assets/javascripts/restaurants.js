$(document).ready(function () {

})

//create an object
class Review{
  constructor(id, title, content, rating, price, user_id, restaurant_id){
    this.id = id
    this.title = title
    this.content = content
    this.rating = rating
    this.price = price
    this.user_id = user_id
    this.restaurant_id = restaurant_id
  }

  //prototypes act like instance methods for a new object
  //this prototype will take the json object and return html
  //to be appended to DOM
  Review.prototype.reviewHTML = function(){
    let newHTML = " "
    newHtml += `<li>`
    newHtml += `<b>Review Title:</b> ${this.title} <br>`
    newHtml += `<b>Content:</b>${this.content}<br>`
    newHtml += `<b>Rating:</b>${this.rating}<br>`
    newHtml += `</li>`
    return newHtml
  };
}
