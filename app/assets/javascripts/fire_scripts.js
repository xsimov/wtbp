var fireFunctions = function(){
  console.log('Search switch');
  if (document.getElementById('add_member') !== null) addNewMembers();
  if (document.getElementById('new_concert') !== null) addNewConcerts();
  if (document.getElementById('search') !== null) searchFieldFormat();
}

$('document').ready(fireFunctions);
$('document').on('page:change', fireFunctions);