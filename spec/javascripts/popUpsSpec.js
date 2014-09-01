//= require popUpFuncs.js

describe('PopUp functions', function() {
  context('the htmlCreator', function() {
    it('returns a div.content containing the message it recieved', function() {
      var contentDiv = document.createElement('div');
      var insideParagraph = document.createElement('p');
      contentDiv.classList.add('content');
      insideParagraph.innerHTML = 'hello';
      contentDiv.appendChild(insideParagraph);
      expect(htmlCreator('hello')).toBe(contentDiv);
    });
  });
});