// Below are codes used for practice
// For concise summary, visit: http://javascript.info/javascript-specials

// It’s always recommended to start scripts with "use strict"
"use strict"
alert("I'm Javascript imported from alert.js");

alert("Counting");

[1, 2].forEach(alert)

let user = 'John',
 	age = 25,
 	message = 'Hello';

const myBirthday = '18.04.1982';
// myBirthday = '01.01.2001'; // error, can't reassign the constant!

// Uppercase constants
const COLOR_ORANGE = "#FF7F00";

const pageLoadTime = /* time taken by a webpage to load */;

// let – is a modern variable declaration. The code must be in strict mode to use let in Chrome (V8).
// var – is an old-school variable declaration. Normally we don’t use it at all.
// const – is like let, but the value of the variable can’t be changed.

// // Working with variables
// Declare two variables: admin and name.
// Assign the value "John" to name.
// Copy the value from name to admin.
// Show the value of admin using alert (must output “John”).
let admin, name;
name = 'John';
admin = name;
alert(admin);

// Giving the right name
// Create the variable with the name of our planet. How would you name such a variable?
// Create the variable to store the name of the current visitor. How would you name that variable?
let planet = 'Earth';
let visitor = 'Nemo';

alert( 1 / 0 );// Infinity
alert( "not a number" / 2 ); // NaN, such division is erroneous


// In JavaScript, there are 3 types of quotes.

// Double quotes: "Hello".
// Single quotes: 'Hello'.
// Backticks: `Hello`.

let name = "John";
// embed a variable
alert( `Hello, ${name}!` ); // Hello, John!

// embed an expression
alert( `the result is ${1 + 2}` ); // the result is 3

let x;

alert(x); // shows "undefined"

// It supports two forms of syntax:

// As an operator: typeof x.
// Function style: typeof(x).
alert(typeof 0) // "number"
alert(typeof Symbol("id")) // "symbol"

let name = "Ilya";

// the expression is a number 1
alert( `hello ${1}` ); // hello 1

// the expression is a string "name"
alert( `hello ${"name"}` ); // hello name

// the expression is a variable, embed it
alert( `hello ${name}` ); // hello Ilya

let value = true;
alert(typeof value); // boolean

value = String(value); // now value is a string "true"
alert(typeof value); // string

let str = "123";
alert(typeof str); // string

let num = Number(str); // becomes a number 123

alert(typeof num); // number


// Value	Becomes…
// undefined	NaN
// null	0
// true and false	1 and 0
// string	Whitespaces from the start and the end are removed. Then, if the remaining string is empty, the result is 0. Otherwise, the number is “read” from the string. An error gives NaN.

alert( 1 + '2' + 3); // '123' (string to the right)
alert( '1' + 2 +3); // '123' (string to the left)

alert( Boolean(1) ); // true
alert( Boolean(0) ); // false

alert( Boolean("hello") ); // true
alert( Boolean("") ); // false

alert( 2 - '1' ); // 1
alert( '6' / '2' ); // 3

let counter = 1;
alert( 2 * ++counter ); // 4

let counter = 1;
alert( 2 * counter++ ); // 2, because counter++ returns the "old" value

// AND ( & )
// OR ( | )
// XOR ( ^ )
// NOT ( ~ )
// LEFT SHIFT ( << )
// RIGHT SHIFT ( >> )
// ZERO-FILL RIGHT SHIFT ( >>> )

// For a strict equality check ===
// For a non-strict check ==

let age = prompt('How old are you?', 100 );// The second parameter is optional. But if we don’t supply it, Internet Explorer would insert the text "undefined" into the prompt.

alert(`You are ${age} years old!`); // You are 100 years old!

let isBoss = confirm("Are you the boss?");

alert( isBoss ); // true if OK is pressed

let year = prompt('In which year was ECMAScript-2015 specification published?', '');
if (year == 2015) {
  alert( "That's correct!" );
  alert( "You're so smart!" );
}

let year = prompt('In which year was ECMAScript-2015 specification published?', '');

if (year < 2015) {
  alert( 'Too early...' );
} else if (year > 2015) {
  alert( 'Too late' );
} else {
  alert( 'Exactly!' );
}

let accessAllowed = age > 18 ? true : false;

// Using the if..else construct, write the code which asks: ‘What is the “official” name of JavaScript?’

