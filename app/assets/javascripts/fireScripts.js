var fireFunctions = function(){
  var notice = document.getElementById('notice');
  var alert = document.getElementById('alert');
  if (document.getElementById('add_member') !== null) addNewMembers();
  if (document.getElementById('new_concert') !== null) addNewConcert();
  if (document.getElementById('search') !== null) searchFieldFormat();
  if (notice.innerHTML !== '') toggleDisplay(notice.parentNode);
  if (alert.innerHTML !== '') toggleDisplay(alert.parentNode);
  if (document.getElementById('embeddedCalendar') !== null) setupCalendar();
}

$('document').ready(fireFunctions);
// $('document').on('page:change', fireFunctions);