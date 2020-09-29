class DOMNodeCollection{
    constructor(htmlEls){
        this.htmlEls = htmlEls;
    }
    html(){
        if(arguments.length){
            // debugger
            this.htmlEls.forEach(
                el => el.innerHTML = arguments[0]
            )
            // debugger
        } else return this.htmlEls[0].innerHTML;
    }
    empty(){
        this.html("");
    }
    append(args){
        if(!(args instanceof DOMNodeCollection)) args = [args];
        // debugger
        this.htmlEls.forEach(
            htmlEl => {
                args.forEach(
                    arg => {
                        htmlEl.innerHTML += arg;
                    }
                )
            }
        )
    }
    // -----------------
    attr(attrName){
        // debugger
        for(let i=0;i<this.htmlEls.length;i++){
            let attrs = this.htmlEls[i].attributes;
            if (attrs[attrName]) return attrs[attrName];
        }
    }
    addClass(arg){
        this.htmlEls.forEach(
            htmlEl => htmlEl.classList.add(arg)
        )
    }
    removeClass(arg){
        this.htmlEls.forEach(
            htmlEl => htmlEl.classList.remove(arg)
        )
    }
    // -----------------
    children(){
        const res = [];
        this.htmlEls.forEach(
            htmlEl => res.push(...Array.from(htmlEl.children))
        )
        return new DOMNodeCollection(res);
    }
    parent(){
        const res = [];
        this.htmlEls.forEach(
            htmlEl => res.push(htmlEl.parentElement)
        )
        return new DOMNodeCollection(res);
    }
    find(arg){
        const res = [];
        this.htmlEls.forEach(
            htmlEl => res.push(...htmlEl.querySelectorAll(arg))
        )
        return new DOMNodeCollection(Array.from(res));
    }
    remove(){
        while(this.htmlEls.length>0){ this.htmlEls.pop().remove(); }
    }
}

module.exports = {
    DOMNodeCollection
}