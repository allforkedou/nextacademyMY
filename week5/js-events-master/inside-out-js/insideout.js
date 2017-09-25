// get a random integer (this is used to return a random element from an array)
function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min;
}

// create a clear button. This function will be called in addEmotion()
function createClearBtn(){

  //create a button element
  clearBtn = document.createElement('button');
  
  // [STUDENT] Find out what setAttribute does.
  clearBtn.setAttribute('id', 'clear');
  clearBtn.innerHTML = 'Clear';

  // configure the button's alignment so that it is at the center 
  clearBtn.style.display = 'table';
  clearBtn.style.margin = '20px auto';

	// add an event listener to this button  
  clearBtn.addEventListener('click', clearEmotion);

  return clearBtn;
}

// clear the text in emo-circle
function clearEmotion(){
	// get the p tag with id 'emotion'
  emotion = document.getElementById('emotion');
  emotion.innerHTML = "";

}

function addEmotion(){

	// if there is no clear button, create it
  if(!document.getElementById('clear')){
	  
	  // create a clear button
	  clearBtn = createClearBtn();

	  //insert the button after 'emo-circle'
	  //Reference: https://plainjs.com/javascript/manipulation/insert-an-element-after-or-before-another-32/
  	emotionCircle = document.getElementById('emo-circle');
  	emotionCircle.parentNode.insertBefore(clearBtn, emotionCircle.nextSibling);    

  }
  
  emoArray = ['Joy', 'Sadness', 'Anger', 'Fear', 'Disgust'];
  arrayLength = emoArray.length;
  rand = getRandomInt(0, arrayLength);
  console.log(rand);

  // get the p tag with id 'emotion' and use innerHTML to change the value inside the p tag
  emotion = document.getElementById('emotion');
  emotion.innerHTML = emoArray[rand];

} // end of function addEmotion


// attach the function addEmotion to the "emo-circle"  
function addEmotionListener(){
  addEmotionCircle = document.getElementById('emo-circle');
  addEmotionCircle.addEventListener("click", addEmotion);
}

// wait for DOM content to load before binding an event
document.addEventListener('DOMContentLoaded', addEmotionListener);