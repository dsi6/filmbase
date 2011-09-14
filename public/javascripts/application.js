$.fn.countAge=function(){
	var d = new Date();
	var year = d.getFullYear();
	var film_year = parseInt($(this).val());
	if(year>film_year){
		var res = year- film_year;
	}else{
		var res = 0;
	}
	$(this).closest(".year").find(".hint .age").html(res);
};
$(function() {
	//alert("Добро пожаловать");
  $("#film_person_tokens").tokenInput("/people.json", {
    crossDomain: false,
    prePopulate: $("#film_person_tokens").data("pre"),
    theme: 'facebook',
    hintText: 'Введите имя актера',
    noResultsText: 'Не найдено',
    searchingText: "Поиск..."
  });
});

