function onRecievingFocus(event){
    console.log('in');
  if (event.target.value === 'Type to search...') {
    event.target.classList.add('active');
    event.target.value = '';
  }
}

function onLosingFocus(event){
  if (event.target.value === '') {
    event.target.classList.remove('active');
    event.target.value = 'Type to search...';
  }
}

function startListening(){
var searchField = document.getElementById('search');
  searchField.addEventListener('focusin', onRecievingFocus);
  searchField.addEventListener('focusout', onLosingFocus);
}

$('document').ready(startListening);