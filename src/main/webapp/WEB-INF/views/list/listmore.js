var pageNo = 0;
//결과 더보기
$("#moreBtn").on("click", function () {
      $.ajax({
            type:'GET',
            url : '/list/reviewlist.jsp',
            global : false,
            async : true,
            data : {
                  pageNo: pageNo
            },
            success : function(json) {
                  $('#listBody').empty();
                   var html = '';
                  pageNo = pageNo+1;
                  json.listBody.forEach(function(item, index){
                        html = $('<li class="result-item">' +
                          '<p class="result-day">'+item.content+' <span>'+item.writer+'</span></p>' +
                          '<dl class="result-detail">' +
                          '<dt>품명</dt>' +
                          '<dt>금액</dt>' 
                          );
                        $('#listBody').append(html);
                  });
            },error:function(json){
            
        }  
        });
    });