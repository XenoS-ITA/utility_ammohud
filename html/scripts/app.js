window.addEventListener('message', function(event){		
	let data = event.data;
		
	if (data.ammo !== null) { $(".ammo").html(data.ammo) }
	if (data.maxammo !== null) { $(".maxammo").html(data.maxammo) }
})