// If the visitor enters “ECMAScript”, then output “Right!”, otherwise – output: “Didn’t know? ECMAScript!”
let nameEntered = prompt(`What is the “official” name of JavaScript?`)
if(nameEntered == 'ECMAScript'){
	alert('Right!')
}
else{
	alert(`You don't know? "ECMAScript"!`)
}

// Check the login
user = prompt("Knock, knock, race condition, who's there?")
if (user=='Admin'){
	password = prompt("Password?")
	if(password == 'TheMaster'){
		alert('Welcome')
	}
	else if(password == null){
		alert('Canceled.')
	}
	else{
		alert('Wrong password')
	}
}
else if (user == null){
	alert('Canceled.')
}
else{
	alert("I don't know you.")
}

// Rewrite this if using the ternary operator '?':
result = (a+b<4)? 'Below':'Over';

let message = (login == 'Employee') ? 'Hello' :
  (login == 'Director') ? 'Greetings' :
  (login == '') ? 'No login' :
  '';

if (age >= 14 && age <= 90)

for (let i = 0; i < 3; i++) { // shows 0, then 1, then 2
  alert(i);
}

for (let i = 0; i < 10; i++) {

  // if true, skip the remaining part of the body
  if (i % 2 == 0) continue; // The directive continue helps to decrease nesting level

  alert(i); // 1, then 3, 5, 7, 9
}

outer: for (let i = 0; i < 3; i++) {

  for (let j = 0; j < 3; j++) {

    let input = prompt(`Value at coords (${i},${j})`, '');

    // if an empty string or canceled, then break out of both loops
    if (!input) break outer; // (*)

    // do something with the value...
  }
}
alert('Done!');

let num;

do {
  num = prompt("Enter a number greater than 100?", 0);
} while (num <= 100 && num);

while (num <= 100 && num){ // This won't run
	num = prompt("Enter a number greater than 100?", 0);
}

let n = 10;

nextPrime:
for (let i = 2; i <= n; i++) { // for each i...

  for (let j = 2; j < i; j++) { // look for a divisor..
    if (i % j == 0) continue nextPrime; // not a prime, go next i
  }

  alert( i ); // a prime
}

let a = 2 + 2;

switch (a) {
  case 3:
    alert( 'Too small' );
    break;
  case 4:
    alert( 'Exactly!' );
    break;
  case 5: // (*) grouped two cases
  case 6:
    alert( 'Too large' );
    break;
  default:
    alert( "I don't know such values" );
}

let a = +prompt('a?', ''); //this line converts input a into a number

switch (a) {
  case 0:
    alert( 0 );
    break;

  case 1:
    alert( 1 );
    break;

  case 2:
  case 3:
    alert( '2,3' );
    break;
}

function showPrimes(n) {

  for (let i = 2; i < n; i++) {
    if (!isPrime(i)) continue;

    alert(i);  // a prime
  }
}

function isPrime(n) {
  for (let i = 2; i < n; i++) {
    if ( n % i == 0) return false;
  }
  return true;
}

function checkAge(age) {
  return (age > 18) ? true : confirm('Did parents allow you?');
}

function checkAge(age) {
  return (age > 18) || confirm('Did parents allow you?');
}

function min(a, b) {
  return a < b ? a : b;
}

function sayHi() {   // (1) create
  alert( "Hello" );
}

let func = sayHi;    // (2) copy

func(); // Hello     // (3) run the copy (it works)!
sayHi(); // Hello    //     this still works too (why wouldn't it)

// There might be a question, why does Function Expression have a semicolon ; at the end, and Function Declaration does not:
function sayHi() {
  // ...
}

let sayHi = function() {
  // ...
};

function ask(question, yes, no) {
  if (confirm(question)) yes()
  else no();
}

reply = confirm('Call me maybe?');
alert(reply); // prints boolean

ask(
  "Do you agree?",
  function() { alert("You agreed."); },
  function() { alert("You canceled the execution."); }
);

function ask(question, yes, no) {
  if (confirm(question)) yes()
  else no();
}

ask(
  "Do you agree?",
  () => alert("You agreed."),
  () => alert("You canceled the execution.")
);

// As a rule of thumb, when we need to declare a function, the first to consider is Function Declaration syntax, the one we used before. It gives more freedom in how to organize our code, because we can call such functions before they are declared.

// It’s also a little bit easier to look up function f(…) {…} in the code than let f = function(…) {…}. Function Declarations are more “eye-catching”.

// …But if a Function Declaration does not suit us for some reason (we’ve seen an example above), then Function Expression should be used.

let sum = (a, b) => a + b;

alert( sum(1, 2) ); // 3