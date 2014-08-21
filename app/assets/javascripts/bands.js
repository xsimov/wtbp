 function addNewMembers(){
  var boardForList = document.getElementById('all_musicians');
  var bandId = document.getElementById('band_id').value;
  boardForList.style.display = 'none';

  document.getElementById('add_member').addEventListener('click', function(event){
    var musiciansList;
    var ul = boardForList.children[0];
    var li;

    if (toggleDisplay(boardForList) === null){
      destroyList();
    } else {
      writeList();
    }

    function writeList(){
      musiciansList = retrieveList();
      musiciansList.forEach(function(element){
        li = document.createElement('li');
        li.id = element.username;
        li.innerHTML = element.username;
        ul.appendChild(li);
      });
      ul.addEventListener('click', addMemberToBand);
    }

    function destroyList(){
      ul.innerHTML = '';
      ul.removeEventListener('click', addMemberToBand);
    }

    function addMemberToBand(event){
      var musicianUsername = event.target.id;
      console.log(musicianUsername);
      refreshList(musicianUsername);
    }

  });

  function refreshList(newName){
    var xhReqPost = new XMLHttpRequest();
    xhReqPost.open("POST", '/bands/addmember');
    console.log(JSON.stringify({'username': newName, 'band_id': parseInt(bandId)}));
    xhReqPost.send(JSON.stringify({'username': newName, 'band_id': bandId}));
  }

  function retrieveList(){
    var xhReq = new XMLHttpRequest();
    xhReq.open("GET", "/musicians", false);
    xhReq.send(null);
    var serverResponse = xhReq.responseText;
    return JSON.parse(serverResponse).musicians_list;
  }

  function toggleDisplay(element){
    if (element.style.display === 'none'){
      element.style.display = 'block';
      return 'on';
    }
    element.style.display = 'none';
    return null;
  }
}

$('document').ready(addNewMembers);