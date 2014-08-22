function toggleDisplay(element){
  if (element.style.display !== 'block'){
    element.style.display = 'block';
    return 'on';
  }
  element.style.display = 'none';
  return null;
}