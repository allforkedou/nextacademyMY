function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min;
 }

function randomRestaurant(){
	//Yes, food != restaurant, but I choose to eat by food :/
	restaurantArray = ['Sushi', 'Xiaolongbao', 'Shumai', 'Ramen', 'Sai'];
	arrayLength = restaurantArray.length;
	rand = getRandomInt(0, arrayLength);

	restaurant = document.getElementById('restaurant');
	restaurant.innerHTML = restaurantArray[rand];
}

var rollingId;

function startRolling(){
	rollingId = setInterval(randomRestaurant, 200);
}

function stopRolling(){
	clearInterval(rollingId);
}

function addRestaurantListener(){
  startBtn = document.getElementById('start-random-button');
  // Replace 'functionName' with the name of the function that you have written
  startBtn.addEventListener("click", startRolling);

  getBtn = document.getElementById('get-restaurant-button');
  
  // Replace 'functionName' with the name of the function that you have written
  getBtn.addEventListener("click", stopRolling);
}

// wait for DOM content to load before binding an event
document.addEventListener('DOMContentLoaded', addRestaurantListener);