const APIUtil = require('./api_util.js')

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

