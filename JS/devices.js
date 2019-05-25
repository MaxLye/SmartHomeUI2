function loadDevices(area) {
  //var doc="";
  $.get("http://192.168.31.16:8000/loaditems/" + area, function (data) {
    var doc = "";
    console.log(data);
    var itemList = JSON.parse(data);
    for (var i = 1; i <= itemList.length; i++) {
      var onOff = "<input type=\"checkbox\" onclick=\"turnSwitch("+itemList[i - 1]["ID"]+");\">";
      if (itemList[i - 1]["Status"] == 1) {
        onOff = "<input type=\"checkbox\" onclick=\"turnSwitch("+itemList[i - 1]["ID"]+");\" checked>";
      }
      doc += `<tr><td>` + i + `.</td><td>` + itemList[i - 1]["Name"] + `</td><td><label class="switch">` + onOff + `<span class="slider round"></span></label></td></tr>`
    }
    $("#devices").html(doc);
  });
  //document.getElementById("devices").innerHTML = doc;
}

function turnSwitch(id){
  
}