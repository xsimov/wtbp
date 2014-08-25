function toggleDisplay(element){
  if (element.style.display !== 'block'){
    element.style.display = 'block';
    document.addEventListener('click', goBackOnGreyClick);
    return 'on';
  }
  element.style.display = 'none';
  return null;
}

function goBackOnGreyClick(event){
  if (event.target.className === 'greyed'){
    toggleDisplay(event.target);
    destroyAllMusiciansList();
    document.removeEventListener('click', goBackOnGreyClick);
  }
}

function destroyAllMusiciansList(){
  var ul = document.getElementById('all_musicians').children[0].children[0];
  ul.innerHTML = '';
}