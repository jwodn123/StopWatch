<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
  <head>
    <title>스톱워치</title>
  </head>
  <body>

    <div>
      <div>
        <input id="record" type="button" value="LAP" />
        <input id="start" type="button" value="START" />
        <input id="stop" type="button" value="STOP" />
        <input id="reset" type="button" value="RESET" />
        <br><br>
      </div>

      <div>
        <span id="min">00</span>
        <span>:</span>
        <span id="sec">00</span>
        <span>.</span>
        <span id="millisec">00</span>
      </div>


      <div>
        <span>--------------------------</span>
        <ul id="lapList"></ul>
      </div>


    </div>



    <script type="text/javascript">

      let stTime = 0
      let endTime = 0
      let timerStart
      let curTime
      let min, sec, millisec

      document.getElementById('start').addEventListener("click", function () {

          if(!stTime) {
            stTime = Date.now() // Date.now() = Date.getTime()
          } else {
            stTime += (Date.now() - endTime)
          }

          timerStart = setInterval(function() {
            curTime = new Date(Date.now() - stTime)

            min = addZero(curTime.getMinutes())
            sec = addZero(curTime.getSeconds())
            millisec = addZero(Math.floor(curTime.getMilliseconds() / 10))

            document.getElementById('min').innerText = min
            document.getElementById('sec').innerText = sec
            document.getElementById('millisec').innerText = millisec
       }, 1);

      });

      function addZero(num) {
        return (num < 10 ? '0'+num : ''+num)
      }

      document.getElementById('record').addEventListener('click', function() {
        let recordList = document.getElementById('lapList')
        let li = document.createElement('li')
        li.innerText = min + ":" + sec + "." + millisec

        if(!recordList.firstChild) {
          recordList.append(li)
        } else {
          recordList.insertBefore(li, recordList.firstChild)
        }
        return false

      });


      document.getElementById('stop').addEventListener('click', function() {
        if(timerStart) {
          clearInterval(timerStart)
          endTime = Date.now()
        }
      });

      document.getElementById('reset').addEventListener('click', function() {
        if(timerStart) {
          clearInterval(timerStart)

          stTime = 0
          min = 0
          sec = 0
          millisec = 0

          document.getElementById('min').innerText = '00'
          document.getElementById('sec').innerText = '00'
          document.getElementById('millisec').innerText = '00'
          timerStart = null
        }
      });



    </script>



  </body>
</html>


