/*
 * Used as a model: lgToggle.js by David J. Birnbaum at http://repertorium.obdurodon.org
*/


 function init () {
  var initials = document.getElementsByClassName('initial');
  for (i = 0; i < initials.length; i++) {
   initials[i].addEventListener('click', changeLang, false);
  }
}

 function changeLang() {
  var id = this.id;
  var gls = document.getElementsByClassName('gl');
  var glsLength = gls.length;
  var ens = document.getElementsByClassName('en');
  var ensLength = ens.length;
  var initialImgs = document.querySelectorAll('.initial > img');
  var initialImgsLength = initialImgs.length;
  for (i = 0; i < initialImgsLength; i++) {
    if (initialImgs[i].parentNode.id == id) {
      initialImgs[i].style.boxShadow = '4px 4px 4px darkred';
    } else {
      initialImgs[i].style.boxShadow = 'none';
    }
  }
  switch (id) {
    case 'gl':
    for (var i = 0; i < glsLength; i++) {
      gls[i].style.display = 'block';
    }
    for (var i = 0; i < ensLength; i++) {
      ens[i].style.display = 'none';
    }
    break;
    case 'en':
    for (var i = 0; i < glsLength; i++) {
      gls[i].style.display = 'none';
    }
    for (var i = 0; i < ensLength; i++) {
      ens[i].style.display = 'block';
    }
    
  }
}

 window.addEventListener('load',init,false);
