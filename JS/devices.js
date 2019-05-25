function loadDevices(devices,switches){
  var doc="";
  for(let i=1;i<=devices.length;i++)
  {
    let onOff="<input type=\"checkbox\">";
    if(switches[i-1])
    {
      onOff = "<input type=\"checkbox\" checked>";
    }
    doc += `<tr>
        <td>`+ i +`.</td>
        <td>`+ devices[i-1] +`</td>
        <td>
          <label class="switch">
            `+onOff+`
            <span class="slider round"></span>
          </label>
        </td>
      </tr>`
  }
  document.getElementById("devices").innerHTML = doc;
}