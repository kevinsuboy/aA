const Shape = require("./shape.js");
const Rectangle = require('./rectangle.js');
const Circle = require("./circle.js");

window.Shape = Shape;
window.Rectangle = Rectangle;
window.Circle = Circle;

// window.banana = "banana";p
window.blueRectangle = new Rectangle("blue",1,2);