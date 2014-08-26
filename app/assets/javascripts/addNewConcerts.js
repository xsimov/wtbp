function addNewConcert(){
  var newConcertDiv = document.getElementById('new_concert');
  document.getElementById('add_concert').addEventListener('click', function(event){
    toggleDisplay(newConcertDiv);
  });
}