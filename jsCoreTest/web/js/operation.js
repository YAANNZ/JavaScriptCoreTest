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

var getImg = function (){
    var imgEle = document.getElementById("h5Img");
    var resultDict = jsCoreTest.getOCImg();
    if (resultDict['flag'] == '1') {
        imgEle.src = resultDict['imgPath'];
    } else {
        alert('获取失败');
    }
}
