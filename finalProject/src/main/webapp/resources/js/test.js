function doAjaxPost(id) {
    // get the form values
    //var id = $(this);
	var qty = id+'qty';
    var quantity = $('#'+qty).val();
	//get table tbody
	var scntDiv = $('#p_scents');


    $.ajax({
        type: "POST",
        url: "AddToCart",
        data: "id=" + id + "&quantity=" + quantity,
        success: function(response){
            // we have the response
            if(response.status == "SUCCESS"){
				$('input.orderQty').val("1");
				var name = response.result.dish.name;
				var cat = response.result.dish.category;
				var price =response.result.dish.price*quantity;
				
               scntDiv.append('<tr><td>'+name+'</td><td>'+cat+'</td><td>'+quantity+'</td> <td> $'+price.toFixed(1)+'</td></tr>');   
			   scntDiv.refresh();
             }else{
                 alert('Quantity is required and cannot exceed 5!');
             }
         },
         error: function(e){
             alert('Error: ' + e);
         }
    });
}


function doAjaxPostSendReview(id) {
    // get the form values\
    var reviewContent = $('#btn-input').val();
	var ratingInput = $('#ratingInput').val();
	//get table tbody
	var chatul = $('#chatul');


    $.ajax({
        type: "POST",
        url: "AddReviewContent",
        data: "resId=" + id + "&content=" + reviewContent + "&rating=" + ratingInput,
        success: function(response){
            // we have the response
            if(response.status == "SUCCESS"){
				$('input.orderQty').val("");
				var rating = response.result.rating/2;
				var date = response.result.date;
				var content =response.result.content;
				
				
				
               chatul.append('<li class="left clearfix"><span class="chat-img pull-left"><img class="img-circle" src="resources/img/user/1.jpg" alt="Visit Computer Hope"> </span>  <div class="chat-body clearfix"><div class="header"><div class="list-inline"> <strong style="float:left" class="primary-font">${restaurantReview.customer.name} &nbsp;&nbsp;&nbsp;</strong><input style="float:left"  id="input-6a" class="rating" data-size="xs" value="'+rating+'" data-show-clear="false" data-show-caption="true" data-readonly="true"><small class="pull-right text-muted"><i class="fa fa-clock-o fa-fw"></i> <fmt:formatDate value="'+date+'"pattern="yyyy-MM-dd" /></small></div></div><p>'+content+' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur</p></div></li>');location.reload();
			   
             }else{
                 alert('Review Content is required');
             }
         },
         error: function(e){
             alert('Error: ' + e);
         }
    });
}

function doAjaxPostDeleteReview(id) {
    // get the form values
	var reviewTable = $('#reviewTable');
	var id2= $(this).prev().prev().attr("name");
	var parent = $(this).parent().parent().parent();


    $.ajax({
        type: "POST",
        url: "DeleteReviewContent",
        data: "id=" + id2,
        success: function(response){
            // we have the response
            if(response.status == "SUCCESS"){
				parent.fadeOut('slow', function() {$(this).remove();});
             }else{
                 alert('Quantity is required and cannot exceed 5!');
             }
         },
         error: function(e){
             alert('Error: ' + e);
         }
    });
}

function doAjaxPostDeleteDish(id) {
    // get the form values
	var reviewTable = $('#reviewTable');
	var parent = $(this).parent().parent();


    $.ajax({
        type: "POST",
        url: "DeleteDish",
        data: "id=" + id,
        success: function(response){
            // we have the response
            if(response.status == "SUCCESS"){
				parent.fadeOut('slow', function() {$(this).remove();});
             }else{
                 alert('Delete Failed!');
             }
         },
         error: function(e){
             alert('Error: ' + e);
         }
    });
}

$(document).ready(function() {
    $('#loginForm').formValidation({
        framework: 'bootstrap',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            email: {
                validators: {
                    notEmpty: {
                        message: 'The username is required'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The username must be more than 6 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'The username can only consist of alphabetical, number, dot and underscore'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required'
                    }
                }
            }
        }
    });
});                            