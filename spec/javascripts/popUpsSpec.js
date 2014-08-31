// include spec/javascripts/helpers/some_helper_file.js and app/assets/javascripts/foo.js
//= require popUpFuncs.js

describe('PopUp functions', function() {
  
  it('accepts an options object', function() {
    var element = document.getElementsByTagName('body')[0];
    var options = {
      message: 'Hello',
      kind: '',
      father: element
    };
    expect(popUp(options)).toEqual(0);
  });

  it('', function() {
    
  });
});