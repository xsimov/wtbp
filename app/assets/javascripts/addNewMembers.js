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
      musiciansList = retrieveList("/musicians");
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
      refreshList(musicianUsername);
    }

    function regenerateList(){
      var ul = document.getElementById('member_list');
      ul.innerHTML = '';
      var url = ('/bands/' + bandId + '/members');
      var bandMembers = retrieveList(url);
      bandMembers.forEach(function(element){
        li = document.createElement('li');
        li.id = element.username;
        li.innerHTML = element.username;
        ul.appendChild(li);
      });
    }

    function refreshList(newName){
      var xhReqPost = new XMLHttpRequest();
      xhReqPost.open("POST", '/bands/addmember');
      xhReqPost.send(JSON.stringify({'username': newName, 'band_id': parseInt(bandId)}));
      regenerateList();
    }


    function retrieveList(url){
      var xhReq = new XMLHttpRequest();
      xhReq.open("GET", url, false);
      xhReq.send(null);
      var serverResponse = xhReq.responseText;
      return JSON.parse(serverResponse).musicians_list;
    }

  });

}

$('document').ready(addNewMembers);