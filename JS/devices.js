function loadDevices(area) {
  $.get(getServerHost()+"loaditems/" + area, function (data) {
    var doc = "";
    console.log(data);
    var itemList = JSON.parse(data);
    for (var i = 1; i <= itemList.length; i++) {
      var onOff = "<input type=\"checkbox\" id="+itemList[i - 1]["EName"]+" onclick=\"turnSwitch('"+itemList[i - 1]["EName"]+"','"+area+"');\">";
      if (itemList[i - 1]["Status"] == 1) {
        onOff = "<input type=\"checkbox\" id="+itemList[i - 1]["EName"]+" onclick=\"turnSwitch('"+itemList[i - 1]["EName"]+"','"+area+"');\" checked>";
      }
      doc += `<tr><td>` + i + `.</td><td>` + itemList[i - 1]["Name"] + `</td><td><label class="switch">` + onOff + `<span class="slider round"></span></label></td></tr>`
    }
    $("#devices").html(doc);
  });
}

function turnSwitch(EName,area){
  getServerHost();
  var status = $('#'+EName).prop('checked')?"on":"off";
  $.post(getServerHost()+"action/"+area+"/"+EName+"/"+status,{"token":readCookie("token")}, function(data){
    console.log(data);
    location.reload();
  });
}

/////////////////////////  Cookies ///////////////////////////////////
function createCookie(cname,cvalue,days) {
	if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = cname+"="+cvalue+expires+"; path=/";
}
function readCookie(cname) {
	var nameEQ = cname + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}
function eraseCookie(cname) {
	createCookie(cname,"",-1);
}
//////////////////////////////////////////////////////////////////////
function getServerHost(){
  if(window.location.hostname == "home.ahlye.com")
  {
    return "http://home.ahlye.com:30888/";
  }
  else
  {
    return "http://192.168.31.16:8000/";
  }
}

setTimeout(function(){
  window.location.reload(1);
}, 30000);