
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    // debugger
    let children = Array.from(htmlElement.children)
    while(children.length > 0){ // kill your children
        htmlElement.removeChild(children.pop());
    }
    let new_p = document.createElement("p");
    let textnode = document.createTextNode(string); 
    new_p.appendChild(textnode);
    htmlElement.appendChild(new_p);
};

// htmlGenerator('Party Time.', partyHeader);