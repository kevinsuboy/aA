import * as DOM from "./dom_node_collection.js"

window.$l = $l;

function $l(selector){
    if(selector instanceof HTMLElement){
        return new DOM.DOMNodeCollection([HTMLElement]);
    }
    return new DOM.DOMNodeCollection(Array.from(document.querySelectorAll(selector)));
}

let d = window.$l("ul");
// d.html("<h2>Heading</h2>");
d.append("<li> Item1 </li>")
d.attr("id")
d.addClass("poop")
// debugger
d.removeClass("poop")

let c = d.children()
let p = d.parent()

d.find("li")
// d.remove();