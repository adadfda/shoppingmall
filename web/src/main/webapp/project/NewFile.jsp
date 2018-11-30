<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script type="text/javascript">
  $(function(){
     var now=new Date();
     var now1=new Date();
     //alert(now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate());
     var year=now.getFullYear();
     var month=parseInt(now.getMonth()+1)<10?("0"+(now.getMonth()+1)):(now.getMonth()+1);
     //var month2=parseInt(now.getMonth()+2)<10?("0"+(now.getMonth()+2)):(now.getMonth()+2);
     var day=parseInt(now.getDate())<10?+"0"+(now.getDate()):(now.getDate());
    $("input#birth").attr("min",year+"-"+month+"-"+day);
     now1.setDate(now.getDate()+5);     
     var year2=now1.getFullYear();
     var month2=parseInt(now1.getMonth()+1)<10?("0"+(now1.getMonth()+1)):(now1.getMonth()+1);
     //var month2=parseInt(now.getMonth()+2)<10?("0"+(now.getMonth()+2)):(now.getMonth()+2);
     
     var day2=now1.getDate()<10?"0"+(now1.getDate()):(now1.getDate());
     
    // alert(year2+"-"+month2+"-"+day2);
    $("input#birth").attr("max",year2+"-"+month2+"-"+day2);
    
    
   //$("input#birth").attr("max",year+"-"+month+"-"+day2);    
    $("input[type='button']").click(function(e){
      //$("form[name='frm1']").submit(); 
    });
  });
</script>
</head>
<body>
   <header>FORMDATA</header>
   <section>
       <form action="html4Result.jsp" method="post" name="frm1">
          <fieldset style="width: 30%">
               <legend> 필수항목</legend>
          <ul>
             <li>
               <label>머리둘레</label>
               <input id="head_size" name="head_size" 
                        type="number" min="60" max=100  autofocus="autofocus" required="required"> 
             </li>
             <li>
                 <label>이름</label>
                 <input id="name" name="name" type="text" minlength="2" maxlength="4" placeholder="이름은 4글자까지">
             </li>
             <li>
                <label>이메일</label>
                <input type="email" name="email" placeholder="host@nate.com">
             </li>
          </ul>
          </fieldset>
          <fieldset style="width: 30%">
          <legend> 선택항목</legend>
            <ul>
              <li>
                <label>연락처</label>
                <input id="phone" name="pnone" type="tel" placeholder="00**-000*-0000"  pattern="\d{2,4}-?\d{3,4}-?\d{4}">
              </li>
              <li>
                 <label>생일</label>
                 <input id="birth" name="birth" type="date">
                 
              </li>
            </ul>
          </fieldset>
          <input type="submit" value="Send">
       </form>
   </section>

</body>
</html>
