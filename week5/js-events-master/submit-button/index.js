function getEncryptedWord() {

  //get the word input by the user
  var str = document.getElementById("word").value;
  console.log(str); //remember to open your developer's tool in the browswer and open up the console log so that you can see this function in action

  //change the first letter of the word to "b"
  // debugger // what happens if you uncomment out the "debugger"?
  str = str.replace(str[0], "ba");
  console.log(str)

  //add "nana" at the end of the word
	str += "nana"
  console.log(str);

  
  //change the HTML content of a <p> element with id="encrypted-word": 
  document.getElementById("encrypted-word").innerHTML = "Your new word is: " + str;

} //end of function getEncryptedWord()

document.addEventListener('DOMContentLoaded', function(){
    document.getElementById('event-btn').addEventListener("click", getEncryptedWord);
});