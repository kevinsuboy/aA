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

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection{\n    constructor(htmlEls){\n        this.htmlEls = htmlEls;\n    }\n    html(){\n        if(arguments.length){\n            // debugger\n            this.htmlEls.forEach(\n                el => el.innerHTML = arguments[0]\n            )\n            // debugger\n        } else return this.htmlEls[0].innerHTML;\n    }\n    empty(){\n        this.html(\"\");\n    }\n    append(args){\n        if(!(args instanceof DOMNodeCollection)) args = [args];\n        // debugger\n        this.htmlEls.forEach(\n            htmlEl => {\n                args.forEach(\n                    arg => {\n                        htmlEl.innerHTML += arg;\n                    }\n                )\n            }\n        )\n    }\n    // -----------------\n    attr(attrName){\n        // debugger\n        for(let i=0;i<this.htmlEls.length;i++){\n            let attrs = this.htmlEls[i].attributes;\n            if (attrs[attrName]) return attrs[attrName];\n        }\n    }\n    addClass(arg){\n        this.htmlEls.forEach(\n            htmlEl => htmlEl.classList.add(arg)\n        )\n    }\n    removeClass(arg){\n        this.htmlEls.forEach(\n            htmlEl => htmlEl.classList.remove(arg)\n        )\n    }\n    // -----------------\n    children(){\n        const res = [];\n        this.htmlEls.forEach(\n            htmlEl => res.push(...Array.from(htmlEl.children))\n        )\n        return new DOMNodeCollection(res);\n    }\n    parent(){\n        const res = [];\n        this.htmlEls.forEach(\n            htmlEl => res.push(htmlEl.parentElement)\n        )\n        return new DOMNodeCollection(res);\n    }\n    find(arg){\n        const res = [];\n        this.htmlEls.forEach(\n            htmlEl => res.push(...htmlEl.querySelectorAll(arg))\n        )\n        return new DOMNodeCollection(Array.from(res));\n    }\n    remove(){\n        while(this.htmlEls.length>0){ this.htmlEls.pop().remove(); }\n    }\n}\n\nmodule.exports = {\n    DOMNodeCollection\n}\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _dom_node_collection_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./dom_node_collection.js */ \"./src/dom_node_collection.js\");\n/* harmony import */ var _dom_node_collection_js__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_dom_node_collection_js__WEBPACK_IMPORTED_MODULE_0__);\n\n\nwindow.$l = $l;\n\nfunction $l(selector){\n    if(selector instanceof HTMLElement){\n        return new _dom_node_collection_js__WEBPACK_IMPORTED_MODULE_0__[\"DOMNodeCollection\"]([HTMLElement]);\n    }\n    return new _dom_node_collection_js__WEBPACK_IMPORTED_MODULE_0__[\"DOMNodeCollection\"](Array.from(document.querySelectorAll(selector)));\n}\n\nlet d = window.$l(\"ul\");\n// d.html(\"<h2>Heading</h2>\");\nd.append(\"<li> Item1 </li>\")\nd.attr(\"id\")\nd.addClass(\"poop\")\n// debugger\nd.removeClass(\"poop\")\n\nlet c = d.children()\nlet p = d.parent()\n\nd.find(\"li\")\n// d.remove();\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });