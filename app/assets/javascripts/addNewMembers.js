function addNewMembers(){
  var boardForList = document.getElementById('all_musicians');
  var bandId = document.getElementById('band_id').value;
  var memberUl = document.getElementById('member_list');
  var positionFormBox = document.getElementById('position_form');
  var backButton = document.getElementById('back_to_list');
  boardForList.style.display = 'none';
  var musiciansList;
  var ul = boardForList.children[0].children[0];
  var li;
  
  document.getElementById('add_member').addEventListener('click', function(event){
    toggleDisplay(boardForList);
    writeList();
    
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

    function addMemberToBand(event){
      var musicianUsername = event.target.id;
      if (checkMembership(musicianUsername)) return;
      toggleDisplay(boardForList);
      ul.removeEventListener('click', addMemberToBand);
      destroyAllMusiciansList();
      getMusicianPosition(musicianUsername);
    }

    function getMusicianPosition(musicianUsername){
      toggleDisplay(positionFormBox);
      document.getElementById('musician_name').innerHTML = musicianUsername;
      positionFormBox.children[0].addEventListener('submit', function goToPosition(event){
        event.preventDefault();
        var musicianPosition = document.getElementById('input_position').value;
        refreshList(musicianUsername, musicianPosition);
        toggleDisplay(positionFormBox);
        document.getElementById('input_position').value = '';
        positionFormBox.children[0].removeEventListener('submit', goToPosition);
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

  });

}