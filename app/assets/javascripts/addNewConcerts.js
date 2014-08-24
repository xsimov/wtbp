function addNewConcert(){
    var newConcertDiv = document.getElementById('new_concert');
    // newConcertDiv.style.display = 'none';
  document.getElementById('add_concert').addEventListener('click', function(event){
    toggleDisplay(newConcertDiv);
  });
}
$('document').ready(addNewConcert);