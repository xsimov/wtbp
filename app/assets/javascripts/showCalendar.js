function setupCalendar(){
  g_globalObject = new JsDatePick({
    useMode:1,
    isStripped:true,
    cellColorScheme:"beige",
    target:"embeddedCalendar"
    /*selectedDate:{        This is an example of what the full configuration offers.
      day:5,            For full documentation about these settings please see the full version of the code.
      month:9,
      year:2006
    },
    yearsRange:[1978,2020],
    limitToToday:false,
    dateFormat:"%m-%d-%Y",
    imgPath:"img/",
    weekStartDay:1*/
  });   

  g_globalObject.setOnSelectedDelegate(function(){
    var obj = g_globalObject.getSelectedDay();
    alert("a date was just selected and the date is : " + obj.day + "/" + obj.month + "/" + obj.year);
    document.getElementById("datePicker").innerHTML = obj.day + "/" + obj.month + "/" + obj.year;
  });
  console.log('yay!');
}
