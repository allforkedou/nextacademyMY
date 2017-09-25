document.getElementById('demo1').innerHTML = 'Hello World';

var x = document.getElementsByTagName("p");
document.getElementById("demo2").innerHTML = 
'The first paragraph (index 0) is: ' + x[0].innerHTML;

var x = document.getElementById("main1");
var y = x.getElementsByTagName("p");
document.getElementById("demo3").innerHTML = 
'The first paragraph (index 0) inside "main" is: ' + y[0].innerHTML;

// querySelectorAll only works for class
var x = document.querySelectorAll("p.intro"); 
document.getElementById("demo4").innerHTML = 
'The first paragraph (index 0) with class="intro": ' + x[0].innerHTML;

function myFunction() {
var x = document.forms["frm1"];
var text = "";
var i;
for (i = 0; i < x.length ;i++) {
    text += x.elements[i].value + "<br>";
}
document.getElementById("demo5").innerHTML = text;
}

document.write(Date()); //This line will always get pushed to the lowest

// Change attribute by document.getElementById(id).attribute = new value
// document.getElementById("myImage").src = "landscape.jpg";

document.getElementById("demo6").style.color = "blue";

function myMove() {
  var elem = document.getElementById("animate");   
  var pos = 0;
  // var id = setInterval(frame, 500);
  function frame() {
    if (pos == 350) {
      clearInterval(id);
    } else {
      pos++; 
      elem.style.top = pos + 'px'; 
      elem.style.left = pos + 'px'; 
    }
  }
}

function displayDate() {
    document.getElementById("demo8").innerHTML = Date();
}

function upper() {
var x = document.getElementById("fname");
x.value = x.value.toUpperCase();
}

function mOver(obj) {
obj.innerHTML = "Thank You"
}

function mOut(obj) {
    obj.innerHTML = "Mouse Over Me"
}

function mDown(obj) {
    obj.style.backgroundColor = "#1ec5e5";
    obj.innerHTML = "Release Me";
}

function mUp(obj) {
    obj.style.backgroundColor="#00FB42";
    obj.innerHTML="Thank You";
}

function annoying() {
	alert('Annoying right? Told you.')
}

var x = document.getElementById("annoyingBtn");
x.addEventListener("click", annoying1);
x.addEventListener("click", annoying2);

function annoying1() {
    alert ("annoying one hehe!");
}

function annoying2() {
    alert ("annoying two kakaka!");
}

window.addEventListener("resize", function(){
document.getElementById("demo").innerHTML = Math.random();
});

// function removeHandler() {
//    document.getElementById("myDIV").removeEventListener("mousemove", myFunction);
// }

document.getElementById("demo10").innerHTML = document.getElementById("demo9").childNodes[0].nodeValue + " This is copied from previous line";

// alert(document.body.innerHTML);
var myCollection = document.getElementsByTagName("p");
document.getElementById("demo11").innerHTML = 
"This document contains " + myCollection.length + " paragraphs.";

function colorAll() {
	let myCollection = document.getElementsByTagName("p");
	for (let i=0; i<myCollection.length; i++){
		myCollection[i].style.color = 'red';
	}
}