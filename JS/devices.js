function loadDevices(area) {
  $.get("http://192.168.31.16:8000/loaditems/" + area, function (data) {
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
  var status = $('#'+EName).prop('checked')?"on":"off";
  $.post("http://192.168.31.16:8000/action/"+area+"/"+EName+"/"+status,{"token":"abc123"}, function(data){
    console.log(data);
  });
}