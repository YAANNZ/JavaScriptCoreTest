var callOC = function (){
    var imgEle = document.getElementById("orgh5Img");
    jsCoreTest.callOC(imgEle.src);
}

var callOCBack = function (typeStr){
    if (typeStr == 'success') {
        alert('成功');
    } else {
        alert('失败');
    }
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

// 仿phonegap交互
var getOCImg = function (){
    var imgEle = document.getElementById("h5Img");
    var resultDict = jsCoreTest.getOCImg();
    if (resultDict['flag'] == '1') {
        imgEle.src = resultDict['imgPath'];
    } else {
        alert('获取失败');
    }
}

var getJSImg = function (){
     var imgEle = document.getElementById("orgh5Img");
     var resultDict = new Array();
     if (imgEle.src) {
         resultDict['flag'] = '1';
     } else {
         resultDict['flag'] = '0';
     }
     resultDict['imgPath'] = imgEle.src;

     return resultDict;
}
