
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator(dogs){
  const arrDogLinks = [];
  for(let key of Object.keys(dogs)){ // for each dog
    let new_a = document.createElement("a");
    new_a.href = dogs[key];
    let new_li = document.createElement("li");
    new_li.classList.add("dog-link");
    new_a.innerText = key;
    new_li.appendChild(new_a);
    arrDogLinks.push(new_li);
  }
  // debuggercss
  return arrDogLinks;
}
function attachDogLinks(cb,dogs){
  const DogLinks = cb(dogs);
  const ul = Array.from(document.getElementsByClassName("drop-down-dog-list"))[0];
  debugger
  DogLinks.forEach(
    li => ul.appendChild(li)
  )
}
function handleEnter(el,ul){
  debugger
  el.addEventListener("mouseover",()=>{ //! mouseover bubbles
    ul.classList.remove("drop-down-dog-list")
    ul.classList.add("drop-down-shown")
  });
}
function handleLeave(el, ul) {
  el.addEventListener("mouseleave", () => { //! mouseover bubbles
    ul.classList.remove("drop-down-shown")
    ul.classList.add("drop-down-dog-list")
  });
}
attachDogLinks(dogLinkCreator,dogs)

const nav = Array.from(document.getElementsByClassName("drop-down-dog-nav"))[0];
const ul = Array.from(document.getElementsByClassName("drop-down-dog-list"))[0];
handleEnter(nav, ul);
handleLeave(nav, ul);
