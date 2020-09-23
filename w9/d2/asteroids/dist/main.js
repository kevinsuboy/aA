/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\nfunction Asteroid(options){\n    const COLOR = \"red\";\n    const RADIUS = 10;\n    MovingObject.call(this,{\n        pos: options.pos,\n        vel: Util.randomVec(10),\n        radius: RADIUS,\n        color: COLOR,\n        game: options.game\n    });\n}\nUtil.inherits(Asteroid, MovingObject);\n\n\nAsteroid.prototype.collideWith = function(obj){\n    // console.log('ship hit!!!')\n    if(obj instanceof Ship){\n        // debugger\n        obj.relocate();\n    }\n}\n\nmodule.exports = Asteroid;\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/bullet.js":
/*!***********************!*\
  !*** ./src/bullet.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\nfunction Bullet(options){\n    const RADIUS = 20;\n    const COLOR = \"blue\";\n    MovingObject.call(this, {\n        pos: options.pos,\n        vel: options.vel, // Util.randomVec(0),\n        radius: RADIUS,\n        color: COLOR,\n        game: options.game\n    });\n}\nUtil.inherits(Bullet, MovingObject);\n\n\n//# sourceURL=webpack:///./src/bullet.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\");\n\nfunction Game(){\n    this.DIM_X = 1000;\n    this.DIM_Y = 1000;\n    this.NUM_ASTEROIDS = 4;\n    this.addAsteroids();\n    this.ship = new Ship({\n        pos: this.randomPosition(),\n        game: this\n    });\n}\nGame.prototype.addAsteroids = function() {\n    this.asteroids = [];\n    for(let i = 0; i < this.NUM_ASTEROIDS; i++){\n        this.asteroids.push(new Asteroid({\n            pos: this.randomPosition(),\n            game: this\n        }));\n    }\n    // debugger\n    return true;\n}\nGame.prototype.randomPosition = function() {\n    // debugger\n    return [Math.floor(Math.random() * this.DIM_X), Math.floor(Math.random() * this.DIM_Y)];\n}\nGame.prototype.draw = function(ctx) {\n    // debugger\n    ctx.clearRect(0,0,this.DIM_X,this.DIM_Y);\n    this.allObjects().forEach(\n        el => el.draw(ctx)\n    );\n}\nGame.prototype.moveObjects = function() {\n    debugger\n    this.allObjects().forEach(\n        el => el.move()\n    );\n}\nGame.prototype.wrap = function(pos) {\n    pos[0] = (pos[0] + this.DIM_X) % this.DIM_X;\n    pos[1] = (pos[1] + this.DIM_Y) % this.DIM_Y;\n    return pos;\n}\nGame.prototype.checkCollisions = function() {\n    let allObjs = this.allObjects();\n    for(let i = 0; i<allObjs.length; i++){\n        for(let j = 0; j<allObjs.length; j++){\n            if(i!==j){\n                if (allObjs[i].isCollidedWith(allObjs[j])){\n                    // alert(\"COLLISION\");\n                    (allObjs[i]).collideWith(allObjs[j]);\n                }\n            }\n        }\n    }\n}\nGame.prototype.allObjects = function() {\n    return [...this.asteroids,this.ship]\n}\n\nGame.prototype.step = function() {\n    this.moveObjects();\n    this.checkCollisions();\n}\nGame.prototype.remove = function(asteroid){\n    let i = this.asteroids.indexOf(asteroid);\n    this.asteroids.splice(i,1);\n}\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function GameView(game,ctx){\n    this.game = game;\n    this.ctx = ctx;\n}\nGameView.prototype.start = function () {\n    // debugger\n    let g = this.game;\n    let c = this.ctx;\n    // g.draw(c);\n    this.bindKeyHandlers();\n    setInterval(function(){\n        g.step.bind(g)();\n        g.draw(c);\n        console.log('moved asteroids');\n    }, 20);\n}\nGameView.MOVES = {\n    w: [0, -1],\n    a: [-1, 0],\n    s: [0, 1],\n    d: [1, 0],\n};\nGameView.prototype.bindKeyHandlers = function() {\n    const ship = this.game.ship;\n    Object.keys(GameView.MOVES).forEach(function (k) {\n        const move = GameView.MOVES[k];\n        key(k, function () { ship.power(move); });\n    });\n\n    // key(\"space\", function () { ship.fireBullet(); });\n}\n\nmodule.exports = GameView;\n\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// const rectangle = require(\"./rectangle.js\")\n//window.rectangle = rectangle\n\nconsole.log(\"Webpack is working!\")\n\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\")\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\")\nwindow.Asteroid = Asteroid;\nwindow.MovingObject = MovingObject;\n\n\ndocument.addEventListener(\"DOMContentLoaded\", function () {\n    const canvas = document.getElementById('game-canvas');\n    const ctx = canvas.getContext('2d');\n    // const mo = new MovingObject({\n    //     pos: [30, 30],\n    //     vel: [10, 10],\n    //     radius: 5,\n    //     color: \"#00FF00\"\n    // });\n    // mo.draw(ctx);\n    // const ast = new Asteroid({\n    //     pos: [100,100]\n    // });\n    // ast.draw(ctx);\n    const g = new Game();\n    const gv = new GameView(g, ctx);\n    gv.start();\n    // let ast = g.asteroids;\n    // ast[0].draw(ctx);\n    // debugger\n});\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\n\nfunction MovingObject(options){\n    this.pos = options.pos;\n    this.vel = options.vel;\n    this.radius = options.radius;\n    this.color = options.color;\n    this.game = options.game;\n};\n\nMovingObject.prototype.draw = function(ctx) {\n    // debugger;\n    ctx.beginPath();\n    ctx.arc(\n        this.pos[0],\n        this.pos[1],\n        this.radius,\n        0,\n        2*Math.PI,\n        false\n    );\n    ctx.fillStyle = this.color;\n    ctx.fill();\n}\n\nMovingObject.prototype.move = function() {\n    // re-eval pos\n    // debugger\n    this.pos[0] += this.vel[0];\n    this.pos[1] += this.vel[1];\n    this.pos = this.game.wrap(this.pos);\n}\nMovingObject.prototype.isCollidedWith = function(obj){\n    return Util.dist(this.pos,obj.pos) <= (this.radius+obj.radius);\n}\nMovingObject.prototype.collideWith = function(obj){\n    // this.game.remove(obj);\n    // this.game.remove(this);\n}\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\");\n\nfunction Ship(options) {\n    const RADIUS = 20;\n    const COLOR = \"blue\";\n    MovingObject.call(this, {\n        pos: options.pos,\n        vel: [0,0], // Util.randomVec(0),\n        radius: RADIUS,\n        color: COLOR,\n        game: options.game\n    });\n\n}\nUtil.inherits(Ship, MovingObject);\n\nShip.prototype.relocate = function(){\n    this.pos = this.game.randomPosition();\n    this.vel = [0,0];\n}\nShip.prototype.power = function(impulse){\n    this.vel[0] += impulse[0];\n    this.vel[1] += impulse[1];\n}\nShip.prototype.fireBullet = function(){\n    return new Bullet({\n        pos: this.pos,\n        vel: this.vel\n    });\n}\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\nconst Util = {\n    inherits (childClass, parentClass) {\n        function Surrogate(){};\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n    },\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    },\n    // distance b/w 2 pts\n    dist(pos1, pos2){\n        return Math.sqrt((pos1[0] - pos2[0]) ** 2 + (pos1[1] - pos2[1]) ** 2);\n    }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });