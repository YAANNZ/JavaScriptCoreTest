var callOC = function (){
    var imgEle = document.getElementById("orgh5Img");
    jsCoreTest.callOC(imgEle.src);
}

var callOCBack = function (){
    alert('成功');
}

var callJs = function(imgPath)
{
	var imgEle = document.getElementById("h5Img");
    imgEle.src = imgPath;
    jsCoreTest.callJsBack('成功');
}


var revoke = function (){
    var imgEle = document.getElementById("h5Img");
    var orgimgEle = document.getElementById("orgh5Img");
    imgEle.src = orgimgEle.src;
}
