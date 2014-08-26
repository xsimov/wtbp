function eraseText(event){
  event.target.value = '';
}

function putTextAgain(event){
  if (event.target.value === '') {
    event.target.value = 'Type to search...';
  }
}

function searchFieldFormat(){
  var searchField = document.getElementById('search');
  searchField.addEventListener('focusin', eraseText);
  searchField.addEventListener('focusout', putTextAgain);
}
