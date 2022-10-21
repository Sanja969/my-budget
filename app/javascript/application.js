// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "controllers"

  const search = document.querySelector(".search-header")
  const searchBox = document.querySelector(".search")
  search.addEventListener("click", () => {
    if (searchBox.style.display == "none") {
      searchBox.style.display = "block"
    }
    else {
      searchBox.style.display = "none"
    }
  });
  
