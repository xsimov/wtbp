//= require popUpFuncs.js

describe('the popUpHTML function', function() {
  it('returns a div.content containing the message it recieved', function() {
    expect(popUpHTML('hello').classList[0]).toEqual('content');
    expect(popUpHTML('hello').children[0].innerHTML).toEqual('hello');
    expect(popUpHTML('hello').children[0].innerHTML).toEqual('hello');
    expect(popUpHTML('hello').children[1].nodeName).toEqual('BUTTON');
    expect(popUpHTML('hello').children[1].id).toEqual('closeButton');
  });
});