$(document).ready(function(){
      $("#message_stock_number").change(
        function(){
        var stock_number=$("#message_stock_number").val();
        $("#numberisright").load("pages/about?stock_number="+stock_number);  
        });
      
      $("#message_lilyid").change(
        function(){
        var lilyid=$("#message_lilyid").val();
        $("#idisright").load("pages/about?lilyid="+lilyid);  
        });

       $("#new_m").click(
        function(){
          flag1=$("#numberisright").text();
          flag2=$("#idisright").text();
          if(flag1.match("true")&&flag2.match("true")){
              alert("添加成功");
          }else{
             alert("股票代码填写错误!");
             return false;
           }
        });
    });
