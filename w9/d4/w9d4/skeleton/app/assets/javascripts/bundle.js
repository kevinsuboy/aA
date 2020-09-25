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
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/twitter.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

const APIUtil = {
    followUser: id => {
        return $.ajax({
            url: '/users/:id/follow',
            method: 'POST',
            dataType: 'JSON'
        }); 
    },

    unfollowUser: id => {
        return $.ajax({
            url: '/users/:id/follow',
            method: 'DELETE',
            dataType: 'JSON'
        });
    }
};

module.exports = APIUtil;

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js")

class FollowToggle {
    constructor($el){
        // const $el = $(".follow-toggle"); //class name
        this.userId = $el.data("user-id"); // will look ofr data-user-id
        this.followState = $el.data("initial-follow-state");
        this.$el = $el;
        debugger
        this.render();
        this.handleClick();
    }
    render(){
        debugger
        if (this.followState === "unfollowed"){
            this.$el.text("Follow!");
        } 
        if (this.followState === "followed") {
            this.$el.text("Unfollow!");
        }; 
    }

    handleClick(){
        this.$el.on("click", e =>{
            /* ... */
            e.preventDefault();
            this.$el.attr("disabled",true);
            debugger
            if (this.followState === "followed"){
                followUser(this.userId) //! AJAX (promise)
                    .then(()=> {
                        this.followState = "unfollowed"
                        this.render()
                    });
            } 
            if (this.followState === "unfollowed"){
                unfollowUser(this.userId) //! AJAX (promise)
                    .then(() => {
                        this.followState = "followed"
                        this.render()
                    });
            }
        });
    }
}


module.exports = FollowToggle




// $('#ajax_button').on('click', function () {

//     //Disable our button
//     $('#ajax_button').attr("disabled", true);

//     //The URL that we are sending an Ajax request to.
//     //For this example, I'm sending a Ajax request to the current page.
//     var url = window.location.href;

//     $.ajax({
//         url: url,
//         success: function (data) {
//             //The Ajax request was a success.
//             //Do something in here.
//         },
//         complete: function () {
//             //Ajax request is finished, so we can enable
//             //the button again.
//             $('#ajax_button').attr("disabled", false);
//         }
//     });
// });



/***/ }),

/***/ "./frontend/twitter.js":
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");


$(()=>{
    const $followToggles = $(".follow-toggle")
    const ft = []
    $followToggles.each((idx)=>{
        ft.push(new FollowToggle($followToggles.eq(idx)));
    });
    // debugger
    // JQ.each(CB)
})



/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map