 function addNewMembers(){
  var boardForList = document.getElementById('all_musicians');
  var bandId = document.getElementById('band_id').value;
  var memberUl = document.getElementById('member_list');
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
      if (checkMembership(musicianUsername)) return;
      toggleDisplay(boardForList);
      destroyList();
      getMusicianPosition(musicianUsername);
    }

    function getMusicianPosition(musicianUsername){
      var positionFormBox = document.getElementById('position_form');
      toggleDisplay(positionFormBox);
      document.getElementById('musician_name').innerHTML = musicianUsername;
      positionFormBox.children[0].addEventListener('submit', function(event){
        event.preventDefault();
        var musicianPosition = document.getElementById('input_position').value;
        refreshList(musicianUsername, musicianPosition);
        toggleDisplay(positionFormBox);
      });
    }

    function checkMembership(name){
      var callBack = false;
      var members = memberUl.children;
      for (var i = 0; i < members.length; i++) {
        var memberName = members[i].innerHTML;
        var sliceIn = memberName.indexOf('-');
        memberName = memberName.slice(0, (sliceIn - 1));
        if (memberName === name) callBack = true;
      }
      return callBack;
    }

    function regenerateBandMembersList(){
      memberUl.innerHTML = '';
      var url = ('/bands/' + bandId + '/members');
      var bandMembers = retrieveList(url);
      bandMembers.forEach(function(element){
        li = document.createElement('li');
        li.innerHTML = element.username + ' - ' + element.position;
        memberUl.appendChild(li);
      });
    }

    function refreshList(newName, newPosition){
      var xhReqPost = new XMLHttpRequest();
      xhReqPost.open("POST", '/bands/addmember');
      xhReqPost.send(JSON.stringify({'username': newName, 'position': newPosition, 'band_id': parseInt(bandId)}));
      regenerateBandMembersList();
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

$('document').ready(addNewMembers);;