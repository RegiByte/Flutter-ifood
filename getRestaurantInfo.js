function getRestaurantsInfo() {
	const restaurants = document.querySelectorAll('.restaurant-card')
	return Array.from(restaurants).map(restaurant => {
		let name = restaurant.querySelector('.restaurant-name').innerText
		let picture = restaurant.querySelector('img').src
		let [rating, foodType, distance] = restaurant.querySelector('.restaurant-card__info').innerText.split('•')
		let [deliveryTime, deliveryPrice] = restaurant.querySelector('.restaurant-card__footer').innerText.split('•')

		return {
			name,
			picture,
			rating,
			foodType,
			distance,
			deliveryTime,
			deliveryPrice
        }
    })
}