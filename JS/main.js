/////////////////////////* Progress bar for site *////////////////////////



//////////////////Focus search field on page load//////////////////////
$(document).ready(function() {
    $('.searchfield').focus();
});


//////////////////Changes the color scheme of the site on page load//////////////////////

//Choose a random color
RandomColor = function() {
    colors = ['aqua', 'green', 'blue', 'purple', 'red', 'dark_blue', 'orange']
    return colors[Math.floor(Math.random()*colors.length)];
}

RandomColor();

//After random color is chosen, these styles are applied
	function pagecolor (color, lightcolor, logo) {		
		//Changes border color on buttons
		$(".button").css("border-color", color);
		//Changes text color on buttons
		$(".button").css("color", color);
		//Changes bottom border on buttons for more detail
		//$(".nav").css("border-bottom-color", color);
		//Changes color of links in the footer to match everything else
		$("a").css("color", color);
		//Updates to the logo with the correct color in it
		$(".logo").replaceWith("<img src='images/logos/" + logo + "' class='logo'>");
		//Changes the background color on the register button
		$(".registerbutton").css("background", lightcolor);
		//Changes the text color on register button
		$(".registerbutton").css("color", "white");
		//Changes border on the register button to give it a better look
		$(".registerbutton").css("border-color", lightcolor + lightcolor + color);
		//Adds the hover class to the search and submit buttons and updates
		//their color when hovered over and returns it back
		$(".hoverbutton").hover(function() {
			$(this).css("color","white");
			$(this).css("background", lightcolor);
				}, function() {
			$(this).css("color", color)
			$(this).css("background","transparent");});		
		//Adds the hover class to the register button and updates
		//its color when hovered over and returns it back
		$(".registerbutton").hover(function() {
			$(this).css("background", color);
				}, function() {
			$(this).css("background", lightcolor);});
    //Color of progress bar
    $(".pace .pace-progress").css("background", color);
	}


//The specific colors and logo that are applied for each color style
	 if (RandomColor()=='aqua') {
pagecolor("#16A085", "#1ABC9C", "logo-aqua.png");
 }

else if (RandomColor()=='green') {
pagecolor("#27AE60", "#2ECC71", "logo-green.png");
 }

else if (RandomColor()=='blue') {
pagecolor("#2980B9", "#3498DB", "logo-blue.png");
 }

else if (RandomColor()=='purple') {
pagecolor("#8E44AD", "#9B59B6", "logo-purple.png");
 }

else if (RandomColor()=='red') {
pagecolor("#C0392B", "#E74C3C", "logo-red.png");
 }

else {
pagecolor("#F39C12", "#F1C40F", "logo-orange.png");
 }

 function tog(v){return v?'addClass':'removeClass';} 

$(document).on('input', '.clearable', function(){
    $(this)[tog(this.value)]('x');
}).on('mousemove', '.x', function( e ){
    $(this)[tog(this.offsetWidth-18 < e.clientX-this.getBoundingClientRect().left)]('onX');   
}).on('click', '.onX', function(){
    $(this).removeClass('x onX').val('');
});



	