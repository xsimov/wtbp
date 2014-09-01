function popUpHTML(message) {
  var contentDiv = document.createElement('div');
  var insideParagraph = document.createElement('p');
  var closeButton = document.createElement('button');
  closeButton.id = 'closeButton';
  contentDiv.classList.add('content');
  insideParagraph.innerHTML = message;
  contentDiv.appendChild(insideParagraph);
  contentDiv.appendChild(closeButton);
  return contentDiv;
}