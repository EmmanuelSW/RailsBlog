# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "form#comments-form", (ev,data)->
	console.log data
	$(this).find("textarea").val("")
	$("#comments-box").append(" <div class='card grey lighten-4' id='comments-box'>
								    <div class='card-content'>
										#{data.body}<br>
										<hr>
										#{data.user.email}
									</div>
								</div>")
