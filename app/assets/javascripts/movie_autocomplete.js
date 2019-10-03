const results = document.querySelector("#results");
const movie_name = document.querySelector("#movie_name");
const movie_director = document.querySelector("#movie_director");

let moviedata = []

const searchWords = (query) => {
  fetch(`http://www.omdbapi.com/?apikey=566591e3&s=${query}`)
    .then(response => response.json())
    .then((data) => {
      moviedata = data.Search
        data.Search.forEach((result) => {
          const word = `<li class="list-item movie_select">
            <a href="">${result.Title}</a> ${result.Year}
          </li>`;
          results.insertAdjacentHTML("beforeend", word);
        });
    });
};

movie_name.addEventListener('keyup', (event) => {
  event.preventDefault();
  console.log(movie_name.value);
  results.innerHTML = '';
  searchWords(movie_name.value);
});

function getEventTarget(e) {
  e = e || window.event;
  return e.target || e.srcElement;
}

results.addEventListener('click', (event) => {
  event.preventDefault();

    var movietarget = getEventTarget(event);
    console.log(movietarget.innerHTML)
    movie_name.value = movietarget.innerHTML


});

