const FollowToggle = require("./follow_toggle.js");


$(()=>{
    const $followToggles = $(".follow-toggle")
    const ft = []
    $followToggles.each((idx)=>{
        ft.push(new FollowToggle($followToggles.eq(idx)));
    });
    // debugger
    // JQ.each(CB)
})

